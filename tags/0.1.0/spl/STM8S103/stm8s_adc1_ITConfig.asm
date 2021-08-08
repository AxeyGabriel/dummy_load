;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_adc1_ITConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ADC1_ITConfig
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
;	./src/stm8s_adc1_ITConfig.c: 50: void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
;	-----------------------------------------
;	 function ADC1_ITConfig
;	-----------------------------------------
_ADC1_ITConfig:
	push	a
;	./src/stm8s_adc1_ITConfig.c: 59: ADC1->CSR |= (uint8_t)ADC1_IT;
	ld	a, 0x5400
	ld	(0x01, sp), a
;	./src/stm8s_adc1_ITConfig.c: 56: if (NewState != DISABLE)
	tnz	(0x06, sp)
	jreq	00102$
;	./src/stm8s_adc1_ITConfig.c: 59: ADC1->CSR |= (uint8_t)ADC1_IT;
	ld	a, (0x05, sp)
	or	a, (0x01, sp)
	ld	0x5400, a
	jra	00104$
00102$:
;	./src/stm8s_adc1_ITConfig.c: 64: ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
	ldw	x, (0x04, sp)
	cplw	x
	ld	a, xl
	and	a, (0x01, sp)
	ld	0x5400, a
00104$:
;	./src/stm8s_adc1_ITConfig.c: 66: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
