#ifndef APA102_HW_STM32_HAL_H
#define APA102_HW_STM32_HAL_H

#include "stm32f1xx_hal.h"

#define APA102_HW_STM32_HAL

#ifndef APA102_STM32_SPI_HANDLE
extern SPI_HandleTypeDef hspi1;
#define APA102_STM32_SPI_HANDLE hspi1
#endif

#ifndef APA102_STM32_SPI_TX
#define APA102_STM32_SPI_TX( data, length ) HAL_SPI_Transmit( &APA102_STM32_SPI_HANDLE, (data), (length), 100 )
#endif

#endif // APA102_HW_STM32_HAL_H