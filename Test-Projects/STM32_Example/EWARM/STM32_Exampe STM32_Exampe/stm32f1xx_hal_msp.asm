	.cpu cortex-m3
	.arch armv7-m
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 38, 1
	.eabi_attribute 18, 4
	.file	"stm32f1xx_hal_msp.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 1 "/home/jennifer/repos/APA102_LED_Driver/Test-Projects/STM32_Exampe/Core/Src/stm32f1xx_hal_msp.c"
	.section	.text.HAL_MspInit,"ax",%progbits
	.align	1
	.global	HAL_MspInit
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_MspInit, %function
HAL_MspInit:
.LFB65:
	.loc 1 64 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
.LBB2:
	.loc 1 70 3
	ldr	r3, .L2
	ldr	r3, [r3, #24]
	ldr	r2, .L2
	orr	r3, r3, #1
	str	r3, [r2, #24]
	ldr	r3, .L2
	ldr	r3, [r3, #24]
	and	r3, r3, #1
	str	r3, [sp, #8]
	ldr	r3, [sp, #8]
.LBE2:
.LBB3:
	.loc 1 71 3
	ldr	r3, .L2
	ldr	r3, [r3, #28]
	ldr	r2, .L2
	orr	r3, r3, #268435456
	str	r3, [r2, #28]
	ldr	r3, .L2
	ldr	r3, [r3, #28]
	and	r3, r3, #268435456
	str	r3, [sp, #4]
	ldr	r3, [sp, #4]
.LBE3:
.LBB4:
	.loc 1 77 3
	ldr	r3, .L2+4
	ldr	r3, [r3, #4]
	str	r3, [sp, #12]
	ldr	r3, [sp, #12]
	bic	r3, r3, #117440512
	str	r3, [sp, #12]
	ldr	r3, [sp, #12]
	orr	r3, r3, #33554432
	str	r3, [sp, #12]
	ldr	r2, .L2+4
	ldr	r3, [sp, #12]
	str	r3, [r2, #4]
.LBE4:
	.loc 1 82 1
	nop
	add	sp, sp, #16
	.cfi_def_cfa_offset 0
	@ sp needed
	bx	lr
.L3:
	.align	2
.L2:
	.word	1073876992
	.word	1073807360
	.cfi_endproc
.LFE65:
	.size	HAL_MspInit, .-HAL_MspInit
	.section	.text.HAL_SPI_MspInit,"ax",%progbits
	.align	1
	.global	HAL_SPI_MspInit
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_SPI_MspInit, %function
HAL_SPI_MspInit:
.LFB66:
	.loc 1 91 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #44
	.cfi_def_cfa_offset 48
	str	r0, [sp, #4]
	.loc 1 92 20
	add	r3, sp, #20
	movs	r2, #0
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	.loc 1 93 10
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 93 5
	ldr	r2, .L7
	cmp	r3, r2
	bne	.L6
.LBB5:
	.loc 1 99 5
	ldr	r3, .L7+4
	ldr	r3, [r3, #24]
	ldr	r2, .L7+4
	orr	r3, r3, #4096
	str	r3, [r2, #24]
	ldr	r3, .L7+4
	ldr	r3, [r3, #24]
	and	r3, r3, #4096
	str	r3, [sp, #16]
	ldr	r3, [sp, #16]
.LBE5:
.LBB6:
	.loc 1 101 5
	ldr	r3, .L7+4
	ldr	r3, [r3, #24]
	ldr	r2, .L7+4
	orr	r3, r3, #8
	str	r3, [r2, #24]
	ldr	r3, .L7+4
	ldr	r3, [r3, #24]
	and	r3, r3, #8
	str	r3, [sp, #12]
	ldr	r3, [sp, #12]
.LBE6:
	.loc 1 106 25
	movs	r3, #40
	str	r3, [sp, #20]
	.loc 1 107 26
	movs	r3, #2
	str	r3, [sp, #24]
	.loc 1 108 27
	movs	r3, #3
	str	r3, [sp, #32]
	.loc 1 109 5
	add	r3, sp, #20
	mov	r1, r3
	ldr	r0, .L7+8
	bl	HAL_GPIO_Init
.LBB7:
	.loc 1 111 5
	ldr	r3, .L7+12
	ldr	r3, [r3, #4]
	str	r3, [sp, #36]
	ldr	r3, [sp, #36]
	orr	r3, r3, #117440512
	str	r3, [sp, #36]
	ldr	r3, [sp, #36]
	orr	r3, r3, #1
	str	r3, [sp, #36]
	ldr	r2, .L7+12
	ldr	r3, [sp, #36]
	str	r3, [r2, #4]
.L6:
.LBE7:
	.loc 1 119 1
	nop
	add	sp, sp, #44
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
.L8:
	.align	2
.L7:
	.word	1073819648
	.word	1073876992
	.word	1073810432
	.word	1073807360
	.cfi_endproc
.LFE66:
	.size	HAL_SPI_MspInit, .-HAL_SPI_MspInit
	.section	.text.HAL_SPI_MspDeInit,"ax",%progbits
	.align	1
	.global	HAL_SPI_MspDeInit
	.syntax unified
	.thumb
	.thumb_func
	.type	HAL_SPI_MspDeInit, %function
HAL_SPI_MspDeInit:
.LFB67:
	.loc 1 128 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{lr}
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #12
	.cfi_def_cfa_offset 16
	str	r0, [sp, #4]
	.loc 1 129 10
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	.loc 1 129 5
	ldr	r2, .L12
	cmp	r3, r2
	bne	.L11
	.loc 1 135 5
	ldr	r3, .L12+4
	ldr	r3, [r3, #24]
	ldr	r2, .L12+4
	bic	r3, r3, #4096
	str	r3, [r2, #24]
	.loc 1 141 5
	movs	r1, #40
	ldr	r0, .L12+8
	bl	HAL_GPIO_DeInit
.L11:
	.loc 1 148 1
	nop
	add	sp, sp, #12
	.cfi_def_cfa_offset 4
	@ sp needed
	ldr	pc, [sp], #4
.L13:
	.align	2
.L12:
	.word	1073819648
	.word	1073876992
	.word	1073810432
	.cfi_endproc
.LFE67:
	.size	HAL_SPI_MspDeInit, .-HAL_SPI_MspDeInit
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_5.3/include/stdint.h"
	.file 3 "./../Drivers/CMSIS/Device/ST/STM32F1xx/Include/stm32f103xe.h"
	.file 4 "./../Drivers/STM32F1xx_HAL_Driver/Inc/stm32f1xx_hal_def.h"
	.file 5 "./../Drivers/STM32F1xx_HAL_Driver/Inc/stm32f1xx_hal_gpio.h"
	.file 6 "./../Drivers/STM32F1xx_HAL_Driver/Inc/stm32f1xx_hal_dma.h"
	.file 7 "./../Drivers/STM32F1xx_HAL_Driver/Inc/stm32f1xx_hal_spi.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x894
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF112
	.byte	0xc
	.4byte	.LASF113
	.4byte	.LASF114
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x2
	.byte	0xf
	.byte	0x1c
	.4byte	0x3d
	.uleb128 0x4
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x2
	.byte	0x15
	.byte	0x1c
	.4byte	0x5c
	.uleb128 0x5
	.4byte	0x4b
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x6
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x2
	.byte	0x1c
	.byte	0x1c
	.4byte	0x7b
	.uleb128 0x5
	.4byte	0x6a
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x7
	.byte	0x10
	.byte	0x3
	.2byte	0x168
	.byte	0x9
	.4byte	0xd3
	.uleb128 0x8
	.ascii	"CCR\000"
	.byte	0x3
	.2byte	0x16a
	.byte	0x11
	.4byte	0x76
	.byte	0
	.uleb128 0x9
	.4byte	.LASF10
	.byte	0x3
	.2byte	0x16b
	.byte	0x11
	.4byte	0x76
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF11
	.byte	0x3
	.2byte	0x16c
	.byte	0x11
	.4byte	0x76
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF12
	.byte	0x3
	.2byte	0x16d
	.byte	0x11
	.4byte	0x76
	.byte	0xc
	.byte	0
	.uleb128 0xa
	.4byte	.LASF13
	.byte	0x3
	.2byte	0x16e
	.byte	0x3
	.4byte	0x90
	.uleb128 0x7
	.byte	0x8
	.byte	0x3
	.2byte	0x170
	.byte	0x9
	.4byte	0x107
	.uleb128 0x8
	.ascii	"ISR\000"
	.byte	0x3
	.2byte	0x172
	.byte	0x11
	.4byte	0x76
	.byte	0
	.uleb128 0x9
	.4byte	.LASF14
	.byte	0x3
	.2byte	0x173
	.byte	0x11
	.4byte	0x76
	.byte	0x4
	.byte	0
	.uleb128 0xa
	.4byte	.LASF15
	.byte	0x3
	.2byte	0x174
	.byte	0x3
	.4byte	0xe0
	.uleb128 0x7
	.byte	0x1c
	.byte	0x3
	.2byte	0x1e0
	.byte	0x9
	.4byte	0x181
	.uleb128 0x8
	.ascii	"CRL\000"
	.byte	0x3
	.2byte	0x1e2
	.byte	0x11
	.4byte	0x76
	.byte	0
	.uleb128 0x8
	.ascii	"CRH\000"
	.byte	0x3
	.2byte	0x1e3
	.byte	0x11
	.4byte	0x76
	.byte	0x4
	.uleb128 0x8
	.ascii	"IDR\000"
	.byte	0x3
	.2byte	0x1e4
	.byte	0x11
	.4byte	0x76
	.byte	0x8
	.uleb128 0x8
	.ascii	"ODR\000"
	.byte	0x3
	.2byte	0x1e5
	.byte	0x11
	.4byte	0x76
	.byte	0xc
	.uleb128 0x9
	.4byte	.LASF16
	.byte	0x3
	.2byte	0x1e6
	.byte	0x11
	.4byte	0x76
	.byte	0x10
	.uleb128 0x8
	.ascii	"BRR\000"
	.byte	0x3
	.2byte	0x1e7
	.byte	0x11
	.4byte	0x76
	.byte	0x14
	.uleb128 0x9
	.4byte	.LASF17
	.byte	0x3
	.2byte	0x1e8
	.byte	0x11
	.4byte	0x76
	.byte	0x18
	.byte	0
	.uleb128 0xa
	.4byte	.LASF18
	.byte	0x3
	.2byte	0x1e9
	.byte	0x3
	.4byte	0x114
	.uleb128 0x7
	.byte	0x20
	.byte	0x3
	.2byte	0x1ef
	.byte	0x9
	.4byte	0x1df
	.uleb128 0x9
	.4byte	.LASF19
	.byte	0x3
	.2byte	0x1f1
	.byte	0x11
	.4byte	0x76
	.byte	0
	.uleb128 0x9
	.4byte	.LASF20
	.byte	0x3
	.2byte	0x1f2
	.byte	0x11
	.4byte	0x76
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF21
	.byte	0x3
	.2byte	0x1f3
	.byte	0x11
	.4byte	0x1ef
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF22
	.byte	0x3
	.2byte	0x1f4
	.byte	0xc
	.4byte	0x6a
	.byte	0x18
	.uleb128 0x9
	.4byte	.LASF23
	.byte	0x3
	.2byte	0x1f5
	.byte	0x11
	.4byte	0x76
	.byte	0x1c
	.byte	0
	.uleb128 0xb
	.4byte	0x76
	.4byte	0x1ef
	.uleb128 0xc
	.4byte	0x7b
	.byte	0x3
	.byte	0
	.uleb128 0x5
	.4byte	0x1df
	.uleb128 0xa
	.4byte	.LASF24
	.byte	0x3
	.2byte	0x1f6
	.byte	0x3
	.4byte	0x18e
	.uleb128 0x7
	.byte	0x28
	.byte	0x3
	.2byte	0x222
	.byte	0x9
	.4byte	0x297
	.uleb128 0x8
	.ascii	"CR\000"
	.byte	0x3
	.2byte	0x224
	.byte	0x11
	.4byte	0x76
	.byte	0
	.uleb128 0x9
	.4byte	.LASF25
	.byte	0x3
	.2byte	0x225
	.byte	0x11
	.4byte	0x76
	.byte	0x4
	.uleb128 0x8
	.ascii	"CIR\000"
	.byte	0x3
	.2byte	0x226
	.byte	0x11
	.4byte	0x76
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF26
	.byte	0x3
	.2byte	0x227
	.byte	0x11
	.4byte	0x76
	.byte	0xc
	.uleb128 0x9
	.4byte	.LASF27
	.byte	0x3
	.2byte	0x228
	.byte	0x11
	.4byte	0x76
	.byte	0x10
	.uleb128 0x9
	.4byte	.LASF28
	.byte	0x3
	.2byte	0x229
	.byte	0x11
	.4byte	0x76
	.byte	0x14
	.uleb128 0x9
	.4byte	.LASF29
	.byte	0x3
	.2byte	0x22a
	.byte	0x11
	.4byte	0x76
	.byte	0x18
	.uleb128 0x9
	.4byte	.LASF30
	.byte	0x3
	.2byte	0x22b
	.byte	0x11
	.4byte	0x76
	.byte	0x1c
	.uleb128 0x9
	.4byte	.LASF31
	.byte	0x3
	.2byte	0x22c
	.byte	0x11
	.4byte	0x76
	.byte	0x20
	.uleb128 0x8
	.ascii	"CSR\000"
	.byte	0x3
	.2byte	0x22d
	.byte	0x11
	.4byte	0x76
	.byte	0x24
	.byte	0
	.uleb128 0xa
	.4byte	.LASF32
	.byte	0x3
	.2byte	0x230
	.byte	0x3
	.4byte	0x201
	.uleb128 0x7
	.byte	0x24
	.byte	0x3
	.2byte	0x264
	.byte	0x9
	.4byte	0x32b
	.uleb128 0x8
	.ascii	"CR1\000"
	.byte	0x3
	.2byte	0x266
	.byte	0x11
	.4byte	0x76
	.byte	0
	.uleb128 0x8
	.ascii	"CR2\000"
	.byte	0x3
	.2byte	0x267
	.byte	0x11
	.4byte	0x76
	.byte	0x4
	.uleb128 0x8
	.ascii	"SR\000"
	.byte	0x3
	.2byte	0x268
	.byte	0x11
	.4byte	0x76
	.byte	0x8
	.uleb128 0x8
	.ascii	"DR\000"
	.byte	0x3
	.2byte	0x269
	.byte	0x11
	.4byte	0x76
	.byte	0xc
	.uleb128 0x9
	.4byte	.LASF33
	.byte	0x3
	.2byte	0x26a
	.byte	0x11
	.4byte	0x76
	.byte	0x10
	.uleb128 0x9
	.4byte	.LASF34
	.byte	0x3
	.2byte	0x26b
	.byte	0x11
	.4byte	0x76
	.byte	0x14
	.uleb128 0x9
	.4byte	.LASF35
	.byte	0x3
	.2byte	0x26c
	.byte	0x11
	.4byte	0x76
	.byte	0x18
	.uleb128 0x9
	.4byte	.LASF36
	.byte	0x3
	.2byte	0x26d
	.byte	0x11
	.4byte	0x76
	.byte	0x1c
	.uleb128 0x9
	.4byte	.LASF37
	.byte	0x3
	.2byte	0x26e
	.byte	0x11
	.4byte	0x76
	.byte	0x20
	.byte	0
	.uleb128 0xa
	.4byte	.LASF38
	.byte	0x3
	.2byte	0x26f
	.byte	0x3
	.4byte	0x2a4
	.uleb128 0xd
	.byte	0x4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF39
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF40
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF41
	.uleb128 0xe
	.byte	0x7
	.byte	0x1
	.4byte	0x3d
	.byte	0x4
	.byte	0x32
	.byte	0x1
	.4byte	0x36a
	.uleb128 0xf
	.4byte	.LASF42
	.byte	0
	.uleb128 0xf
	.4byte	.LASF43
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF44
	.byte	0x4
	.byte	0x35
	.byte	0x3
	.4byte	0x34f
	.uleb128 0x10
	.byte	0x10
	.byte	0x5
	.byte	0x2e
	.byte	0x9
	.4byte	0x3b4
	.uleb128 0x11
	.ascii	"Pin\000"
	.byte	0x5
	.byte	0x30
	.byte	0xc
	.4byte	0x6a
	.byte	0
	.uleb128 0x12
	.4byte	.LASF45
	.byte	0x5
	.byte	0x33
	.byte	0xc
	.4byte	0x6a
	.byte	0x4
	.uleb128 0x12
	.4byte	.LASF46
	.byte	0x5
	.byte	0x36
	.byte	0xc
	.4byte	0x6a
	.byte	0x8
	.uleb128 0x12
	.4byte	.LASF47
	.byte	0x5
	.byte	0x39
	.byte	0xc
	.4byte	0x6a
	.byte	0xc
	.byte	0
	.uleb128 0x3
	.4byte	.LASF48
	.byte	0x5
	.byte	0x3b
	.byte	0x3
	.4byte	0x376
	.uleb128 0x10
	.byte	0x1c
	.byte	0x6
	.byte	0x2f
	.byte	0x9
	.4byte	0x425
	.uleb128 0x12
	.4byte	.LASF49
	.byte	0x6
	.byte	0x31
	.byte	0xc
	.4byte	0x6a
	.byte	0
	.uleb128 0x12
	.4byte	.LASF50
	.byte	0x6
	.byte	0x35
	.byte	0xc
	.4byte	0x6a
	.byte	0x4
	.uleb128 0x12
	.4byte	.LASF51
	.byte	0x6
	.byte	0x38
	.byte	0xc
	.4byte	0x6a
	.byte	0x8
	.uleb128 0x12
	.4byte	.LASF52
	.byte	0x6
	.byte	0x3b
	.byte	0xc
	.4byte	0x6a
	.byte	0xc
	.uleb128 0x12
	.4byte	.LASF53
	.byte	0x6
	.byte	0x3e
	.byte	0xc
	.4byte	0x6a
	.byte	0x10
	.uleb128 0x12
	.4byte	.LASF45
	.byte	0x6
	.byte	0x41
	.byte	0xc
	.4byte	0x6a
	.byte	0x14
	.uleb128 0x12
	.4byte	.LASF54
	.byte	0x6
	.byte	0x46
	.byte	0xc
	.4byte	0x6a
	.byte	0x18
	.byte	0
	.uleb128 0x3
	.4byte	.LASF55
	.byte	0x6
	.byte	0x48
	.byte	0x3
	.4byte	0x3c0
	.uleb128 0xe
	.byte	0x7
	.byte	0x1
	.4byte	0x3d
	.byte	0x6
	.byte	0x4e
	.byte	0x1
	.4byte	0x458
	.uleb128 0xf
	.4byte	.LASF56
	.byte	0
	.uleb128 0xf
	.4byte	.LASF57
	.byte	0x1
	.uleb128 0xf
	.4byte	.LASF58
	.byte	0x2
	.uleb128 0xf
	.4byte	.LASF59
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.4byte	.LASF60
	.byte	0x6
	.byte	0x53
	.byte	0x2
	.4byte	0x431
	.uleb128 0x5
	.4byte	0x458
	.uleb128 0x13
	.4byte	.LASF92
	.byte	0x44
	.byte	0x6
	.byte	0x6e
	.byte	0x10
	.4byte	0x513
	.uleb128 0x12
	.4byte	.LASF61
	.byte	0x6
	.byte	0x70
	.byte	0x1f
	.4byte	0x513
	.byte	0
	.uleb128 0x12
	.4byte	.LASF62
	.byte	0x6
	.byte	0x72
	.byte	0x1e
	.4byte	0x425
	.byte	0x4
	.uleb128 0x12
	.4byte	.LASF63
	.byte	0x6
	.byte	0x74
	.byte	0x1e
	.4byte	0x36a
	.byte	0x20
	.uleb128 0x12
	.4byte	.LASF64
	.byte	0x6
	.byte	0x76
	.byte	0x1e
	.4byte	0x464
	.byte	0x21
	.uleb128 0x12
	.4byte	.LASF65
	.byte	0x6
	.byte	0x78
	.byte	0x1f
	.4byte	0x338
	.byte	0x24
	.uleb128 0x12
	.4byte	.LASF66
	.byte	0x6
	.byte	0x7a
	.byte	0x21
	.4byte	0x52a
	.byte	0x28
	.uleb128 0x12
	.4byte	.LASF67
	.byte	0x6
	.byte	0x7c
	.byte	0x21
	.4byte	0x52a
	.byte	0x2c
	.uleb128 0x12
	.4byte	.LASF68
	.byte	0x6
	.byte	0x7e
	.byte	0x21
	.4byte	0x52a
	.byte	0x30
	.uleb128 0x12
	.4byte	.LASF69
	.byte	0x6
	.byte	0x80
	.byte	0x21
	.4byte	0x52a
	.byte	0x34
	.uleb128 0x12
	.4byte	.LASF70
	.byte	0x6
	.byte	0x82
	.byte	0x1e
	.4byte	0x76
	.byte	0x38
	.uleb128 0x12
	.4byte	.LASF71
	.byte	0x6
	.byte	0x84
	.byte	0x1f
	.4byte	0x530
	.byte	0x3c
	.uleb128 0x12
	.4byte	.LASF72
	.byte	0x6
	.byte	0x86
	.byte	0x1e
	.4byte	0x6a
	.byte	0x40
	.byte	0
	.uleb128 0x14
	.byte	0x4
	.4byte	0xd3
	.uleb128 0x15
	.4byte	0x524
	.uleb128 0x16
	.4byte	0x524
	.byte	0
	.uleb128 0x14
	.byte	0x4
	.4byte	0x469
	.uleb128 0x14
	.byte	0x4
	.4byte	0x519
	.uleb128 0x14
	.byte	0x4
	.4byte	0x107
	.uleb128 0x3
	.4byte	.LASF73
	.byte	0x6
	.byte	0x88
	.byte	0x3
	.4byte	0x469
	.uleb128 0x10
	.byte	0x2c
	.byte	0x7
	.byte	0x2e
	.byte	0x9
	.4byte	0x5db
	.uleb128 0x12
	.4byte	.LASF45
	.byte	0x7
	.byte	0x30
	.byte	0xc
	.4byte	0x6a
	.byte	0
	.uleb128 0x12
	.4byte	.LASF49
	.byte	0x7
	.byte	0x33
	.byte	0xc
	.4byte	0x6a
	.byte	0x4
	.uleb128 0x12
	.4byte	.LASF74
	.byte	0x7
	.byte	0x36
	.byte	0xc
	.4byte	0x6a
	.byte	0x8
	.uleb128 0x12
	.4byte	.LASF75
	.byte	0x7
	.byte	0x39
	.byte	0xc
	.4byte	0x6a
	.byte	0xc
	.uleb128 0x12
	.4byte	.LASF76
	.byte	0x7
	.byte	0x3c
	.byte	0xc
	.4byte	0x6a
	.byte	0x10
	.uleb128 0x11
	.ascii	"NSS\000"
	.byte	0x7
	.byte	0x3f
	.byte	0xc
	.4byte	0x6a
	.byte	0x14
	.uleb128 0x12
	.4byte	.LASF77
	.byte	0x7
	.byte	0x43
	.byte	0xc
	.4byte	0x6a
	.byte	0x18
	.uleb128 0x12
	.4byte	.LASF78
	.byte	0x7
	.byte	0x49
	.byte	0xc
	.4byte	0x6a
	.byte	0x1c
	.uleb128 0x12
	.4byte	.LASF79
	.byte	0x7
	.byte	0x4c
	.byte	0xc
	.4byte	0x6a
	.byte	0x20
	.uleb128 0x12
	.4byte	.LASF80
	.byte	0x7
	.byte	0x4f
	.byte	0xc
	.4byte	0x6a
	.byte	0x24
	.uleb128 0x12
	.4byte	.LASF81
	.byte	0x7
	.byte	0x52
	.byte	0xc
	.4byte	0x6a
	.byte	0x28
	.byte	0
	.uleb128 0x3
	.4byte	.LASF82
	.byte	0x7
	.byte	0x54
	.byte	0x3
	.4byte	0x542
	.uleb128 0xe
	.byte	0x7
	.byte	0x1
	.4byte	0x3d
	.byte	0x7
	.byte	0x5a
	.byte	0x1
	.4byte	0x626
	.uleb128 0xf
	.4byte	.LASF83
	.byte	0
	.uleb128 0xf
	.4byte	.LASF84
	.byte	0x1
	.uleb128 0xf
	.4byte	.LASF85
	.byte	0x2
	.uleb128 0xf
	.4byte	.LASF86
	.byte	0x3
	.uleb128 0xf
	.4byte	.LASF87
	.byte	0x4
	.uleb128 0xf
	.4byte	.LASF88
	.byte	0x5
	.uleb128 0xf
	.4byte	.LASF89
	.byte	0x6
	.uleb128 0xf
	.4byte	.LASF90
	.byte	0x7
	.byte	0
	.uleb128 0x3
	.4byte	.LASF91
	.byte	0x7
	.byte	0x63
	.byte	0x3
	.4byte	0x5e7
	.uleb128 0x5
	.4byte	0x626
	.uleb128 0x13
	.4byte	.LASF93
	.byte	0x58
	.byte	0x7
	.byte	0x68
	.byte	0x10
	.4byte	0x708
	.uleb128 0x12
	.4byte	.LASF61
	.byte	0x7
	.byte	0x6a
	.byte	0x1f
	.4byte	0x708
	.byte	0
	.uleb128 0x12
	.4byte	.LASF62
	.byte	0x7
	.byte	0x6c
	.byte	0x1e
	.4byte	0x5db
	.byte	0x4
	.uleb128 0x12
	.4byte	.LASF94
	.byte	0x7
	.byte	0x6e
	.byte	0x1f
	.4byte	0x70e
	.byte	0x30
	.uleb128 0x12
	.4byte	.LASF95
	.byte	0x7
	.byte	0x70
	.byte	0x1e
	.4byte	0x4b
	.byte	0x34
	.uleb128 0x12
	.4byte	.LASF96
	.byte	0x7
	.byte	0x72
	.byte	0x1e
	.4byte	0x57
	.byte	0x36
	.uleb128 0x12
	.4byte	.LASF97
	.byte	0x7
	.byte	0x74
	.byte	0x1f
	.4byte	0x714
	.byte	0x38
	.uleb128 0x12
	.4byte	.LASF98
	.byte	0x7
	.byte	0x76
	.byte	0x1e
	.4byte	0x4b
	.byte	0x3c
	.uleb128 0x12
	.4byte	.LASF99
	.byte	0x7
	.byte	0x78
	.byte	0x1e
	.4byte	0x57
	.byte	0x3e
	.uleb128 0x12
	.4byte	.LASF100
	.byte	0x7
	.byte	0x7a
	.byte	0xa
	.4byte	0x72b
	.byte	0x40
	.uleb128 0x12
	.4byte	.LASF101
	.byte	0x7
	.byte	0x7c
	.byte	0xa
	.4byte	0x72b
	.byte	0x44
	.uleb128 0x12
	.4byte	.LASF102
	.byte	0x7
	.byte	0x7e
	.byte	0x1f
	.4byte	0x731
	.byte	0x48
	.uleb128 0x12
	.4byte	.LASF103
	.byte	0x7
	.byte	0x80
	.byte	0x1f
	.4byte	0x731
	.byte	0x4c
	.uleb128 0x12
	.4byte	.LASF63
	.byte	0x7
	.byte	0x82
	.byte	0x1e
	.4byte	0x36a
	.byte	0x50
	.uleb128 0x12
	.4byte	.LASF64
	.byte	0x7
	.byte	0x84
	.byte	0x1e
	.4byte	0x632
	.byte	0x51
	.uleb128 0x12
	.4byte	.LASF70
	.byte	0x7
	.byte	0x86
	.byte	0x1e
	.4byte	0x76
	.byte	0x54
	.byte	0
	.uleb128 0x14
	.byte	0x4
	.4byte	0x32b
	.uleb128 0x14
	.byte	0x4
	.4byte	0x38
	.uleb128 0x14
	.byte	0x4
	.4byte	0x2c
	.uleb128 0x15
	.4byte	0x725
	.uleb128 0x16
	.4byte	0x725
	.byte	0
	.uleb128 0x14
	.byte	0x4
	.4byte	0x637
	.uleb128 0x14
	.byte	0x4
	.4byte	0x71a
	.uleb128 0x14
	.byte	0x4
	.4byte	0x536
	.uleb128 0x3
	.4byte	.LASF104
	.byte	0x7
	.byte	0x95
	.byte	0x3
	.4byte	0x637
	.uleb128 0x17
	.4byte	.LASF105
	.byte	0x5
	.byte	0xe0
	.byte	0x7
	.4byte	0x75a
	.uleb128 0x16
	.4byte	0x75a
	.uleb128 0x16
	.4byte	0x6a
	.byte	0
	.uleb128 0x14
	.byte	0x4
	.4byte	0x181
	.uleb128 0x17
	.4byte	.LASF106
	.byte	0x5
	.byte	0xdf
	.byte	0x7
	.4byte	0x777
	.uleb128 0x16
	.4byte	0x75a
	.uleb128 0x16
	.4byte	0x777
	.byte	0
	.uleb128 0x14
	.byte	0x4
	.4byte	0x3b4
	.uleb128 0x18
	.4byte	.LASF107
	.byte	0x1
	.byte	0x7f
	.byte	0x6
	.4byte	.LFB67
	.4byte	.LFE67-.LFB67
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7a3
	.uleb128 0x19
	.4byte	.LASF109
	.byte	0x1
	.byte	0x7f
	.byte	0x2b
	.4byte	0x7a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.byte	0x4
	.4byte	0x737
	.uleb128 0x18
	.4byte	.LASF108
	.byte	0x1
	.byte	0x5a
	.byte	0x6
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x831
	.uleb128 0x19
	.4byte	.LASF109
	.byte	0x1
	.byte	0x5a
	.byte	0x29
	.4byte	0x7a3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1a
	.4byte	.LASF110
	.byte	0x1
	.byte	0x5c
	.byte	0x14
	.4byte	0x3b4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1b
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.4byte	0x7fa
	.uleb128 0x1a
	.4byte	.LASF111
	.byte	0x1
	.byte	0x63
	.byte	0x5
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x1b
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.4byte	0x817
	.uleb128 0x1a
	.4byte	.LASF111
	.byte	0x1
	.byte	0x65
	.byte	0x5
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x1c
	.4byte	.LBB7
	.4byte	.LBE7-.LBB7
	.uleb128 0x1a
	.4byte	.LASF111
	.byte	0x1
	.byte	0x6f
	.byte	0x5
	.4byte	0x6a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF115
	.byte	0x1
	.byte	0x3f
	.byte	0x6
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1b
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.4byte	0x860
	.uleb128 0x1a
	.4byte	.LASF111
	.byte	0x1
	.byte	0x46
	.byte	0x3
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x1b
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.4byte	0x87d
	.uleb128 0x1a
	.4byte	.LASF111
	.byte	0x1
	.byte	0x47
	.byte	0x3
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1c
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.uleb128 0x1a
	.4byte	.LASF111
	.byte	0x1
	.byte	0x4d
	.byte	0x3
	.4byte	0x6a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x2134
	.uleb128 0x19
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x6e
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x898
	.4byte	0x743
	.ascii	"HAL_GPIO_DeInit\000"
	.4byte	0x760
	.ascii	"HAL_GPIO_Init\000"
	.4byte	0x77d
	.ascii	"HAL_SPI_MspDeInit\000"
	.4byte	0x7a9
	.ascii	"HAL_SPI_MspInit\000"
	.4byte	0x831
	.ascii	"HAL_MspInit\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x230
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x898
	.4byte	0x25
	.ascii	"signed char\000"
	.4byte	0x3d
	.ascii	"unsigned char\000"
	.4byte	0x2c
	.ascii	"uint8_t\000"
	.4byte	0x44
	.ascii	"short int\000"
	.4byte	0x5c
	.ascii	"short unsigned int\000"
	.4byte	0x4b
	.ascii	"uint16_t\000"
	.4byte	0x63
	.ascii	"int\000"
	.4byte	0x7b
	.ascii	"unsigned int\000"
	.4byte	0x6a
	.ascii	"uint32_t\000"
	.4byte	0x82
	.ascii	"long long int\000"
	.4byte	0x89
	.ascii	"long long unsigned int\000"
	.4byte	0xd3
	.ascii	"DMA_Channel_TypeDef\000"
	.4byte	0x107
	.ascii	"DMA_TypeDef\000"
	.4byte	0x181
	.ascii	"GPIO_TypeDef\000"
	.4byte	0x1f4
	.ascii	"AFIO_TypeDef\000"
	.4byte	0x297
	.ascii	"RCC_TypeDef\000"
	.4byte	0x32b
	.ascii	"SPI_TypeDef\000"
	.4byte	0x33a
	.ascii	"long int\000"
	.4byte	0x341
	.ascii	"char\000"
	.4byte	0x348
	.ascii	"long double\000"
	.4byte	0x36a
	.ascii	"HAL_LockTypeDef\000"
	.4byte	0x3b4
	.ascii	"GPIO_InitTypeDef\000"
	.4byte	0x425
	.ascii	"DMA_InitTypeDef\000"
	.4byte	0x458
	.ascii	"HAL_DMA_StateTypeDef\000"
	.4byte	0x469
	.ascii	"__DMA_HandleTypeDef\000"
	.4byte	0x536
	.ascii	"DMA_HandleTypeDef\000"
	.4byte	0x5db
	.ascii	"SPI_InitTypeDef\000"
	.4byte	0x626
	.ascii	"HAL_SPI_StateTypeDef\000"
	.4byte	0x637
	.ascii	"__SPI_HandleTypeDef\000"
	.4byte	0x737
	.ascii	"SPI_HandleTypeDef\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.4byte	.LFB67
	.4byte	.LFE67-.LFB67
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB65
	.4byte	.LFE65
	.4byte	.LFB66
	.4byte	.LFE66
	.4byte	.LFB67
	.4byte	.LFE67
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF17:
	.ascii	"LCKR\000"
.LASF34:
	.ascii	"RXCRCR\000"
.LASF55:
	.ascii	"DMA_InitTypeDef\000"
.LASF81:
	.ascii	"CRCPolynomial\000"
.LASF24:
	.ascii	"AFIO_TypeDef\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF33:
	.ascii	"CRCPR\000"
.LASF23:
	.ascii	"MAPR2\000"
.LASF96:
	.ascii	"TxXferCount\000"
.LASF8:
	.ascii	"long long int\000"
.LASF0:
	.ascii	"signed char\000"
.LASF16:
	.ascii	"BSRR\000"
.LASF67:
	.ascii	"XferHalfCpltCallback\000"
.LASF36:
	.ascii	"I2SCFGR\000"
.LASF114:
	.ascii	"/home/jennifer/repos/APA102_LED_Driver/Test-Project"
	.ascii	"s/STM32_Exampe/EWARM\000"
.LASF109:
	.ascii	"hspi\000"
.LASF111:
	.ascii	"tmpreg\000"
.LASF44:
	.ascii	"HAL_LockTypeDef\000"
.LASF104:
	.ascii	"SPI_HandleTypeDef\000"
.LASF39:
	.ascii	"long int\000"
.LASF94:
	.ascii	"pTxBuffPtr\000"
.LASF86:
	.ascii	"HAL_SPI_STATE_BUSY_TX\000"
.LASF50:
	.ascii	"PeriphInc\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF72:
	.ascii	"ChannelIndex\000"
.LASF65:
	.ascii	"Parent\000"
.LASF35:
	.ascii	"TXCRCR\000"
.LASF63:
	.ascii	"Lock\000"
.LASF46:
	.ascii	"Pull\000"
.LASF45:
	.ascii	"Mode\000"
.LASF49:
	.ascii	"Direction\000"
.LASF103:
	.ascii	"hdmarx\000"
.LASF19:
	.ascii	"EVCR\000"
.LASF15:
	.ascii	"DMA_TypeDef\000"
.LASF7:
	.ascii	"unsigned int\000"
.LASF56:
	.ascii	"HAL_DMA_STATE_RESET\000"
.LASF110:
	.ascii	"GPIO_InitStruct\000"
.LASF11:
	.ascii	"CPAR\000"
.LASF18:
	.ascii	"GPIO_TypeDef\000"
.LASF32:
	.ascii	"RCC_TypeDef\000"
.LASF112:
	.ascii	"GNU C17 14.3.1 20250623 -fmessage-length=0 -mcpu=co"
	.ascii	"rtex-m3 -mlittle-endian -mfloat-abi=soft -mabi=aapc"
	.ascii	"s -mthumb -munaligned-access -mtp=soft -mfp16-forma"
	.ascii	"t=ieee -gdwarf-4 -g2 -gpubnames -fomit-frame-pointe"
	.ascii	"r -ffunction-sections -fdata-sections -fshort-enums"
	.ascii	" -fno-common\000"
.LASF93:
	.ascii	"__SPI_HandleTypeDef\000"
.LASF98:
	.ascii	"RxXferSize\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF95:
	.ascii	"TxXferSize\000"
.LASF26:
	.ascii	"APB2RSTR\000"
.LASF71:
	.ascii	"DmaBaseAddress\000"
.LASF28:
	.ascii	"AHBENR\000"
.LASF70:
	.ascii	"ErrorCode\000"
.LASF115:
	.ascii	"HAL_MspInit\000"
.LASF53:
	.ascii	"MemDataAlignment\000"
.LASF82:
	.ascii	"SPI_InitTypeDef\000"
.LASF77:
	.ascii	"BaudRatePrescaler\000"
.LASF57:
	.ascii	"HAL_DMA_STATE_READY\000"
.LASF12:
	.ascii	"CMAR\000"
.LASF75:
	.ascii	"CLKPolarity\000"
.LASF88:
	.ascii	"HAL_SPI_STATE_BUSY_TX_RX\000"
.LASF37:
	.ascii	"I2SPR\000"
.LASF47:
	.ascii	"Speed\000"
.LASF41:
	.ascii	"long double\000"
.LASF43:
	.ascii	"HAL_LOCKED\000"
.LASF73:
	.ascii	"DMA_HandleTypeDef\000"
.LASF106:
	.ascii	"HAL_GPIO_Init\000"
.LASF68:
	.ascii	"XferErrorCallback\000"
.LASF48:
	.ascii	"GPIO_InitTypeDef\000"
.LASF102:
	.ascii	"hdmatx\000"
.LASF76:
	.ascii	"CLKPhase\000"
.LASF27:
	.ascii	"APB1RSTR\000"
.LASF78:
	.ascii	"FirstBit\000"
.LASF13:
	.ascii	"DMA_Channel_TypeDef\000"
.LASF62:
	.ascii	"Init\000"
.LASF84:
	.ascii	"HAL_SPI_STATE_READY\000"
.LASF22:
	.ascii	"RESERVED0\000"
.LASF61:
	.ascii	"Instance\000"
.LASF89:
	.ascii	"HAL_SPI_STATE_ERROR\000"
.LASF107:
	.ascii	"HAL_SPI_MspDeInit\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF100:
	.ascii	"RxISR\000"
.LASF60:
	.ascii	"HAL_DMA_StateTypeDef\000"
.LASF2:
	.ascii	"short int\000"
.LASF58:
	.ascii	"HAL_DMA_STATE_BUSY\000"
.LASF29:
	.ascii	"APB2ENR\000"
.LASF83:
	.ascii	"HAL_SPI_STATE_RESET\000"
.LASF92:
	.ascii	"__DMA_HandleTypeDef\000"
.LASF6:
	.ascii	"uint32_t\000"
.LASF14:
	.ascii	"IFCR\000"
.LASF38:
	.ascii	"SPI_TypeDef\000"
.LASF40:
	.ascii	"char\000"
.LASF64:
	.ascii	"State\000"
.LASF74:
	.ascii	"DataSize\000"
.LASF99:
	.ascii	"RxXferCount\000"
.LASF51:
	.ascii	"MemInc\000"
.LASF90:
	.ascii	"HAL_SPI_STATE_ABORT\000"
.LASF30:
	.ascii	"APB1ENR\000"
.LASF91:
	.ascii	"HAL_SPI_StateTypeDef\000"
.LASF85:
	.ascii	"HAL_SPI_STATE_BUSY\000"
.LASF52:
	.ascii	"PeriphDataAlignment\000"
.LASF79:
	.ascii	"TIMode\000"
.LASF10:
	.ascii	"CNDTR\000"
.LASF31:
	.ascii	"BDCR\000"
.LASF59:
	.ascii	"HAL_DMA_STATE_TIMEOUT\000"
.LASF54:
	.ascii	"Priority\000"
.LASF97:
	.ascii	"pRxBuffPtr\000"
.LASF3:
	.ascii	"uint8_t\000"
.LASF80:
	.ascii	"CRCCalculation\000"
.LASF101:
	.ascii	"TxISR\000"
.LASF20:
	.ascii	"MAPR\000"
.LASF87:
	.ascii	"HAL_SPI_STATE_BUSY_RX\000"
.LASF25:
	.ascii	"CFGR\000"
.LASF113:
	.ascii	"/home/jennifer/repos/APA102_LED_Driver/Test-Project"
	.ascii	"s/STM32_Exampe/Core/Src/stm32f1xx_hal_msp.c\000"
.LASF42:
	.ascii	"HAL_UNLOCKED\000"
.LASF108:
	.ascii	"HAL_SPI_MspInit\000"
.LASF69:
	.ascii	"XferAbortCallback\000"
.LASF66:
	.ascii	"XferCpltCallback\000"
.LASF21:
	.ascii	"EXTICR\000"
.LASF105:
	.ascii	"HAL_GPIO_DeInit\000"
	.ident	"GCC: (based on arm-14.3.Rel1 source release) 14.3.1 20250623"
