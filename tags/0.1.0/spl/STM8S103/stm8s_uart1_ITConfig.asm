;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_uart1_ITConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _UART1_ITConfig
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
;	./src/stm8s_uart1_ITConfig.c: 54: void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
;	-----------------------------------------
;	 function UART1_ITConfig
;	-----------------------------------------
_UART1_ITConfig:
	pushw	x
;	./src/stm8s_uart1_ITConfig.c: 63: uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
	ld	a, (0x05, sp)
	ld	xl, a
;	./src/stm8s_uart1_ITConfig.c: 65: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
	ld	a, (0x06, sp)
	and	a, #0x0f
	push	a
	ld	a, #0x01
	ld	(0x03, sp), a
	pop	a
	tnz	a
	jreq	00144$
00143$:
	sll	(0x02, sp)
	dec	a
	jrne	00143$
00144$:
;	./src/stm8s_uart1_ITConfig.c: 70: if (uartreg == 0x01)
	ld	a, xl
	dec	a
	jrne	00146$
	ld	a, #0x01
	ld	(0x01, sp), a
	.byte 0xc5
00146$:
	clr	(0x01, sp)
00147$:
;	./src/stm8s_uart1_ITConfig.c: 74: else if (uartreg == 0x02)
	ld	a, xl
	sub	a, #0x02
	jrne	00149$
	inc	a
	.byte 0x21
00149$:
	clr	a
00150$:
;	./src/stm8s_uart1_ITConfig.c: 67: if (NewState != DISABLE)
	tnz	(0x07, sp)
	jreq	00114$
;	./src/stm8s_uart1_ITConfig.c: 70: if (uartreg == 0x01)
	tnz	(0x01, sp)
	jreq	00105$
;	./src/stm8s_uart1_ITConfig.c: 72: UART1->CR1 |= itpos;
	ld	a, 0x5234
	or	a, (0x02, sp)
	ld	0x5234, a
	jra	00116$
00105$:
;	./src/stm8s_uart1_ITConfig.c: 74: else if (uartreg == 0x02)
	tnz	a
	jreq	00102$
;	./src/stm8s_uart1_ITConfig.c: 76: UART1->CR2 |= itpos;
	ld	a, 0x5235
	or	a, (0x02, sp)
	ld	0x5235, a
	jra	00116$
00102$:
;	./src/stm8s_uart1_ITConfig.c: 80: UART1->CR4 |= itpos;
	ld	a, 0x5237
	or	a, (0x02, sp)
	ld	0x5237, a
	jra	00116$
00114$:
;	./src/stm8s_uart1_ITConfig.c: 88: UART1->CR1 &= (uint8_t)(~itpos);
	cpl	(0x02, sp)
;	./src/stm8s_uart1_ITConfig.c: 86: if (uartreg == 0x01)
	tnz	(0x01, sp)
	jreq	00111$
;	./src/stm8s_uart1_ITConfig.c: 88: UART1->CR1 &= (uint8_t)(~itpos);
	ld	a, 0x5234
	and	a, (0x02, sp)
	ld	0x5234, a
	jra	00116$
00111$:
;	./src/stm8s_uart1_ITConfig.c: 90: else if (uartreg == 0x02)
	tnz	a
	jreq	00108$
;	./src/stm8s_uart1_ITConfig.c: 92: UART1->CR2 &= (uint8_t)(~itpos);
	ld	a, 0x5235
	and	a, (0x02, sp)
	ld	0x5235, a
	jra	00116$
00108$:
;	./src/stm8s_uart1_ITConfig.c: 96: UART1->CR4 &= (uint8_t)(~itpos);
	ld	a, 0x5237
	and	a, (0x02, sp)
	ld	0x5237, a
00116$:
;	./src/stm8s_uart1_ITConfig.c: 100: }
	popw	x
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
