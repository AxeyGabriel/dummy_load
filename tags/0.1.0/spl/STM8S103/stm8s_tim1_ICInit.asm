;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_tim1_ICInit
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM1_TI4_Config
	.globl _TIM1_TI3_Config
	.globl _TIM1_TI2_Config
	.globl _TIM1_TI1_Config
	.globl _TIM1_SetIC4Prescaler
	.globl _TIM1_SetIC3Prescaler
	.globl _TIM1_SetIC2Prescaler
	.globl _TIM1_SetIC1Prescaler
	.globl _TIM1_ICInit
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
;	./src/stm8s_tim1_ICInit.c: 54: void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
;	-----------------------------------------
;	 function TIM1_ICInit
;	-----------------------------------------
_TIM1_ICInit:
;	./src/stm8s_tim1_ICInit.c: 67: if (TIM1_Channel == TIM1_CHANNEL_1)
	tnz	(0x03, sp)
	jrne	00108$
;	./src/stm8s_tim1_ICInit.c: 70: TIM1_TI1_Config((uint8_t)TIM1_ICPolarity,
	ld	a, (0x07, sp)
	push	a
	ld	a, (0x06, sp)
	push	a
	ld	a, (0x06, sp)
	push	a
	call	_TIM1_TI1_Config
	addw	sp, #3
;	./src/stm8s_tim1_ICInit.c: 74: TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
	ld	a, (0x06, sp)
	push	a
	call	_TIM1_SetIC1Prescaler
	pop	a
	ret
00108$:
;	./src/stm8s_tim1_ICInit.c: 76: else if (TIM1_Channel == TIM1_CHANNEL_2)
	ld	a, (0x03, sp)
	dec	a
	jrne	00105$
;	./src/stm8s_tim1_ICInit.c: 79: TIM1_TI2_Config((uint8_t)TIM1_ICPolarity,
	ld	a, (0x07, sp)
	push	a
	ld	a, (0x06, sp)
	push	a
	ld	a, (0x06, sp)
	push	a
	call	_TIM1_TI2_Config
	addw	sp, #3
;	./src/stm8s_tim1_ICInit.c: 83: TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
	ld	a, (0x06, sp)
	push	a
	call	_TIM1_SetIC2Prescaler
	pop	a
	ret
00105$:
;	./src/stm8s_tim1_ICInit.c: 85: else if (TIM1_Channel == TIM1_CHANNEL_3)
	ld	a, (0x03, sp)
	cp	a, #0x02
	jrne	00102$
;	./src/stm8s_tim1_ICInit.c: 88: TIM1_TI3_Config((uint8_t)TIM1_ICPolarity,
	ld	a, (0x07, sp)
	push	a
	ld	a, (0x06, sp)
	push	a
	ld	a, (0x06, sp)
	push	a
	call	_TIM1_TI3_Config
	addw	sp, #3
;	./src/stm8s_tim1_ICInit.c: 92: TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
	ld	a, (0x06, sp)
	push	a
	call	_TIM1_SetIC3Prescaler
	pop	a
	ret
00102$:
;	./src/stm8s_tim1_ICInit.c: 97: TIM1_TI4_Config((uint8_t)TIM1_ICPolarity,
	ld	a, (0x07, sp)
	push	a
	ld	a, (0x06, sp)
	push	a
	ld	a, (0x06, sp)
	push	a
	call	_TIM1_TI4_Config
	addw	sp, #3
;	./src/stm8s_tim1_ICInit.c: 101: TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
	ld	a, (0x06, sp)
	push	a
	call	_TIM1_SetIC4Prescaler
	pop	a
;	./src/stm8s_tim1_ICInit.c: 103: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
