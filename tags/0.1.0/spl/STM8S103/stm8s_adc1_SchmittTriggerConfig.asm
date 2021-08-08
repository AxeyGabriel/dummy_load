;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_adc1_SchmittTriggerConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ADC1_SchmittTriggerConfig
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
;	./src/stm8s_adc1_SchmittTriggerConfig.c: 49: void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
;	-----------------------------------------
;	 function ADC1_SchmittTriggerConfig
;	-----------------------------------------
_ADC1_SchmittTriggerConfig:
	push	a
;	./src/stm8s_adc1_SchmittTriggerConfig.c: 55: if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
	ld	a, (0x04, sp)
	inc	a
	jrne	00114$
;	./src/stm8s_adc1_SchmittTriggerConfig.c: 59: ADC1->TDRL &= (uint8_t)0x0;
	ld	a, 0x5407
;	./src/stm8s_adc1_SchmittTriggerConfig.c: 57: if (NewState != DISABLE)
	tnz	(0x05, sp)
	jreq	00102$
;	./src/stm8s_adc1_SchmittTriggerConfig.c: 59: ADC1->TDRL &= (uint8_t)0x0;
	mov	0x5407+0, #0x00
;	./src/stm8s_adc1_SchmittTriggerConfig.c: 60: ADC1->TDRH &= (uint8_t)0x0;
	ld	a, 0x5406
	mov	0x5406+0, #0x00
	jra	00116$
00102$:
;	./src/stm8s_adc1_SchmittTriggerConfig.c: 64: ADC1->TDRL |= (uint8_t)0xFF;
	mov	0x5407+0, #0xff
;	./src/stm8s_adc1_SchmittTriggerConfig.c: 65: ADC1->TDRH |= (uint8_t)0xFF;
	ld	a, 0x5406
	mov	0x5406+0, #0xff
	jra	00116$
00114$:
;	./src/stm8s_adc1_SchmittTriggerConfig.c: 68: else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
	ld	a, (0x04, sp)
	cp	a, #0x08
	jrnc	00111$
;	./src/stm8s_adc1_SchmittTriggerConfig.c: 59: ADC1->TDRL &= (uint8_t)0x0;
	ld	a, 0x5407
	ld	(0x01, sp), a
;	./src/stm8s_adc1_SchmittTriggerConfig.c: 72: ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
	ld	a, #0x01
	push	a
	ld	a, (0x05, sp)
	jreq	00149$
00148$:
	sll	(1, sp)
	dec	a
	jrne	00148$
00149$:
	pop	a
;	./src/stm8s_adc1_SchmittTriggerConfig.c: 70: if (NewState != DISABLE)
	tnz	(0x05, sp)
	jreq	00105$
;	./src/stm8s_adc1_SchmittTriggerConfig.c: 72: ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
	cpl	a
	and	a, (0x01, sp)
	ld	0x5407, a
	jra	00116$
00105$:
;	./src/stm8s_adc1_SchmittTriggerConfig.c: 76: ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
	or	a, (0x01, sp)
	ld	0x5407, a
	jra	00116$
00111$:
;	./src/stm8s_adc1_SchmittTriggerConfig.c: 60: ADC1->TDRH &= (uint8_t)0x0;
	ld	a, 0x5406
	ld	(0x01, sp), a
;	./src/stm8s_adc1_SchmittTriggerConfig.c: 83: ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
	ld	a, (0x04, sp)
	sub	a, #0x08
	ld	xl, a
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00152$
00151$:
	sll	(1, sp)
	dec	a
	jrne	00151$
00152$:
	pop	a
;	./src/stm8s_adc1_SchmittTriggerConfig.c: 81: if (NewState != DISABLE)
	tnz	(0x05, sp)
	jreq	00108$
;	./src/stm8s_adc1_SchmittTriggerConfig.c: 83: ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
	cpl	a
	and	a, (0x01, sp)
	ld	0x5406, a
	jra	00116$
00108$:
;	./src/stm8s_adc1_SchmittTriggerConfig.c: 87: ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
	or	a, (0x01, sp)
	ld	0x5406, a
00116$:
;	./src/stm8s_adc1_SchmittTriggerConfig.c: 90: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
