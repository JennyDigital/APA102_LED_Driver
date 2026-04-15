# ✨ APA102_LED_Driver

> A lightweight, efficient LED driver library for APA102 (DotStar) addressable LEDs. Supports STM32 (HAL), GD32 (SPL), and Raspberry Pi Pico (RP2040 SDK).

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
![Language](https://img.shields.io/badge/language-C-blue.svg)
![MCU](https://img.shields.io/badge/MCU-STM32%20%7C%20GD32%20%7C%20RP2040-brightgreen.svg)

**Bring your projects to life with stunning addressable LED effects!** 🌈

## 📋 Table of Contents

1. [Features](#features)
2. [Hardware Requirements](#hardware-requirements)
3. [Installation](#installation)
4. [Configuration](#configuration)
5. [API Reference](#api-reference)
6. [Usage Examples](#usage-examples)
7. [Colour Palettes](#colour-palettes)
8. [Migration Notes](#migration-notes)
9. [Advanced Features](#advanced-features)
10. [Changelog](#changelog)

---

## Features

🎨 **Full Colour Control**
- RGB colour support with per-pixel brightness control (0-31)
- HSV colourspace support for smooth colour transitions
- Built-in colour palettes for common colours

🎬 **Smooth Animations**
- Optional gamma correction for smoother gradients
- Range-based operations for setting multiple LEDs
- Direct buffer access for custom applications

⚡ **Efficient & Flexible**
- Configurable LED count
- Bounds checking (optional, for debugging)
- Automatic stop frame calculation
- Minimal dependencies

---

## ⚡ Quick Start

```c
#include "APA102_hw_stm32_hal.h"
#include "APA102.h"

int main(void) {
    APA_SetBufferSize(10);                     // Optional runtime LED count (1..LED_BUFF_SZ)
    APA_Init();                              // Initialize
    APA_SetPixel(0, 31, 255, 0, 0);         // Set first LED to red
    APA_SetRange(1, 9, 31, 0, 0, 255);      // Set LEDs 1-9 to blue
    APA_sendBuffer();                        // Send to strip
    return 0;
}
```

---

## Hardware Requirements

### 💡 APA102 LED Strip

The APA102 (also known as DotStar) LED has the following protocol:
- 4-byte frame per LED: Global brightness (5 bits) + Blue + Green + Red
- Start frame: 32 bits of zeros
- End frame: at least N/2 clock pulses for N LEDs (automatically calculated, sent with data low)

### 🎮 Microcontroller

| Platform | Version | Notes |
|----------|---------|-------|
| **STM32** | HAL | Tested with STM32F1 series |
| **GD32** | SPL | Tested with GD32F10x series |
| **RP2040 (Pico)** | Pico SDK | Uses `hardware/spi.h` (`spi_write_blocking`), with optional DMA bulk transfer |
| **SPI Speed** | ≤10MHz | Essential for reliable communication |

### 🔌 Wiring Diagram

```
MCU Pin             APA102 PIN
─────────────────────────────
GND          ──→  GND
VCC (5V)     ──→  VCC
MOSI         ──→  DI  (Data In)
SCK          ──→  CI  (Clock In)
```

---

## Installation

1. ✅ Copy `APA102.h`, `APA102.c`, `APA102_hw_backend.h`, and one hardware backend pair into your project:
    - STM32 HAL: `APA102_hw_stm32_hal.h` + `APA102_hw_stm32_hal.c`
    - GD32 SPL: `APA102_hw_gd32_spl.h` + `APA102_hw_gd32_spl.c`
    - RP2040 Pico SDK: `APA102_hw_rp2040_pico.h` + `APA102_hw_rp2040_pico.c`
2. ✅ Include the hardware header before `APA102.h` in your source files
3. ✅ Configure your SPI peripheral in your MCU's initialization code
4. ✅ (Optional) Set `LED_BUFF_SZ` for your default build-time capacity

---

## Configuration

All configuration is done in `APA102.h`:

#### 🔢 LED Count

```c
#define LED_BUFF_SZ 30U
```

Set this to the default number of LEDs in your strip.

At runtime, change the active LED count with:

```c
if (APA_SetBufferSize(60) != APA_OK) {
    // Handle invalid runtime size request.
}
APA_Init();              // Clear/send using the active runtime size
```

`APA_SetBufferSize()` accepts values in the range `1..LED_BUFF_SZ`.

#### 🖥️ Platform Selection

```c
// STM32 HAL
#include "APA102_hw_stm32_hal.h"
#include "APA102.h"
```

```c
// GD32 SPL
#include "APA102_hw_gd32_spl.h"
#include "APA102.h"
```

```c
// Raspberry Pi Pico (RP2040 SDK)
#include "APA102_hw_rp2040_pico.h"
#include "APA102.h"
```

For GD32, set the SPI port if you do not want the default `SPI0`:
```c
#define LED_SPI_PORT SPI0
```

For STM32, `hspi1` is used by default. To use a different SPI handle:
```c
#define APA102_STM32_SPI_HANDLE hspi2
#include "APA102_hw_stm32_hal.h"
#include "APA102.h"
```

For RP2040, `spi0` is used by default. To use `spi1`:
```c
#define APA102_PICO_SPI_PORT spi1
#include "APA102_hw_rp2040_pico.h"
#include "APA102.h"
```

To enable DMA for the main LED payload transfer on RP2040, define `APA102_PICO_USE_DMA_BUFFER_SEND` before including the Pico backend header, or add it as a compile definition:

```c
#define APA102_PICO_USE_DMA_BUFFER_SEND
#include "APA102_hw_rp2040_pico.h"
#include "APA102.h"
```

When DMA is enabled, link against `hardware_dma` in addition to `hardware_spi`. The Pico backend will keep the 4-byte start frame and end-frame tail clocks on the normal blocking path, and only the LED payload buffer is transferred via DMA.

#### 🎮 GD32 SPI Peripheral Setup

For those new to GD32 microcontrollers, here's a quick reference for configuring the SPI peripheral:

```c
// Example: Configuring SPI0 on GD32F103
#include "gd32f10x.h"

void spi0_init(void) {
    // Enable clocks
    rcu_periph_clock_enable(RCU_GPIOA);
    rcu_periph_clock_enable(RCU_SPI0);
    
    // Configure GPIO pins (PA5=SCK, PA7=MOSI, PA6=MISO if needed)
    gpio_init(GPIOA, GPIO_MODE_AF_PP, GPIO_OSPEED_50MHZ, GPIO_PIN_5 | GPIO_PIN_7);
    
    // Configure SPI
    spi_parameter_struct spi_init_struct;
    spi_struct_para_init(&spi_init_struct);
    spi_init_struct.device_mode = SPI_MASTER;
    spi_init_struct.trans_mode = SPI_TRANSMODE_BDTNF;  // Transmit only
    spi_init_struct.frame_size = SPI_FRAMESIZE_8BIT;
    spi_init_struct.clock_polarity_phase = SPI_CK_PL_LOW_PH_1EDGE;  // Mode 0
    spi_init_struct.nss = SPI_NSS_SOFT;  // Software NSS
    spi_init_struct.prescale = SPI_PSC_8;  // ~10MHz at 80MHz clock
    spi_init(SPI0, &spi_init_struct);
    spi_enable(SPI0);
}

// Transmit function for the library
void spi_send_byte(uint8_t data) {
    while (spi_i2s_flag_get(SPI0, SPI_FLAG_TBE) == RESET);
    spi_i2s_data_transmit(SPI0, data);
}
```

> **Tip:** Adjust `GPIO_PIN_5` and `GPIO_PIN_7` based on your board's SPI pin mapping. Check your GD32 datasheet for alternate SPI pin locations.

#### 🛡️ Bounds Checking

```c
#define APA_RANGE_CHECK
```

Enable to validate pixel indices. Disable for maximum performance in production.

#### 📐 Gamma Correction

```c
#define APA_GAMMA_CORRECT
#ifdef APA_GAMMA_CORRECT
#define APA_GAMMA 2.8
#endif
```

Enable for smoother LED gradients. The gamma value can be adjusted (common values: 2.2, 2.8).

---

## API Reference

### 🔄 Initialization

#### `void APA_Init(void)` 🟢

Initialises the LED buffer and sends an initial frame. Call this before using any other functions.

#### `APA_Status_t APA_SetBufferSize(uint16_t led_count)` ⚙️

Sets the active runtime LED count. Must be called before `APA_Init()` (or before pixel operations) if you want a size other than the default.

#### `uint16_t APA_GetBufferSize(void)` 📏

Returns the currently active runtime LED count.

#### `void APA_Clear(void)` 🟡

Turns off all LEDs and sends the frame immediately.

#### `void APA_sendBuffer(void)` 📤

Sends the current buffer contents to the LED strip. Call this after making changes to apply them.

---

### 🎨 Setting Pixels (RGB)

#### `APA_Status_t APA_SetPixel(uint8_t pixel, uint8_t intensity, uint8_t red, uint8_t green, uint8_t blue)`

Sets a single pixel. Does not send automatically.

| Parameter | Range | Description |
|-----------|-------|-------------|
| `pixel` | 0 to APA_GetBufferSize()-1 | LED index |
| `intensity` | 0-31 | Global brightness |
| `red` | 0-255 | Red intensity |
| `green` | 0-255 | Green intensity |
| `blue` | 0-255 | Blue intensity |

Returns `APA_OK` on success, `APA_out_of_range` if bounds checking fails.

#### `APA_Status_t APA_SetRange(uint16_t st_pixel, uint16_t end_pixel, uint8_t intensity, uint8_t red, uint8_t green, uint8_t blue)`

Sets a range of pixels to the same colour.

| Parameter | Range | Description |
|-----------|-------|-------------|
| `st_pixel` | 0 to APA_GetBufferSize()-1 | Starting LED index |
| `end_pixel` | st_pixel to APA_GetBufferSize()-1 | Ending LED index |
| `intensity` | 0-31 | Global brightness |
| `red`, `green`, `blue` | 0-255 | Colour values |

---

### 🌈 Setting Pixels (HSV)

HSV (Hue, Saturation, Value) is useful for animations and smooth colour transitions.

#### `APA_Status_t APA_SetPixelHSV(uint16_t pixel, uint8_t intensity, uint8_t hue, uint8_t sat, uint8_t vel)`

Sets a single pixel using HSV colourspace.

| Parameter | Range | Description |
|-----------|-------|-------------|
| `pixel` | 0 to APA_GetBufferSize()-1 | LED index |
| `intensity` | 0-31 | Global brightness (hardware) |
| `hue` | 0-255 | Colour (0=red, 43=green, 85=blue, 128=cyan, 170=magenta, 213=red) |
| `sat` | 0-255 | Saturation (0=white, 255=full colour) |
| `vel` | 0-255 | Value/brightness (software) |

#### `APA_Status_t APA_SetPixelRangeHSV(uint16_t st_pixel, uint16_t end_pixel, uint8_t intensity, uint8_t hue, uint8_t sat, uint8_t vel)`

Sets a range of pixels using HSV colourspace.

---

### 🎨 Colour Convenience Functions

#### `APA_Status_t APA_SetPixelColour(uint16_t pixel, uint8_t intensity, APA_colour_st colour)` 📍

Sets a single pixel using a palette colour.

#### `APA_Status_t APA_SetRangeColour(uint16_t st_pixel, uint16_t end_pixel, uint8_t intensity, APA_colour_st colour)` 📏

Sets a range of pixels using a palette colour.

---

### 🔄 Colour Conversion

#### `led_pixelRGB_st APA_ConvHSVtoRGB(uint8_t hue, uint8_t sat, uint8_t vel)`

Converts HSV values to RGB. Returns a `led_pixelRGB_st` structure.

#### `led_pixelHSV_st APA_ConvRGBtoHSV(uint8_t red, uint8_t green, uint8_t blue)`

Converts RGB values to HSV. Returns a `led_pixelHSV_st` structure.

---

### 👀 Reading Pixels

#### `led_pixelRGB_st APA_GetPixelRGB(uint16_t pixel)`

Returns the current RGB values of a pixel.

#### `led_pixelHSV_st APA_GetPixelHSV(uint16_t pixel)`

Returns the current HSV values of a pixel.

---

### 🔓 Direct Buffer Access

#### `led_frame_st* APA_GetBufferPointer(void)`

Returns a pointer to the internal LED buffer for direct manipulation.

```c
led_frame_st* buffer = APA_GetBufferPointer();
// Access buffer[0].red, buffer[0].green, buffer[0].blue, etc.
```

---

## Usage Examples

Reference projects are available under `Test-Projects/`, including STM32, GD32, and RP2040/Pico builds.

### 🚀 Basic Usage

```c
// Initialise the driver
APA_SetBufferSize(30);  // Optional runtime configuration
APA_Init();

APA_SetPixel(0, 31, 255, 0, 0);

// Set LEDs 5-10 to blue
APA_SetRange(5, 10, 31, 0, 0, 255);

// Send to LEDs
APA_sendBuffer();
```

### 🎨 Using Colour Palettes

// Set pixel to a named colour
APA_SetPixelColour(0, 31, APA_COLOUR_GREEN);

// Set a range with a colour
APA_SetRangeColour(0, 9, 31, APA_COLOUR_PURPLE);

// Define custom colours
APA_colour_st orange = {255, 165, 0};
APA_SetPixelColour(15, 31, orange);
```

### 🌈 Rainbow Effect (HSV)

```c
// Create a rainbow across all LEDs
uint16_t led_count = APA_GetBufferSize();
for (uint16_t i = 0; i < led_count; i++) {
    uint8_t hue = (i * 256) / led_count;  // Distribute hue evenly
    APA_SetPixelHSV(i, 31, hue, 255, 255);
}
APA_sendBuffer();
```

### 💨 Breathing Animation

```c
// Gradually fade LED in and out
for (int i = 0; i <= 31; i++) {
    APA_SetPixel(0, i, 255, 0, 0);  // Red, increasing brightness
    APA_sendBuffer();
    delay_ms(50);
}
for (int i = 31; i >= 0; i--) {
    APA_SetPixel(0, i, 255, 0, 0);  // Red, decreasing brightness
    APA_sendBuffer();
    delay_ms(50);
}
```

### ⚡ Custom Buffer Access

```c
// Direct manipulation for performance
led_frame_st* buf = APA_GetBufferPointer();

for (uint16_t i = 0; i < APA_GetBufferSize(); i++) {
    buf[i].master_bright = 31 | 0b11100000;
    buf[i].red = i * 8;      // Gradient red
    buf[i].green = 0;
    buf[i].blue = 255 - (i * 8);
}

APA_sendBuffer();
```

### 🧪 Reference Projects

- `Test-Projects/STM32_Example/`: STM32 HAL integration example.
- `Test-Projects/Twinkler/`: GD32 SPL integration example.
- `Test-Projects/Pico_Example/`: Raspberry Pi Pico SDK example using the local repository copies of `APA102.c` and `APA102_hw_rp2040_pico.c`.

---

## Colour Palettes

The library provides predefined colour constants for quick access to common colours:

| Constant | Red | Green | Blue | Description |
|----------|-----|-------|------|-------------|
| `APA_COLOUR_BLACK` | 0 | 0 | 0 | No light |
| `APA_COLOUR_WHITE` | 255 | 255 | 255 | Full white |
| `APA_COLOUR_RED` | 255 | 0 | 0 | Pure red |
| `APA_COLOUR_GREEN` | 0 | 255 | 0 | Pure green |
| `APA_COLOUR_BLUE` | 0 | 0 | 255 | Pure blue |
| `APA_COLOUR_YELLOW` | 255 | 255 | 0 | Red + Green |
| `APA_COLOUR_CYAN` | 0 | 255 | 255 | Green + Blue |
| `APA_COLOUR_MAGENTA` | 255 | 0 | 255 | Red + Blue |
| `APA_COLOUR_ORANGE` | 255 | 165 | 0 | Red-orange |
| `APA_COLOUR_PURPLE` | 128 | 0 | 128 | Dark purple |
| `APA_COLOUR_PINK` | 255 | 192 | 203 | Light pink |
| `APA_COLOUR_LIME` | 0 | 255 | 0 | Bright green |
| `APA_COLOUR_AQUA` | 0 | 255 | 255 | Light cyan |
| `APA_COLOUR_MAROON` | 128 | 0 | 0 | Dark red |
| `APA_COLOUR_NAVY` | 0 | 0 | 128 | Dark blue |
| `APA_COLOUR_OLIVE` | 128 | 128 | 0 | Yellow-green |
| `APA_COLOUR_TEAL` | 0 | 128 | 128 | Blue-green |

### Custom Colours

Define your own using the `APA_colour_st` struct:

```c
APA_colour_st myColour = {R, G, B};  // Values 0-255 each
APA_SetPixelColour(pixel, intensity, myColour);
```

---

## Migration Notes

If you are upgrading from a fixed-size-only integration, use the following checklist:

1. Keep `LED_BUFF_SZ` in `APA102.h` as your compile-time maximum capacity.
2. Set your active strip length at runtime with `APA_SetBufferSize()` before `APA_Init()`.
3. If your code loops using fixed bounds (`LED_BUFF_SZ` or literal values), switch to `APA_GetBufferSize()` for runtime-safe loops.
4. Handle `APA_invalid_config` from `APA_SetBufferSize()` when the requested size is outside `1..LED_BUFF_SZ`.
5. Ensure `APA102_hw_backend.h` is included in your project files together with the selected hardware backend pair.

Example migration pattern:

```c
if (APA_SetBufferSize(actual_led_count) != APA_OK) {
    // Fallback to a safe value or signal configuration error.
}
APA_Init();

for (uint16_t i = 0; i < APA_GetBufferSize(); i++) {
    APA_SetPixel(i, 31, 0, 0, 0);
}
APA_sendBuffer();
```

---

## Advanced Features

### 📐 Gamma Correction

LEDs have non-linear brightness response. Enable gamma correction for smoother gradients:

```c
#define APA_GAMMA_CORRECT
```

The default gamma value is 2.8. Adjust `APA_GAMMA` if needed.

### 💡 Brightness Control

Two brightness controls are available:

1. **Global brightness** (hardware): Set via `intensity` parameter (0-31), controls the LED's built-in PWM
2. **Software brightness**: Controlled via HSV `vel` parameter or reduced RGB values

The hardware brightness is more efficient (uses less power at low brightness) but has only 32 levels.

### ⚡ Performance Tips

1. **📦 Batch operations**: Use `APA_SetRange()` instead of multiple `APA_SetPixel()` calls
2. **🏃 Disable bounds checking**: Comment out `APA_RANGE_CHECK` in production
3. **💨 Direct buffer access**: Use `APA_GetBufferPointer()` for maximum throughput
4. **🎯 DMA transfers**: For very large LED strips, consider implementing DMA for non-blocking SPI

### 🔧 SPI Configuration

- Maximum clock speed: ~10MHz for reliable operation
- Mode: SPI Mode 0 (CPOL=0, CPHA=0)
- Data order: MSB first

---

## 📊 Return Values

All functions that return `APA_Status_t` return one of:

| Value | Meaning |
|-------|---------|
| `APA_OK` | Operation successful |
| `APA_out_of_range` | Pixel index outside valid range |
| `APA_invalid_config` | Invalid configuration value (for example, `APA_SetBufferSize()` out of range) |
| `APA_unknown_err` | Unexpected error occurred |

---

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for release history and API changes.

---

**Made with ✨ for LED enthusiasts everywhere!** 🌈
