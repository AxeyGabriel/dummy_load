;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_tim1_TIxExternalClockConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM1_TI2_Config
	.globl _TIM1_TI1_Config
	.globl _TIM1_SelectInputTrigger
	.globl _TIM1_TIxExternalClockConfig
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
;	./src/stm8s_tim1_TIxExternalClockConfig.c: 57: void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
;	-----------------------------------------
;	 function TIM1_TIxExternalClockConfig
;	-----------------------------------------
_TIM1_TIxExternalClockConfig:
;	./src/stm8s_tim1_TIxExternalClockConfig.c: 67: if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
	ld	a, (0x03, sp)
	cp	a, #0x60
	jrne	00102$
;	./src/stm8s_tim1_TIxExternalClockConfig.c: 69: TIM1_TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
	ld	a, (0x05, sp)
	push	a
	push	#0x01
	ld	a, (0x06, sp)
	push	a
	call	_TIM1_TI2_Config
	addw	sp, #3
	jra	00103$
00102$:
;	./src/stm8s_tim1_TIxExternalClockConfig.c: 73: TIM1_TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
	ld	a, (0x05, sp)
	push	a
	push	#0x01
	ld	a, (0x06, sp)
	push	a
	call	_TIM1_TI1_Config
	addw	sp, #3
00103$:
;	./src/stm8s_tim1_TIxExternalClockConfig.c: 77: TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
	ld	a, (0x03, sp)
	push	a
	call	_TIM1_SelectInputTrigger
	pop	a
;	./src/stm8s_tim1_TIxExternalClockConfig.c: 80: TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
	ld	a, 0x5252
	or	a, #0x07
	ld	0x5252, a
;	./src/stm8s_tim1_TIxExternalClockConfig.c: 81: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
