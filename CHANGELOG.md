# Changelog

All notable changes to this project will be documented in this file.

The format is based on Keep a Changelog.

## [Unreleased]

### Added
- Runtime LED count configuration API:
  - `APA_SetBufferSize(uint16_t led_count)`
  - `APA_GetBufferSize(void)`
- New status code `APA_invalid_config` for invalid runtime configuration requests.
- RP2040/Pico SDK reference project under `Test-Projects/Pico_Example/` that builds against the local repository copies of `APA102.c` and `APA102_hw_rp2040_pico.c`.

### Changed
- Core driver now applies runtime LED count for:
  - Bounds checks
  - Number of stop frames sent
  - Number of bytes sent in `APA_sendBuffer()`
  - Full-strip operations in `APA_Init()` and `APA_Clear()`
- `MAX_LED` now resolves from runtime count (`APA_GetBufferSize() - 1`).
- Documentation updated for runtime-size workflows and backend split integration.

### Fixed
- APA102 end-frame generation now uses byte-accurate tail clock calculation (`ceil(led_count / 16)`) instead of oversized 32-bit stop-frame blocks.
- Tail clock bytes are now sent with data low (`0x00`) to avoid downstream chained-strip ghost pixels when the configured logical length is shorter than the physical chain.

### Migration
- Existing code that iterates to `LED_BUFF_SZ` should move to `APA_GetBufferSize()` for runtime-safe loops.
- `LED_BUFF_SZ` remains the compile-time maximum buffer capacity.
- Include `APA102_hw_backend.h` in project file lists along with one hardware backend pair.

## [2026-04-10]

### Added
- Initial changelog file.
