;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_adc1_AWDChannelConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ADC1_AWDChannelConfig
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
;	./src/stm8s_adc1_AWDChannelConfig.c: 49: void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
;	-----------------------------------------
;	 function ADC1_AWDChannelConfig
;	-----------------------------------------
_ADC1_AWDChannelConfig:
	push	a
;	./src/stm8s_adc1_AWDChannelConfig.c: 55: if (Channel < (uint8_t)8)
	ld	a, (0x04, sp)
	cp	a, #0x08
	jrnc	00108$
;	./src/stm8s_adc1_AWDChannelConfig.c: 59: ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
	ld	a, 0x540f
	ld	(0x01, sp), a
	ld	a, #0x01
	push	a
	ld	a, (0x05, sp)
	jreq	00129$
00128$:
	sll	(1, sp)
	dec	a
	jrne	00128$
00129$:
	pop	a
;	./src/stm8s_adc1_AWDChannelConfig.c: 57: if (NewState != DISABLE)
	tnz	(0x05, sp)
	jreq	00102$
;	./src/stm8s_adc1_AWDChannelConfig.c: 59: ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
	or	a, (0x01, sp)
	ld	0x540f, a
	jra	00110$
00102$:
;	./src/stm8s_adc1_AWDChannelConfig.c: 63: ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
	cpl	a
	and	a, (0x01, sp)
	ld	0x540f, a
	jra	00110$
00108$:
;	./src/stm8s_adc1_AWDChannelConfig.c: 70: ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
	ld	a, 0x540e
	ld	(0x01, sp), a
	ld	a, (0x04, sp)
	sub	a, #0x08
	ld	xl, a
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00132$
00131$:
	sll	(1, sp)
	dec	a
	jrne	00131$
00132$:
	pop	a
;	./src/stm8s_adc1_AWDChannelConfig.c: 68: if (NewState != DISABLE)
	tnz	(0x05, sp)
	jreq	00105$
;	./src/stm8s_adc1_AWDChannelConfig.c: 70: ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
	or	a, (0x01, sp)
	ld	0x540e, a
	jra	00110$
00105$:
;	./src/stm8s_adc1_AWDChannelConfig.c: 74: ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
	cpl	a
	and	a, (0x01, sp)
	ld	0x540e, a
00110$:
;	./src/stm8s_adc1_AWDChannelConfig.c: 77: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
