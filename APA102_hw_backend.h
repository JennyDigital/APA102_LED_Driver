#ifndef APA102_HW_BACKEND_H
#define APA102_HW_BACKEND_H

#include <stdint.h>

void APA_HW_SPI_BlockSend( uint8_t * data, uint16_t length );

#endif // APA102_HW_BACKEND_H