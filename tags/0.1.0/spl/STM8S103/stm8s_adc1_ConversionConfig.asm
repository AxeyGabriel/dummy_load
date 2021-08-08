;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_adc1_ConversionConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ADC1_ConversionConfig
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
;	./src/stm8s_adc1_ConversionConfig.c: 51: void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
;	-----------------------------------------
;	 function ADC1_ConversionConfig
;	-----------------------------------------
_ADC1_ConversionConfig:
;	./src/stm8s_adc1_ConversionConfig.c: 59: ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
	bres	21506, #3
;	./src/stm8s_adc1_ConversionConfig.c: 61: ADC1->CR2 |= (uint8_t)(ADC1_Align);
	ld	a, 0x5402
	or	a, (0x05, sp)
	ld	0x5402, a
;	./src/stm8s_adc1_ConversionConfig.c: 66: ADC1->CR1 |= ADC1_CR1_CONT;
	ld	a, 0x5401
;	./src/stm8s_adc1_ConversionConfig.c: 63: if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
	push	a
	ld	a, (0x04, sp)
	dec	a
	pop	a
	jrne	00102$
;	./src/stm8s_adc1_ConversionConfig.c: 66: ADC1->CR1 |= ADC1_CR1_CONT;
	or	a, #0x02
	ld	0x5401, a
	jra	00103$
00102$:
;	./src/stm8s_adc1_ConversionConfig.c: 71: ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
	and	a, #0xfd
	ld	0x5401, a
00103$:
;	./src/stm8s_adc1_ConversionConfig.c: 75: ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
	ld	a, 0x5400
	and	a, #0xf0
	ld	0x5400, a
;	./src/stm8s_adc1_ConversionConfig.c: 77: ADC1->CSR |= (uint8_t)(ADC1_Channel);
	ld	a, 0x5400
	or	a, (0x04, sp)
	ld	0x5400, a
;	./src/stm8s_adc1_ConversionConfig.c: 78: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
