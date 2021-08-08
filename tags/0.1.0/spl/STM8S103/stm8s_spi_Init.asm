;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_spi_Init
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SPI_Init
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)

; default segment ordering for linker
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area CONST
	.area INITIALIZER
	.area CODE

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	./src/stm8s_spi_Init.c: 60: void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
;	-----------------------------------------
;	 function SPI_Init
;	-----------------------------------------
_SPI_Init:
	push	a
;	./src/stm8s_spi_Init.c: 73: SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
	ld	a, (0x04, sp)
	or	a, (0x05, sp)
	ld	(0x01, sp), a
;	./src/stm8s_spi_Init.c: 74: (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
	ld	a, (0x07, sp)
	or	a, (0x08, sp)
	or	a, (0x01, sp)
	ld	0x5200, a
;	./src/stm8s_spi_Init.c: 77: SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
	ld	a, (0x09, sp)
	or	a, (0x0a, sp)
	ld	0x5201, a
;	./src/stm8s_spi_Init.c: 81: SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
	ld	a, 0x5201
;	./src/stm8s_spi_Init.c: 79: if (Mode == SPI_MODE_MASTER)
	push	a
	ld	a, (0x07, sp)
	cp	a, #0x04
	pop	a
	jrne	00102$
;	./src/stm8s_spi_Init.c: 81: SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
	or	a, #0x01
	ld	0x5201, a
	jra	00103$
00102$:
;	./src/stm8s_spi_Init.c: 85: SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
	and	a, #0xfe
	ld	0x5201, a
00103$:
;	./src/stm8s_spi_Init.c: 89: SPI->CR1 |= (uint8_t)(Mode);
	ld	a, 0x5200
	or	a, (0x06, sp)
	ld	0x5200, a
;	./src/stm8s_spi_Init.c: 92: SPI->CRCPR = (uint8_t)CRCPolynomial;
	ldw	x, #0x5205
	ld	a, (0x0b, sp)
	ld	(x), a
;	./src/stm8s_spi_Init.c: 93: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
