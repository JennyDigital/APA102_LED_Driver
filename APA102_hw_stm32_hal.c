#include "APA102_hw_stm32_hal.h"
#include "APA102_hw_backend.h"

#ifndef APA102_STM32_SPI_HANDLE
extern SPI_HandleTypeDef hspi1;
#endif

void APA_HW_SPI_BlockSend( uint8_t * data, uint16_t length )
{
  APA102_STM32_SPI_TX( data, length );
}