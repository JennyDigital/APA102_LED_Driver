#include "main.h"
#include <stdint.h>
#include <gd32f10x.h>
#include "APA102.h"

volatile  uint32_t  systick_counter = 0;

          uint32_t  blue_ph         = 0;
          uint32_t  green_ph        = 10000;
          uint32_t  red_ph          = 20000;
          uint8_t   col;
          uint8_t   j               = 0;


static void GPIO_InitPins ( void );
static void SetupClock    ( void );
static void SetupSPI      ( void );

void Error_Handler( void );
void delay_ms( uint32_t millis );
void SysTick_Handler( void );

void main( void )
{
  SystemInit();
  SetupClock();
  GPIO_InitPins();
  SetupSPI();
  APA_Init();

  int i = 0, j = 1;

  while( TRUE )
  {
    for( i = 0; i < 30; i++ )
    {
      APA_SetPixelHSV( i, 31, i+j, 210, 120 );
      j+=9;
    }
    APA_sendBuffer();
    delay_ms( 35 );
    j-=2;
  }  
}


static void GPIO_InitPins( void )
{
  // Bank A usage: SPI0
  //
  rcu_periph_clock_enable( RCU_GPIOA );

  // Clocking for SPI
  //
  rcu_periph_clock_enable( RCU_SPI0 );
  
  // Initialise the used SPI Peripheral pins.
  //
  gpio_init( SCK_BANK, GPIO_MODE_AF_PP, GPIO_OSPEED_50MHZ, SCK );
  gpio_init( MOSI_BANK, GPIO_MODE_AF_PP, GPIO_OSPEED_50MHZ, MOSI );
}


static void SetupClock( void )
{
  rcu_system_clock_source_config( RCU_SCSS_IRC8M );
  rcu_osci_off( RCU_PLL_CK );
  rcu_osci_on ( RCU_HXTAL );
  
  rcu_pll_config( RCU_PLLSRC_IRC8M_DIV2, RCU_PLL_MUL27 );  // Flat-out, yeah yeah!
  rcu_osci_on( RCU_PLL_CK );
  if( SUCCESS != rcu_osci_stab_wait( RCU_PLL_CK ) )
  { 
    Error_Handler();
  }
  
  rcu_system_clock_source_config( RCU_CKSYSSRC_PLL );
  rcu_apb2_clock_config( RCU_APB2_CKAHB_DIV2 );
  SystemCoreClockUpdate();
  SysTick_Config( SystemCoreClock / 1000 );
}


static void SetupSPI( void )
{
  spi_enable( SPI0 );
  spi_parameter_struct spi0_struct;
  spi_struct_para_init( &spi0_struct );

  spi0_struct.device_mode           = SPI_MASTER;
  spi0_struct.nss                   = SPI_NSS_SOFT;
  spi0_struct.trans_mode            = SPI_TRANSMODE_FULLDUPLEX;
  spi0_struct.endian                = SPI_ENDIAN_MSB;
  spi0_struct.frame_size            = SPI_FRAMESIZE_8BIT;
  spi0_struct.clock_polarity_phase  = SPI_CK_PL_HIGH_PH_2EDGE;
  spi0_struct.prescale              = SPI_PSC_128;

  spi_init( SPI0, &spi0_struct );
  spi_crc_off( SPI0 );
}


void Error_Handler( void )
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
}


void delay_ms( uint32_t millis )
{
  systick_counter = millis;
  while( systick_counter );
}


void SysTick_Handler( void )
{

  if( systick_counter )
  {
    systick_counter--;
  }
}