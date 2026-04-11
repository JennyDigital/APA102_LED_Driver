#include <stdio.h>
#include "pico/stdlib.h"
#include "hardware/spi.h"
#include "APA102_hw_rp2040_pico.h"
#include "APA102.h"

#define SPI_PORT            spi0
#define PIN_SCK             18
#define PIN_MOSI            19
#define APA_SPI_BAUDRATE    ( 1000 * 1000 )
#define APA_RUNTIME_LEDS    30U
#define APA_FRAME_DELAY_MS  5U

static void configure_spi( void )
{
  spi_init( SPI_PORT, APA_SPI_BAUDRATE );
  gpio_set_function( PIN_SCK, GPIO_FUNC_SPI );
  gpio_set_function( PIN_MOSI, GPIO_FUNC_SPI );
}


int main( void )
{
  stdio_init_all();
  configure_spi();

  APA_SetBufferSize( APA_RUNTIME_LEDS );
  APA_Init();

  uint8_t hue_offset = 0U;

  while ( true )
  {
    uint16_t led_count = APA_GetBufferSize();

    for ( uint16_t pixel = 0; pixel < led_count; pixel++ )
    {
      uint8_t hue = (uint8_t)( ( pixel * 5U ) + hue_offset );
      APA_SetPixelHSV( pixel, 20, hue, 255, 120 );
    }

    APA_sendBuffer();
    sleep_ms( APA_FRAME_DELAY_MS );
    hue_offset++;
  }
}
