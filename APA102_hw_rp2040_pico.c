#include "APA102_hw_rp2040_pico.h"
#include "APA102_hw_backend.h"

void APA_HW_SPI_BlockSend( uint8_t * data, uint16_t length )
{
  APA102_PICO_SPI_TX( data, length );
}