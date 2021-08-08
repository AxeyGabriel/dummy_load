;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_tim2_ICInit
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM2_TI3_Config
	.globl _TIM2_TI2_Config
	.globl _TIM2_TI1_Config
	.globl _TIM2_SetIC3Prescaler
	.globl _TIM2_SetIC2Prescaler
	.globl _TIM2_SetIC1Prescaler
	.globl _TIM2_ICInit
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
;	./src/stm8s_tim2_ICInit.c: 51: void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
;	-----------------------------------------
;	 function TIM2_ICInit
;	-----------------------------------------
_TIM2_ICInit:
;	./src/stm8s_tim2_ICInit.c: 64: if (TIM2_Channel == TIM2_CHANNEL_1)
	tnz	(0x03, sp)
	jrne	00105$
;	./src/stm8s_tim2_ICInit.c: 67: TIM2_TI1_Config((uint8_t)TIM2_ICPolarity,
	ld	a, (0x07, sp)
	push	a
	ld	a, (0x06, sp)
	push	a
	ld	a, (0x06, sp)
	push	a
	call	_TIM2_TI1_Config
	addw	sp, #3
;	./src/stm8s_tim2_ICInit.c: 72: TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
	ld	a, (0x06, sp)
	push	a
	call	_TIM2_SetIC1Prescaler
	pop	a
	ret
00105$:
;	./src/stm8s_tim2_ICInit.c: 74: else if (TIM2_Channel == TIM2_CHANNEL_2)
	ld	a, (0x03, sp)
	dec	a
	jrne	00102$
;	./src/stm8s_tim2_ICInit.c: 77: TIM2_TI2_Config((uint8_t)TIM2_ICPolarity,
	ld	a, (0x07, sp)
	push	a
	ld	a, (0x06, sp)
	push	a
	ld	a, (0x06, sp)
	push	a
	call	_TIM2_TI2_Config
	addw	sp, #3
;	./src/stm8s_tim2_ICInit.c: 82: TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
	ld	a, (0x06, sp)
	push	a
	call	_TIM2_SetIC2Prescaler
	pop	a
	ret
00102$:
;	./src/stm8s_tim2_ICInit.c: 87: TIM2_TI3_Config((uint8_t)TIM2_ICPolarity,
	ld	a, (0x07, sp)
	push	a
	ld	a, (0x06, sp)
	push	a
	ld	a, (0x06, sp)
	push	a
	call	_TIM2_TI3_Config
	addw	sp, #3
;	./src/stm8s_tim2_ICInit.c: 92: TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
	ld	a, (0x06, sp)
	push	a
	call	_TIM2_SetIC3Prescaler
	pop	a
;	./src/stm8s_tim2_ICInit.c: 94: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
