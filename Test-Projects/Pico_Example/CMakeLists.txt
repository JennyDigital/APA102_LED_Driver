cmake_minimum_required(VERSION 3.13)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# == DO NOT EDIT THE FOLLOWING LINES for the Raspberry Pi Pico VS Code Extension to work ==
if(WIN32)
    set(USERHOME $ENV{USERPROFILE})
else()
    set(USERHOME $ENV{HOME})
endif()
set(sdkVersion 2.2.0)
set(toolchainVersion 14_2_Rel1)
set(picotoolVersion 2.2.0-a4)
set(picoVscode ${USERHOME}/.pico-sdk/cmake/pico-vscode.cmake)
if (EXISTS ${picoVscode})
    include(${picoVscode})
endif()
# ====================================================================================
set(PICO_BOARD pico CACHE STRING "Board type")

include(pico_sdk_import.cmake)

project(Pico_APA102_Example C CXX ASM)

pico_sdk_init()

option(APA102_PICO_EXAMPLE_USE_DMA "Enable DMA-backed APA102 frame transfer" OFF)

add_executable(Pico_APA102_Example
    main.c
    ../../APA102.c
    ../../APA102_hw_rp2040_pico.c
)

pico_set_program_name(Pico_APA102_Example "Pico_APA102_Example")
pico_set_program_version(Pico_APA102_Example "0.1")

pico_enable_stdio_uart(Pico_APA102_Example 0)
pico_enable_stdio_usb(Pico_APA102_Example 1)

target_link_libraries(Pico_APA102_Example
    pico_stdlib
    hardware_spi
)

if(APA102_PICO_EXAMPLE_USE_DMA)
    target_compile_definitions(Pico_APA102_Example PRIVATE APA102_PICO_USE_DMA_BUFFER_SEND)
    target_link_libraries(Pico_APA102_Example hardware_dma)
endif()

target_include_directories(Pico_APA102_Example PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}
    ${CMAKE_CURRENT_LIST_DIR}/../..
)

pico_add_extra_outputs(Pico_APA102_Example)
