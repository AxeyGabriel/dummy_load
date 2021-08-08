;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_uart1_GetFlagStatus
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _UART1_GetFlagStatus
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
;	./src/stm8s_uart1_GetFlagStatus.c: 47: FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
;	-----------------------------------------
;	 function UART1_GetFlagStatus
;	-----------------------------------------
_UART1_GetFlagStatus:
	push	a
;	./src/stm8s_uart1_GetFlagStatus.c: 58: if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
	ld	a, (0x05, sp)
	ld	(0x01, sp), a
;	./src/stm8s_uart1_GetFlagStatus.c: 56: if (UART1_FLAG == UART1_FLAG_LBDF)
	ldw	x, (0x04, sp)
	cpw	x, #0x0210
	jrne	00114$
;	./src/stm8s_uart1_GetFlagStatus.c: 58: if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
	ld	a, 0x5237
	and	a, (0x01, sp)
	jreq	00102$
;	./src/stm8s_uart1_GetFlagStatus.c: 61: status = SET;
	ld	a, #0x01
	jra	00115$
00102$:
;	./src/stm8s_uart1_GetFlagStatus.c: 66: status = RESET;
	clr	a
	jra	00115$
00114$:
;	./src/stm8s_uart1_GetFlagStatus.c: 69: else if (UART1_FLAG == UART1_FLAG_SBK)
	ldw	x, (0x04, sp)
	cpw	x, #0x0101
	jrne	00111$
;	./src/stm8s_uart1_GetFlagStatus.c: 71: if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
	ld	a, 0x5235
	and	a, (0x01, sp)
	jreq	00105$
;	./src/stm8s_uart1_GetFlagStatus.c: 74: status = SET;
	ld	a, #0x01
	jra	00115$
00105$:
;	./src/stm8s_uart1_GetFlagStatus.c: 79: status = RESET;
	clr	a
	jra	00115$
00111$:
;	./src/stm8s_uart1_GetFlagStatus.c: 84: if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
	ld	a, 0x5230
	and	a, (0x01, sp)
	jreq	00108$
;	./src/stm8s_uart1_GetFlagStatus.c: 87: status = SET;
	ld	a, #0x01
;	./src/stm8s_uart1_GetFlagStatus.c: 92: status = RESET;
	.byte 0x21
00108$:
	clr	a
00115$:
;	./src/stm8s_uart1_GetFlagStatus.c: 96: return status;
;	./src/stm8s_uart1_GetFlagStatus.c: 97: }
	addw	sp, #1
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
