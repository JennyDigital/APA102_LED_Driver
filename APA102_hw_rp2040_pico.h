#ifndef APA102_HW_RP2040_PICO_H
#define APA102_HW_RP2040_PICO_H

#include <stddef.h>
#include <hardware/spi.h>

#define APA102_HW_RP2040_PICO

#ifndef APA102_PICO_SPI_PORT
#define APA102_PICO_SPI_PORT spi0
#endif

/* Optional bulk-frame DMA path for APA_sendBuffer().
 * Define APA102_PICO_USE_DMA_BUFFER_SEND before including this header, or pass
 * it as a compile definition, to use DMA for the LED payload transfer.
 */

#ifndef APA102_PICO_SPI_TX
#define APA102_PICO_SPI_TX( data, length ) ((void)spi_write_blocking( APA102_PICO_SPI_PORT, (const uint8_t *)(data), (size_t)(length) ))
#endif

#endif // APA102_HW_RP2040_PICO_H