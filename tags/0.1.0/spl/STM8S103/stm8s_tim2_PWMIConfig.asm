;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_tim2_PWMIConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM2_TI2_Config
	.globl _TIM2_TI1_Config
	.globl _TIM2_SetIC2Prescaler
	.globl _TIM2_SetIC1Prescaler
	.globl _TIM2_PWMIConfig
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
;	./src/stm8s_tim2_PWMIConfig.c: 51: void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
;	-----------------------------------------
;	 function TIM2_PWMIConfig
;	-----------------------------------------
_TIM2_PWMIConfig:
	pushw	x
;	./src/stm8s_tim2_PWMIConfig.c: 67: if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
	ld	a, (0x06, sp)
	cp	a, #0x44
	jreq	00102$
;	./src/stm8s_tim2_PWMIConfig.c: 69: icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
	ld	a, #0x44
	ld	(0x01, sp), a
;	./src/stm8s_tim2_PWMIConfig.c: 73: icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
	.byte 0xc5
00102$:
	clr	(0x01, sp)
00103$:
;	./src/stm8s_tim2_PWMIConfig.c: 77: if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
	ld	a, (0x07, sp)
	dec	a
	jrne	00105$
;	./src/stm8s_tim2_PWMIConfig.c: 79: icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
	ld	a, #0x02
	ld	(0x02, sp), a
	jra	00106$
00105$:
;	./src/stm8s_tim2_PWMIConfig.c: 83: icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
	ld	a, #0x01
	ld	(0x02, sp), a
00106$:
;	./src/stm8s_tim2_PWMIConfig.c: 86: if (TIM2_Channel == TIM2_CHANNEL_1)
	tnz	(0x05, sp)
	jrne	00108$
;	./src/stm8s_tim2_PWMIConfig.c: 89: TIM2_TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
	ld	a, (0x09, sp)
	push	a
	ld	a, (0x08, sp)
	push	a
	ld	a, (0x08, sp)
	push	a
	call	_TIM2_TI1_Config
	addw	sp, #3
;	./src/stm8s_tim2_PWMIConfig.c: 93: TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
	ld	a, (0x08, sp)
	push	a
	call	_TIM2_SetIC1Prescaler
	pop	a
;	./src/stm8s_tim2_PWMIConfig.c: 96: TIM2_TI2_Config(icpolarity, icselection, TIM2_ICFilter);
	ld	a, (0x09, sp)
	push	a
	ld	a, (0x03, sp)
	push	a
	ld	a, (0x03, sp)
	push	a
	call	_TIM2_TI2_Config
	addw	sp, #3
;	./src/stm8s_tim2_PWMIConfig.c: 99: TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
	ld	a, (0x08, sp)
	push	a
	call	_TIM2_SetIC2Prescaler
	pop	a
	jra	00110$
00108$:
;	./src/stm8s_tim2_PWMIConfig.c: 104: TIM2_TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
	ld	a, (0x09, sp)
	push	a
	ld	a, (0x08, sp)
	push	a
	ld	a, (0x08, sp)
	push	a
	call	_TIM2_TI2_Config
	addw	sp, #3
;	./src/stm8s_tim2_PWMIConfig.c: 108: TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
	ld	a, (0x08, sp)
	push	a
	call	_TIM2_SetIC2Prescaler
	pop	a
;	./src/stm8s_tim2_PWMIConfig.c: 111: TIM2_TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
	ld	a, (0x09, sp)
	push	a
	ld	a, (0x03, sp)
	push	a
	ld	a, (0x03, sp)
	push	a
	call	_TIM2_TI1_Config
	addw	sp, #3
;	./src/stm8s_tim2_PWMIConfig.c: 114: TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
	ld	a, (0x08, sp)
	push	a
	call	_TIM2_SetIC1Prescaler
	pop	a
00110$:
;	./src/stm8s_tim2_PWMIConfig.c: 116: }
	popw	x
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
