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

#ifndef _APA102_H
#define _APA102_H

#ifdef GD32F10X_MD
#define GD32_SPL
#else
#define STM32_HAL
#endif

#include <stdint.h>

#ifdef GD32_SPL
#include <gd32f10x.h>
#endif

#ifdef STM32_HAL
#include "stm32f1xx.h"
#endif
// Set this to the amount of LEDs in the string.
//
#define LED_BUFF_SZ 30U

// Buffer Bounds Check option
//
#define APA_RANGE_CHECK

// Set which SPI port you are using (for GD32) here.
//
#ifdef GD32_SPL
#define LED_SPI_PORT SPI0
#endif

// Highest LED address
//
#define MAX_LED ( LED_BUFF_SZ - 1 )

#define APA_STOPS_TO_SEND ( (LED_BUFF_SZ + 1) / 2 < 2 ? 2 : (LED_BUFF_SZ + 1) / 2 )

#define APA_BRIGHTNESS_MASK   0b11100000
#define APA_BRIGHTNESS_MAX    31

// Optional gamma correction (commonly 2.2 or 2.8 for LEDs)
//#define APA_GAMMA_CORRECT

#ifdef APA_GAMMA_CORRECT
#define APA_GAMMA             2.8
#endif

// Guarantee that TRUE is defined
//
#ifndef TRUE
#define TRUE 1
#endif

// This is the structure that holds your LED values.
//
typedef struct
{
  uint8_t master_bright;
  uint8_t blue;
  uint8_t green;
  uint8_t red;

} led_frame_st;

// This is the structure that holds your LED values.
//
typedef struct
{
  uint8_t master_bright;
  uint8_t blue;
  uint8_t green;
  uint8_t red;

} led_pixelRGB_st;


typedef struct
{
  uint8_t master_bright;
  uint8_t hue;
  uint8_t sat;
  uint8_t vel;

} led_pixelHSV_st;


// Return status
//
typedef enum
{
  APA_OK, APA_out_of_range, APA_unknown_err
} APA_Status_t;

typedef struct
{
  uint8_t red;
  uint8_t green;
  uint8_t blue;
} APA_colour_st;

#define APA_COLOUR_BLACK   { 0,   0,   0  }
#define APA_COLOUR_WHITE   { 255, 255, 255 }
#define APA_COLOUR_RED     { 255, 0,   0  }
#define APA_COLOUR_GREEN   { 0,   255, 0   }
#define APA_COLOUR_BLUE    { 0,   0,   255 }
#define APA_COLOUR_YELLOW  { 255, 255, 0  }
#define APA_COLOUR_CYAN    { 0,   255, 255 }
#define APA_COLOUR_MAGENTA { 255, 0,   255 }
#define APA_COLOUR_ORANGE  { 255, 165, 0  }
#define APA_COLOUR_PURPLE  { 128, 0,   128 }
#define APA_COLOUR_PINK    { 255, 192, 203 }
#define APA_COLOUR_LIME    { 0,   255, 0   }
#define APA_COLOUR_AQUA    { 0,   255, 255 }
#define APA_COLOUR_MAROON  { 128, 0,   0   }
#define APA_COLOUR_NAVY    { 0,   0,   128 }
#define APA_COLOUR_OLIVE   { 128, 128, 0   }
#define APA_COLOUR_TEAL    { 0,   128, 128 }


// Exported functions
//
        void              APA_Init            ( void );
        void              APA_sendBuffer      ( void );
        void              APA_Clear           ( void );

        APA_Status_t      APA_SetPixel        (
                                                uint8_t pixel, uint8_t intensity,
                                                uint8_t red, uint8_t green, uint8_t blue );

        APA_Status_t      APA_SetRange        ( uint16_t st_pixel,
                                                uint16_t end_pixel,
                                                uint8_t intensity,
                                                uint8_t red, uint8_t green, uint8_t blue
                                              );
        APA_Status_t      APA_SetPixelHSV     ( 
                                                uint16_t pixel,
                                                uint8_t intensity,
                                                uint8_t hue, uint8_t sat, uint8_t vel
                                              );
        APA_Status_t      APA_SetPixelRangeHSV(
                                                uint16_t st_pixel,
                                                uint16_t end_pixel,
                                                uint8_t intensity,
                                                uint8_t hue, uint8_t sat, uint8_t vel
                                              );
                     
        led_pixelRGB_st   APA_ConvHSVtoRGB    ( uint8_t hue, uint8_t sat, uint8_t vel );
        led_pixelHSV_st   APA_ConvRGBtoHSV    ( uint8_t red, uint8_t green, uint8_t blue );

        led_pixelRGB_st   APA_GetPixelRGB     ( uint16_t pixel );
        led_pixelHSV_st   APA_GetPixelHSV     ( uint16_t pixel );

        led_frame_st* APA_GetBufferPointer( void );

        APA_Status_t      APA_SetPixelColour  ( uint16_t pixel, uint8_t intensity, APA_colour_st colour );
        APA_Status_t      APA_SetRangeColour  (
                                                uint16_t st_pixel,
                                                uint16_t end_pixel,
                                                uint8_t intensity,
                                                APA_colour_st colour
                                              );

#endif // _APA102_H
