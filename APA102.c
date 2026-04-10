/*
 * MIT License

Copyright (c) 2025 Jennifer Gunn.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

#include "APA102.h"
#include "APA102_hw_backend.h"
#include <math.h>

// Private variables
//
static led_frame_st  led_buffer[ LED_BUFF_SZ ]   = { 0 };
static uint16_t      led_count                   = LED_BUFF_SZ;
static led_frame_st  startSignal                 = { 0 };
static led_frame_st  stopSignal                  = { 0xFF, 0xFF, 0xFF, 0xFF };

#ifdef APA_GAMMA_CORRECT
static const uint8_t gamma_table[256] = {
    0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
    0,   0,   0,   0,   0,   0,   0,   0,   1,   1,   1,   1,   1,   1,   1,   1,
    1,   1,   2,   2,   2,   2,   2,   2,   3,   3,   3,   3,   3,   4,   4,   4,
    4,   5,   5,   5,   5,   6,   6,   6,   6,   7,   7,   7,   8,   8,   8,   9,
    9,   9,  10,  10,  11,  11,  11,  12,  12,  13,  13,  13,  14,  14,  15,  15,
   16,  16,  17,  17,  18,  18,  19,  19,  20,  20,  21,  22,  22,  23,  23,  24,
   25,  25,  26,  27,  27,  28,  29,  29,  30,  31,  32,  32,  33,  34,  35,  35,
   36,  37,  38,  39,  40,  40,  41,  42,  43,  44,  45,  46,  47,  48,  49,  50,
   51,  52,  53,  54,  55,  56,  57,  58,  59,  60,  61,  62,  63,  65,  66,  67,
   68,  69,  71,  72,  73,  74,  76,  77,  78,  80,  81,  82,  84,  85,  87,  88,
   89,  91,  92,  94,  95,  97,  98, 100, 101, 103, 104, 106, 108, 109, 111, 112,
  114, 116, 117, 119, 121, 122, 124, 126, 128, 129, 131, 133, 135, 136, 138, 140,
  142, 144, 146, 148, 149, 151, 153, 155, 157, 159, 161, 163, 165, 167, 169, 171,
  173, 175, 177, 179, 181, 184, 186, 188, 190, 192, 194, 197, 199, 201, 203, 206,
  208, 210, 212, 215, 217, 219, 222, 224, 226, 229, 231, 234, 236, 238, 241, 243,
  246, 248, 251, 253, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255
};
#endif

/* Private functions */
static  void          sendStop            ( void );
static  void          sendStart           ( void );
static  uint16_t      getStopFrames       ( void );
#ifdef APA_GAMMA_CORRECT
static  uint8_t       applyGamma          ( uint8_t value );
#endif


static uint16_t getStopFrames( void )
{
  uint16_t stop_frames = ( led_count + 1U ) / 2U;

  return ( stop_frames < 2U ) ? 2U : stop_frames;
}


/** Send the start signal to the LED string
  *
  * param:  none
  * retval: none
  */
static void sendStart( void )
{
  APA_HW_SPI_BlockSend( &startSignal.master_bright, 4 );
}


/** Send the stop signal to the LED string
  *
  * param:  none
  * retval: none
  */
static void sendStop( void )
{
  for( uint16_t num_of_stops = getStopFrames(); num_of_stops > 0; num_of_stops-- )
  {
    APA_HW_SPI_BlockSend( &stopSignal.master_bright, 4 );
  } 
}

#ifdef APA_GAMMA_CORRECT
static uint8_t applyGamma( uint8_t value )
{
  return gamma_table[value];
}
#endif


// Exported functions
//

/** Initialise the APA102C LED string
  *
  * param:  none
  * retval: none
  */
void APA_Init( void )
{
  APA_SetRange( 0, led_count - 1U, 31, 0, 0, 0 );
  APA_sendBuffer();
}


/** Set the buffer size for the APA102C LED string
  *
  * param:  uint16_t led_count_new. The new buffer size.
  * retval: APA_Status_t
  */
APA_Status_t APA_SetBufferSize( uint16_t led_count_new )
{
  if ( ( led_count_new == 0U ) || ( led_count_new > LED_BUFF_SZ ) )
  {
    return APA_invalid_config;
  }

  led_count = led_count_new;

  return APA_OK;
}


/** Get the current buffer size for the APA102C LED string
  *
  * param:  none
  * retval: uint16_t. The current buffer size.
  */
uint16_t APA_GetBufferSize( void )
{
  return led_count;
}


/** Updates the APA102C string from the buffer
  *
  * param:  none
  * retval: none
  */
void APA_sendBuffer( void )
{
  sendStart();
  APA_HW_SPI_BlockSend( &led_buffer[0].master_bright, led_count * sizeof( led_frame_st ) );
  sendStop();
}


/* Clear all pixels
 *
 * param: none
 * retval: none
*/
void APA_Clear( void )
{
  APA_SetRange( 0, led_count - 1U, 31, 0, 0, 0 );
  APA_sendBuffer();
}


/** Sets the specified pixel.  Does not push the change to the string.
  *
  * param: uint8_t pixel. The pixel you wish to set.
  * param: uint8_t intensity.  Any value from 0-31 for the LED's global brightness.
  * param: uint8_t red.  The amount of red from 0-255.
  * param: uint8_t green.  The amount of green from 0-255.
  * param: uint8_t blue.  The amount of blue from 0-255.
  * retval: APA_Status_t
  */
APA_Status_t APA_SetPixel ( uint8_t pixel, uint8_t intensity, uint8_t red, uint8_t green, uint8_t blue  )
{
#ifdef APA_RANGE_CHECK
  if ( pixel >= led_count )
  {
    return APA_out_of_range;
  }

  /* Limit brightness raqnge */
  if ( intensity > APA_BRIGHTNESS_MAX )
  {
    intensity = APA_BRIGHTNESS_MAX;
  }
#endif
  led_buffer[pixel].master_bright   = intensity | APA_BRIGHTNESS_MASK;
#ifdef APA_GAMMA_CORRECT
  led_buffer[pixel].red             = applyGamma( red );
  led_buffer[pixel].green           = applyGamma( green );
  led_buffer[pixel].blue            = applyGamma( blue );
#else
  led_buffer[pixel].red             = red;
  led_buffer[pixel].green           = green;
  led_buffer[pixel].blue            = blue;
#endif

  return APA_OK;
}


/** Set a range of pixels to a specified state
  *
  * param: uint16_t st_pixel.  The starting pixel to set.
  * param: uint16_t end_pixel.  The last pixel to set.
  * param: uint8_t intensity.  The global brightness (0-31) to use.
  * param: uint8_t red.  The amount of red to use.
  * param: uint8_t green.  The amount of green to use.
  * param: uint8_t blue.  The amount of blue to use.
  * retval: APA_Status_t.
  */
APA_Status_t APA_SetRange( uint16_t st_pixel, uint16_t end_pixel, uint8_t intensity,
                           uint8_t red, uint8_t green, uint8_t blue )
{
#ifdef APA_RANGE_CHECK
  if (  ( st_pixel  >= led_count )   ||
        ( end_pixel >= led_count )   ||
        ( st_pixel  > end_pixel )
     )
  {
    return APA_out_of_range;
  }
  if ( intensity > APA_BRIGHTNESS_MAX )
  {
    intensity = APA_BRIGHTNESS_MAX;
  }
#endif

  uint16_t curr_pixel;

  curr_pixel = st_pixel;

  while ( curr_pixel <= end_pixel )
  {
    led_buffer[curr_pixel].master_bright  = intensity | APA_BRIGHTNESS_MASK;
#ifdef APA_GAMMA_CORRECT
    led_buffer[curr_pixel].red            = applyGamma( red );
    led_buffer[curr_pixel].green          = applyGamma( green );
    led_buffer[curr_pixel].blue           = applyGamma( blue );
#else
    led_buffer[curr_pixel].red            = red;
    led_buffer[curr_pixel].green          = green;
    led_buffer[curr_pixel].blue           = blue;
#endif
    curr_pixel++;
  }

  return APA_OK;
}


/** Sets a pixel to the HSV colour specified
  *
  * param: pixel.  The pixel to set.
  * param: intensity.  The master brightness of the pixel in question.  This is separate from the velocity.
  * param: hue.  The colour to set in HSV colourspace.
  * param: sat.  The saturation of pixel's colour.
  * param: vel.  The intensity of the pixel, outside of the master brightness.
  * retval: APA_Status_t.
  *
  */
APA_Status_t APA_SetPixelHSV( uint16_t pixel, uint8_t intensity, uint8_t hue, uint8_t sat, uint8_t vel )
{
#ifdef APA_RANGE_CHECK
  if ( pixel >= led_count ) return APA_out_of_range;
  /* Limit brightness raqnge */
  if ( intensity > APA_BRIGHTNESS_MAX )
  {
    intensity = APA_BRIGHTNESS_MAX;
  }
#endif

  led_pixelRGB_st rgb_set;

  rgb_set = APA_ConvHSVtoRGB( hue, sat, vel );
  rgb_set.master_bright = intensity | APA_BRIGHTNESS_MASK;

  APA_SetPixel( pixel, rgb_set.master_bright, rgb_set.red, rgb_set.green, rgb_set.blue);

  return APA_OK;
}


/** Sets a pixel range to the HSV colour specified
  *
  * param: st_pixel.  The first pixel in the range to set.
  * param: end_pixel.  The last pixel in the range to set.
  * param: intensity.  The master brightness of the pixels in question.  This is separate from the velocity.
  * param: hue.  The colour to set in HSV colourspace.
  * param: sat.  The saturation of pixels colour.
  * param: vel.  The intensity of the pixels, outside of the master brightness.
  * retval: none
  *
  */
APA_Status_t APA_SetPixelRangeHSV( uint16_t st_pixel, uint16_t end_pixel, uint8_t intensity, uint8_t hue, uint8_t sat, uint8_t vel )
{
#ifdef APA_RANGE_CHECK
  if( 
      ( st_pixel >= led_count )    || 
      ( end_pixel >= led_count )   ||
      ( st_pixel  > end_pixel )
    ) {
        return APA_out_of_range;
      }
#endif

  led_pixelRGB_st rgb_set = APA_ConvHSVtoRGB( hue, sat, vel );

  for( uint16_t curr_pixel = st_pixel; curr_pixel <= end_pixel; curr_pixel++ )
  {
    APA_SetPixel( curr_pixel, intensity, rgb_set.red, rgb_set.green, rgb_set.blue );
  }
  return APA_OK;
}


/* Get the pixel parameters from the buffer in RGB format
 *
 * param: uint16_t pixel.  The pixel to get.
 * retval: led_pixelRGB_st.  The structure containing the pixel's data in RGB format.
*/
led_pixelRGB_st APA_GetPixelRGB( uint16_t pixel )
{
  led_pixelRGB_st working_pixel = {0};

#ifdef APA_RANGE_CHECK
  if ( pixel >= led_count  )
  {
    return working_pixel;
  }
#endif  

  working_pixel.red = led_buffer[ pixel ].red;
  working_pixel.green = led_buffer[ pixel ].green;
  working_pixel.blue = led_buffer[ pixel ].blue;
  
  return working_pixel;
}


/* Get pixel parameters from the buffer in HSV format 
 * param: uint16_t pixel.  The pixel to get.
 * retval: led_pixelHSV_st.  The structure containing the pixel's data. 
 */
led_pixelHSV_st APA_GetPixelHSV( uint16_t pixel )
{
#ifdef APA_RANGE_CHECK
  if ( pixel >= led_count  )
  {
    led_pixelHSV_st invalid = {0};
    return invalid;
  }
#endif  

  led_frame_st rgb_pixel;
  led_pixelHSV_st hsv_pixel;

  rgb_pixel = led_buffer[ pixel ];

  hsv_pixel = APA_ConvRGBtoHSV( rgb_pixel.red, rgb_pixel.green, rgb_pixel.blue );
  hsv_pixel.master_bright = rgb_pixel.master_bright & 0b00011111; // Copy over master brightness

  return hsv_pixel;
}


/* Convert RGB to HSV 
 * 
 * param: uint8_t red.  The amount of red in the colour.
 * param: uint8_t green.  The amount of green in the colour.
 * param: uint8_t blue.  The amount of blue in the colour.
 * retval: led_pixelHSV_st.  This contains the hue, saturation and value.
 *
 * Note: This does not set the master brightness bits.
 */
led_pixelHSV_st APA_ConvRGBtoHSV( uint8_t red, uint8_t green, uint8_t blue )
{
  led_pixelHSV_st hsv_out;
  uint8_t min, max, delta;

  min = red < green ? red : green;
  min = min  < blue ? min  : blue;

  max = red > green ? red : green;
  max = max  > blue ? max  : blue;

  hsv_out.vel = max; // Value

  delta = max - min;

  if ( max != 0 )
  {
    hsv_out.sat = ( delta * 255 ) / max; // Saturation
  }
  else
  {
    // r = g = b = 0
    hsv_out.sat = 0;
    hsv_out.hue = 0; // Hue undefined
    return hsv_out;
  }

  // Compute hue
  //
  if ( red == max )
  {
    hsv_out.hue = ( ( green - blue ) * 43 ) / delta; // Hue
  }
  else if ( green == max )
  {
    hsv_out.hue = ( ( blue - red ) * 43 ) / delta + 85; // Hue
  }
  else
  {
    hsv_out.hue = ( ( red - green ) * 43 ) / delta + 171; // Hue
  }

  if ( hsv_out.hue < 0 )
  {
    hsv_out.hue += 256;
  }

  return hsv_out;
} 


/** Calculate RGB from HSV colourspace
  *
  * param: uint8_t hue. This is the colour
  * param: uint8_t sat. The saturation of the colour
  * param: uint8_t vel. Intensity of the colour
  * retval: led_pixelRGB_st.  This contains the red, green and blue parts.
  *
  */
led_pixelRGB_st APA_ConvHSVtoRGB( uint8_t hue, uint8_t sat, uint8_t vel )
{
  led_pixelRGB_st rgb_out;

  // Convert from RGB to HSV
  //
  hue = (hue * 192) / 256;                        // 0..191
  uint8_t i = hue / 32;                           // Set our range of 0 through 5
  uint8_t f = (hue % 32) * 8;                     // 'fractional' part of 'i' 0..248 in jumps

  uint8_t sInv = 255 - sat;                       // 0 -> 0xFF, 0xFF -> 0
  uint8_t fInv = 255 - f;                         // 0 -> 0xFF, 0xFF -> 0
  uint8_t pv = vel * sInv / 256;                  // pv will range 0 to 255
  uint8_t qv = vel * (256 - sat * f / 256) / 256;
  uint8_t tv = vel * (256 - sat * fInv / 256) / 256;

  switch( i )
  {
    case 0:
      rgb_out.red = vel;
      rgb_out.green = tv;
      rgb_out.blue = pv;
      break;

    case 1:
      rgb_out.red = qv;
      rgb_out.green = vel;
      rgb_out.blue = pv;
      break;

    case 2:
      rgb_out.red = pv;
      rgb_out.green = vel;
      rgb_out.blue = tv;
      break;

    case 3:
      rgb_out.red = pv;
      rgb_out.green = qv;
      rgb_out.blue = vel;
      break;

    case 4:
      rgb_out.red = tv;
      rgb_out.green = pv;
      rgb_out.blue = vel;
      break;

    case 5:
      rgb_out.red = vel;
      rgb_out.green = pv;
      rgb_out.blue = qv;
      break;
  }
  return rgb_out;
}


/** Get a pointer to the start of the LED buffer
  *
  * param: none
  * retval: led_frame_st*.  Pointer to the start of the LED buffer.
  */
led_frame_st* APA_GetBufferPointer ( void )
{
  return &led_buffer[0];
}


APA_Status_t APA_SetPixelColour( uint16_t pixel, uint8_t intensity, APA_colour_st colour )
{
  return APA_SetPixel( pixel, intensity, colour.red, colour.green, colour.blue );
}


APA_Status_t APA_SetRangeColour( uint16_t st_pixel, uint16_t end_pixel, uint8_t intensity, APA_colour_st colour )
{
  return APA_SetRange( st_pixel, end_pixel, intensity, colour.red, colour.green, colour.blue );
}
