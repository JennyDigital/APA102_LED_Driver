#ifndef _APA102_H
#define _APA102_H
#include <gd32f10x.h>

// Set this to the amount of LEDs in the string.
//
#define LED_BUFF_SZ 30

// Defines for different libraries used.
//
#define GD32_SPL        // For the GD32 line of mcu's.
//#define STM32_HAL     // For the ever wonderful ST32's

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

// Private functions
//
static  void          SPI_BlockSend       ( uint8_t * data, uint16_t length );
static  void          sendStop            ( void );
static  void          sendStart           ( void );

// Exported functions
//
        void          APA_Init            ( void );
        void          APA_sendBuffer      ( void );
        void          APA_SetPixel        ( uint8_t pixel, uint8_t intensity,
                                            uint8_t red, uint8_t green, uint8_t blue );
led_frame_st          APA_GetPixel        ( uint16_t pixel_to_get );
        void          APA_SetRange        ( uint16_t st_pixel, uint16_t end_pixel, uint8_t intensity,
                                            uint8_t red, uint8_t green, uint8_t blue );
        led_frame_st  APA_HSVtoRGB        ( uint8_t hue, uint8_t sat, uint8_t vel );
        void          APA_SetPixelHSV     ( uint16_t pixel, uint8_t intensity, uint8_t h, uint8_t s, uint8_t v );
        void          APA_SetPixelRangeHSV( uint16_t st_pixel, uint16_t end_pixel,
                              uint8_t intensity, uint8_t h, uint8_t s, uint8_t v );

#endif // _APA102_H