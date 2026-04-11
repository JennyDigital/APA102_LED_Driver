# Pico APA102 Example

This example runs the APA102 driver on Raspberry Pi Pico (RP2040 SDK) and uses the
local driver sources from the repository root:

- `../../APA102.c`
- `../../APA102_hw_rp2040_pico.c`

No vendored driver copy is used in this example project.

## Board Target

The CMake project is configured for `pico` by default.

## Default SPI Pin Mapping

Defined in `main.c`:

- SPI port: `spi0`
- SCK: GPIO 18
- MOSI: GPIO 19
- CS: GPIO 17 (held high as a general output)

APA102 uses only clock and data-in from the Pico side.

## Build

From this directory:

1. `cmake -S . -B build`
2. `cmake --build build`

If `PICO_SDK_PATH` is not set globally, set it before configuring:

- `export PICO_SDK_PATH=/path/to/pico-sdk`

## Flash

Use whichever method you prefer:

- Copy `build/Pico_APA102_Example.uf2` to the mounted BOOTSEL drive.
- Or use `picotool` with the generated artifacts in `build/`.

## Runtime Behavior

The example sets runtime LED count to 30 and continuously renders a moving HSV rainbow.
Adjust these values in `main.c`:

- `APA_RUNTIME_LEDS`
- `APA_FRAME_DELAY_MS`
