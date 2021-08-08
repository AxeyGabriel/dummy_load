;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_exti_SetExtIntSensitivity
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _EXTI_SetExtIntSensitivity
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
;	./src/stm8s_exti_SetExtIntSensitivity.c: 52: void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
;	-----------------------------------------
;	 function EXTI_SetExtIntSensitivity
;	-----------------------------------------
_EXTI_SetExtIntSensitivity:
	push	a
;	./src/stm8s_exti_SetExtIntSensitivity.c: 59: switch (Port)
	ld	a, (0x04, sp)
	cp	a, #0x04
	jrule	00115$
	jp	00108$
00115$:
;	./src/stm8s_exti_SetExtIntSensitivity.c: 67: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
	ld	a, (0x05, sp)
	ld	yl, a
;	./src/stm8s_exti_SetExtIntSensitivity.c: 59: switch (Port)
	clrw	x
	ld	a, (0x04, sp)
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
;	./src/stm8s_exti_SetExtIntSensitivity.c: 61: case EXTI_PORT_GPIOA:
00101$:
;	./src/stm8s_exti_SetExtIntSensitivity.c: 62: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
	ld	a, 0x50a0
	and	a, #0xfc
	ld	0x50a0, a
;	./src/stm8s_exti_SetExtIntSensitivity.c: 63: EXTI->CR1 |= (uint8_t)(SensitivityValue);
	ld	a, 0x50a0
	or	a, (0x05, sp)
	ld	0x50a0, a
;	./src/stm8s_exti_SetExtIntSensitivity.c: 64: break;
	jra	00108$
;	./src/stm8s_exti_SetExtIntSensitivity.c: 65: case EXTI_PORT_GPIOB:
00102$:
;	./src/stm8s_exti_SetExtIntSensitivity.c: 66: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
	ld	a, 0x50a0
	and	a, #0xf3
	ld	0x50a0, a
;	./src/stm8s_exti_SetExtIntSensitivity.c: 67: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
	ld	a, 0x50a0
	ldw	x, y
	sllw	x
	sllw	x
	pushw	x
	or	a, (2, sp)
	popw	x
	ld	0x50a0, a
;	./src/stm8s_exti_SetExtIntSensitivity.c: 68: break;
	jra	00108$
;	./src/stm8s_exti_SetExtIntSensitivity.c: 69: case EXTI_PORT_GPIOC:
00103$:
;	./src/stm8s_exti_SetExtIntSensitivity.c: 70: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
	ld	a, 0x50a0
	and	a, #0xcf
	ld	0x50a0, a
;	./src/stm8s_exti_SetExtIntSensitivity.c: 71: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
	ld	a, 0x50a0
	ld	(0x01, sp), a
	ld	a, yl
	swap	a
	and	a, #0xf0
	or	a, (0x01, sp)
	ld	0x50a0, a
;	./src/stm8s_exti_SetExtIntSensitivity.c: 72: break;
	jra	00108$
;	./src/stm8s_exti_SetExtIntSensitivity.c: 73: case EXTI_PORT_GPIOD:
00104$:
;	./src/stm8s_exti_SetExtIntSensitivity.c: 74: EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
	ld	a, 0x50a0
	and	a, #0x3f
	ld	0x50a0, a
;	./src/stm8s_exti_SetExtIntSensitivity.c: 75: EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
	ld	a, 0x50a0
	ld	(0x01, sp), a
	ld	a, yl
	swap	a
	and	a, #0xf0
	sll	a
	sll	a
	or	a, (0x01, sp)
	ld	0x50a0, a
;	./src/stm8s_exti_SetExtIntSensitivity.c: 76: break;
	jra	00108$
;	./src/stm8s_exti_SetExtIntSensitivity.c: 77: case EXTI_PORT_GPIOE:
00105$:
;	./src/stm8s_exti_SetExtIntSensitivity.c: 78: EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
	ld	a, 0x50a1
	and	a, #0xfc
	ld	0x50a1, a
;	./src/stm8s_exti_SetExtIntSensitivity.c: 79: EXTI->CR2 |= (uint8_t)(SensitivityValue);
	ld	a, 0x50a1
	or	a, (0x05, sp)
	ld	0x50a1, a
;	./src/stm8s_exti_SetExtIntSensitivity.c: 83: }
00108$:
;	./src/stm8s_exti_SetExtIntSensitivity.c: 84: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
