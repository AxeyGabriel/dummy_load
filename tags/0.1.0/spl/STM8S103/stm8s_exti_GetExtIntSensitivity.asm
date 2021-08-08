;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_exti_GetExtIntSensitivity
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _EXTI_GetExtIntSensitivity
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
;	./src/stm8s_exti_GetExtIntSensitivity.c: 46: EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
;	-----------------------------------------
;	 function EXTI_GetExtIntSensitivity
;	-----------------------------------------
_EXTI_GetExtIntSensitivity:
;	./src/stm8s_exti_GetExtIntSensitivity.c: 48: uint8_t value = 0;
	clr	a
;	./src/stm8s_exti_GetExtIntSensitivity.c: 53: switch (Port)
	push	a
	ld	a, (0x04, sp)
	cp	a, #0x04
	pop	a
	jrule	00115$
	ret
00115$:
	clrw	x
	ld	a, (0x03, sp)
	ld	xl, a
	sllw	x
	ldw	x, (#00116$, x)
	jp	(x)
00116$:
	.dw	#00101$
	.dw	#00102$
	.dw	#00103$
	.dw	#00104$
	.dw	#00105$
;	./src/stm8s_exti_GetExtIntSensitivity.c: 55: case EXTI_PORT_GPIOA:
00101$:
;	./src/stm8s_exti_GetExtIntSensitivity.c: 56: value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
	ld	a, 0x50a0
	and	a, #0x03
;	./src/stm8s_exti_GetExtIntSensitivity.c: 57: break;
	ret
;	./src/stm8s_exti_GetExtIntSensitivity.c: 58: case EXTI_PORT_GPIOB:
00102$:
;	./src/stm8s_exti_GetExtIntSensitivity.c: 59: value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
	ld	a, 0x50a0
	and	a, #0x0c
	srl	a
	srl	a
;	./src/stm8s_exti_GetExtIntSensitivity.c: 60: break;
	ret
;	./src/stm8s_exti_GetExtIntSensitivity.c: 61: case EXTI_PORT_GPIOC:
00103$:
;	./src/stm8s_exti_GetExtIntSensitivity.c: 62: value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
	ld	a, 0x50a0
	and	a, #0x30
	swap	a
	and	a, #0x0f
;	./src/stm8s_exti_GetExtIntSensitivity.c: 63: break;
	ret
;	./src/stm8s_exti_GetExtIntSensitivity.c: 64: case EXTI_PORT_GPIOD:
00104$:
;	./src/stm8s_exti_GetExtIntSensitivity.c: 65: value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
	ld	a, 0x50a0
	and	a, #0xc0
	swap	a
	and	a, #0x0f
	srl	a
	srl	a
;	./src/stm8s_exti_GetExtIntSensitivity.c: 66: break;
	ret
;	./src/stm8s_exti_GetExtIntSensitivity.c: 67: case EXTI_PORT_GPIOE:
00105$:
;	./src/stm8s_exti_GetExtIntSensitivity.c: 68: value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
	ld	a, 0x50a1
	and	a, #0x03
;	./src/stm8s_exti_GetExtIntSensitivity.c: 72: }
;	./src/stm8s_exti_GetExtIntSensitivity.c: 74: return((EXTI_Sensitivity_TypeDef)value);
;	./src/stm8s_exti_GetExtIntSensitivity.c: 75: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
