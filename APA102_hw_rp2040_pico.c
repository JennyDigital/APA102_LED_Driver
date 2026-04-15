#include "APA102_hw_rp2040_pico.h"
#include "APA102_hw_backend.h"

#ifdef APA102_PICO_USE_DMA_BUFFER_SEND
#include <stdbool.h>
#include <hardware/dma.h>

static int      apa102_pico_dma_tx_channel = -1;
static int      apa102_pico_dma_rx_channel = -1;
static bool     apa102_pico_dma_checked    = false;
static bool     apa102_pico_dma_available  = false;
static uint8_t  apa102_pico_dma_rx_sink    = 0U;

static bool apa102_pico_init_dma( void )
{
  if ( apa102_pico_dma_checked )
  {
    return apa102_pico_dma_available;
  }

  apa102_pico_dma_checked = true;
  apa102_pico_dma_tx_channel = dma_claim_unused_channel( false );
  if ( apa102_pico_dma_tx_channel < 0 )
  {
    return false;
  }

  apa102_pico_dma_rx_channel = dma_claim_unused_channel( false );
  if ( apa102_pico_dma_rx_channel < 0 )
  {
    dma_channel_unclaim( (uint)apa102_pico_dma_tx_channel );
    apa102_pico_dma_tx_channel = -1;
    return false;
  }

  apa102_pico_dma_available = true;

  return true;
}

static void apa102_pico_clear_spi_rx( void )
{
  while ( spi_is_readable( APA102_PICO_SPI_PORT ) )
  {
    (void)spi_get_hw( APA102_PICO_SPI_PORT )->dr;
  }

  spi_get_hw( APA102_PICO_SPI_PORT )->icr = SPI_SSPICR_RORIC_BITS;
}

static void apa102_pico_wait_for_spi_idle( void )
{
  while ( spi_is_busy( APA102_PICO_SPI_PORT ) )
  {
  }

  apa102_pico_clear_spi_rx();
}
#endif

void APA_HW_SPI_BlockSend( uint8_t * data, uint16_t length )
{
  APA102_PICO_SPI_TX( data, length );
}

void APA_HW_SPI_SendBuffer( uint8_t * data, uint16_t length )
{
#ifdef APA102_PICO_USE_DMA_BUFFER_SEND
  if ( ( length == 0U ) || ( !apa102_pico_init_dma() ) )
  {
    APA_HW_SPI_BlockSend( data, length );
    return;
  }

  spi_hw_t * spi_hw = spi_get_hw( APA102_PICO_SPI_PORT );
  dma_channel_config tx_config = dma_channel_get_default_config( (uint)apa102_pico_dma_tx_channel );
  dma_channel_config rx_config = dma_channel_get_default_config( (uint)apa102_pico_dma_rx_channel );

  channel_config_set_transfer_data_size( &tx_config, DMA_SIZE_8 );
  channel_config_set_read_increment( &tx_config, true );
  channel_config_set_write_increment( &tx_config, false );
  channel_config_set_dreq( &tx_config, spi_get_dreq( APA102_PICO_SPI_PORT, true ) );

  channel_config_set_transfer_data_size( &rx_config, DMA_SIZE_8 );
  channel_config_set_read_increment( &rx_config, false );
  channel_config_set_write_increment( &rx_config, false );
  channel_config_set_dreq( &rx_config, spi_get_dreq( APA102_PICO_SPI_PORT, false ) );

  apa102_pico_clear_spi_rx();

  dma_channel_configure( (uint)apa102_pico_dma_rx_channel, &rx_config, &apa102_pico_dma_rx_sink, &spi_hw->dr, length, false );
  dma_channel_configure( (uint)apa102_pico_dma_tx_channel, &tx_config, &spi_hw->dr, data, length, false );
  dma_start_channel_mask( ( 1u << (uint)apa102_pico_dma_rx_channel ) | ( 1u << (uint)apa102_pico_dma_tx_channel ) );

  dma_channel_wait_for_finish_blocking( (uint)apa102_pico_dma_tx_channel );
  dma_channel_wait_for_finish_blocking( (uint)apa102_pico_dma_rx_channel );
  apa102_pico_wait_for_spi_idle();
#else
  APA_HW_SPI_BlockSend( data, length );
#endif
}