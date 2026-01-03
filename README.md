# APA102_LED_Driver
A simple LED driver for the APA102 Addressable LEDs.  Works with STM32 and GD32 at present.

Please feel free to make suggestions, it should now be good enough for more serious applications.

## Quick Start Guide
To use this driver you will need to enable an SPI peripheral on your chosen mcu or supply your own software SPI routine.

For the GD32, you should speficy which SPI port you are using by adjusting the #define that points to it in APA102.h.
For the STM32, you will need to make sure the handle is the correct one for your SPI port.

Then you need to setup your SPI port and associated clock somewhere in your project.  This should keep the clock rate reasonably low (< 10MHz) to prevent weirdness.

There are a couple of #defines for the GD32 and STM32, of which only one should be uncommented.

There will eventually be one or more test projects for you to build and play with.

*HAVE FUN!*
