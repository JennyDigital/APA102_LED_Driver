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
// Private variables
//
static led_frame_st  led_buffer[ LED_BUFF_SZ ];
static led_frame_st  startSignal                 = {0};
static led_frame_st  stopSignal                  = { 0xFF, 0xFF, 0xFF, 0xFF };

#ifdef STM32_HAL
// This will need setting to whichever SPI port you are using
// ...also referenced in SPI_Blocksend.
//
extern SPI_HandleTypeDef hspi1;
#endif


/* Private functions */
static  void          SPI_BlockSend       ( uint8_t * data, uint16_t length );
static  void          sendStop            ( void );
static  void          sendStart           ( void );


/** Send the start signal to the LED string
  *
  * param:  none
  * retval: none
  */
static void sendStart( void )
{
  SPI_BlockSend( &startSignal.master_bright, 4 );
}


/** Send the stop signal to the LED string
  *
  * param:  none
  * retval: none
  */
static void sendStop( void )
{
  for(  uint8_t num_of_stops = APA_STOPS_TO_SEND; num_of_stops > 0; num_of_stops-- )
  {
    SPI_BlockSend( &stopSignal.master_bright, 4 );
  } 
}


/** Transmit multiple uint8_ts of data as a block.
  *
  * param:  uint8_t *data.  This is the start of the block of data.
  * param:  uint16_t length.  The quantity of byttes to be transmitted
  * retval: none
  *
  */
static void SPI_BlockSend( uint8_t * data, uint16_t length )
{
#ifdef GD32_SPL
  uint16_t value;
  
  for( uint16_t count = 0; count < length; count++ )
  {
    value = (uint16_t) (*data);

    data++;

    spi_i2s_data_transmit( LED_SPI_PORT, value );

    // We use this flag because we aren't receiving anything.
    //
    while( spi_i2s_flag_get( LED_SPI_PORT, SPI_FLAG_TBE ) == RESET );
  }
#endif

#ifdef STM32_HAL
  // Please note that if you wish to use another SPI port this will need changing.
  //
  HAL_SPI_Transmit( &hspi1, data, length, 100 );
#endif

}


// Exported functions
//

/** Initialise the APA102C LED string
  *
  * param:  none
  * retval: none
  */
void APA_Init( void )
{
  APA_SetRange( 0, MAX_LED, 31, 0, 0, 0 );
  APA_sendBuffer();
}


/** Updates the APA102C string from the buffer
  *
  * param:  none
  * retval: none
  */
void APA_sendBuffer( void )
{
  sendStart();
  SPI_BlockSend( &led_buffer[0].master_bright, sizeof( led_buffer ) );
  sendStop();
}


/* Clear all pixels
 *
 * param: none
 * retval: none
*/
void APA_Clear( void )
{
  APA_SetRange( 0, MAX_LED, 31, 0, 0, 0 );
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
  if ( pixel > MAX_LED )
  {
    return APA_out_of_range;
  }

#endif
  led_buffer[pixel].master_bright   = intensity | 0b11100000;
  led_buffer[pixel].red             = red;
  led_buffer[pixel].green           = green;
  led_buffer[pixel].blue            = blue;

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
  if ( ( st_pixel > MAX_LED ) || ( end_pixel > MAX_LED ))
  {
    return APA_out_of_range;
  }
#endif

  uint16_t curr_pixel;

  curr_pixel = st_pixel;

  while ( curr_pixel <= end_pixel )
  {
    led_buffer[curr_pixel].master_bright  = intensity | 0b11100000;
    led_buffer[curr_pixel].red            = red;
    led_buffer[curr_pixel].green          = green;
    led_buffer[curr_pixel].blue           = blue;
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
  if ( pixel > MAX_LED ) return APA_out_of_range;
#endif

  led_frame_st rgb_set;

  rgb_set = APA_ConvHSVtoRGB( hue, sat, vel );
  rgb_set.master_bright = intensity | 0b11100000;

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
  if( ( st_pixel > MAX_LED ) || ( end_pixel > MAX_LED ) ) return APA_out_of_range;
#endif

  for( uint16_t curr_pixel = st_pixel; curr_pixel <= end_pixel; curr_pixel++ )
  {
    APA_SetPixelHSV( curr_pixel, intensity, hue, sat, vel );
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
#ifdef APA_RANGE_CHECK
  if ( pixel > MAX_LED  )
  {
    led_frame_st invalid = {0};
    return invalid;
  }
#endif  

  return (led_frame_st) led_buffer[ pixel ];
}

/* Get pixel parameters from the buffer in HSV format 
 * param: uint16_t pixel.  The pixel to get.
 * retval: led_pixelHSV_st.  The structure containing the pixel's data. 
 */
led_pixelHSV_st APA_GetPixelHSV( uint16_t pixel )
{
#ifdef APA_RANGE_CHECK
  if ( pixel > MAX_LED  )
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
