;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_adc1_GetAWDChannelStatus
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ADC1_GetAWDChannelStatus
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
;	./src/stm8s_adc1_GetAWDChannelStatus.c: 47: FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
;	-----------------------------------------
;	 function ADC1_GetAWDChannelStatus
;	-----------------------------------------
_ADC1_GetAWDChannelStatus:
	push	a
;	./src/stm8s_adc1_GetAWDChannelStatus.c: 54: if (Channel < (uint8_t)8)
	ld	a, (0x04, sp)
	cp	a, #0x08
	jrnc	00102$
;	./src/stm8s_adc1_GetAWDChannelStatus.c: 56: status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
	ld	a, 0x540d
	push	a
	ld	a, #0x01
	ld	(0x02, sp), a
	ld	a, (0x05, sp)
	jreq	00113$
00112$:
	sll	(0x02, sp)
	dec	a
	jrne	00112$
00113$:
	pop	a
	and	a, (0x01, sp)
	jra	00103$
00102$:
;	./src/stm8s_adc1_GetAWDChannelStatus.c: 60: status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
	ld	a, 0x540c
	ld	xl, a
	ld	a, (0x04, sp)
	sub	a, #0x08
	push	a
	ld	a, #0x01
	ld	(0x02, sp), a
	pop	a
	tnz	a
	jreq	00115$
00114$:
	sll	(0x01, sp)
	dec	a
	jrne	00114$
00115$:
	ld	a, xl
	and	a, (0x01, sp)
00103$:
;	./src/stm8s_adc1_GetAWDChannelStatus.c: 63: return ((FlagStatus)status);
;	./src/stm8s_adc1_GetAWDChannelStatus.c: 64: }
	addw	sp, #1
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
