#include "APA102_hw_gd32_spl.h"
#include "APA102_hw_backend.h"

void APA_HW_SPI_BlockSend( uint8_t * data, uint16_t length )
{
  uint16_t value;

  for( uint16_t count = 0; count < length; count++ )
  {
    value = (uint16_t)( *data );
    data++;

    spi_i2s_data_transmit( LED_SPI_PORT, value );

    // We use this flag because we aren't receiving anything.
    while( spi_i2s_flag_get( LED_SPI_PORT, SPI_FLAG_TBE ) == RESET );
  }
}