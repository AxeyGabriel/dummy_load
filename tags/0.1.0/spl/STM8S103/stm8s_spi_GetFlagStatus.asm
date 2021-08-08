;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_spi_GetFlagStatus
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SPI_GetFlagStatus
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
;	./src/stm8s_spi_GetFlagStatus.c: 49: FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
;	-----------------------------------------
;	 function SPI_GetFlagStatus
;	-----------------------------------------
_SPI_GetFlagStatus:
;	./src/stm8s_spi_GetFlagStatus.c: 56: if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
	ld	a, 0x5203
	and	a, (0x03, sp)
	jreq	00102$
;	./src/stm8s_spi_GetFlagStatus.c: 58: status = SET; /* SPI_FLAG is set */
	ld	a, #0x01
	ret
00102$:
;	./src/stm8s_spi_GetFlagStatus.c: 62: status = RESET; /* SPI_FLAG is reset*/
	clr	a
;	./src/stm8s_spi_GetFlagStatus.c: 66: return status;
;	./src/stm8s_spi_GetFlagStatus.c: 67: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
