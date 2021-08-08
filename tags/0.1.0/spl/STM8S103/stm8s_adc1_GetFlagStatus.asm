;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_adc1_GetFlagStatus
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ADC1_GetFlagStatus
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
;	./src/stm8s_adc1_GetFlagStatus.c: 47: FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
;	-----------------------------------------
;	 function ADC1_GetFlagStatus
;	-----------------------------------------
_ADC1_GetFlagStatus:
	pushw	x
;	./src/stm8s_adc1_GetFlagStatus.c: 55: if ((Flag & 0x0F) == 0x01)
	ld	a, (0x05, sp)
	ld	(0x02, sp), a
	clr	(0x01, sp)
	push	a
	ld	a, (0x03, sp)
	and	a, #0x0f
	ld	xl, a
	clr	a
	ld	xh, a
	pop	a
	decw	x
	jrne	00108$
;	./src/stm8s_adc1_GetFlagStatus.c: 58: flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
	ld	a, 0x5403
	and	a, #0x40
	jra	00109$
00108$:
;	./src/stm8s_adc1_GetFlagStatus.c: 60: else if ((Flag & 0xF0) == 0x10)
	ld	a, (0x02, sp)
	and	a, #0xf0
	ld	xl, a
	clr	a
	ld	xh, a
	cpw	x, #0x0010
	jrne	00105$
;	./src/stm8s_adc1_GetFlagStatus.c: 63: temp = (uint8_t)(Flag & (uint8_t)0x0F);
	ld	a, (0x05, sp)
	and	a, #0x0f
;	./src/stm8s_adc1_GetFlagStatus.c: 64: if (temp < 8)
	ld	xl, a
	cp	a, #0x08
	jrnc	00102$
;	./src/stm8s_adc1_GetFlagStatus.c: 66: flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
	ld	a, 0x540d
	ld	(0x02, sp), a
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00135$
00134$:
	sll	(1, sp)
	dec	a
	jrne	00134$
00135$:
	pop	a
	and	a, (0x02, sp)
	jra	00109$
00102$:
;	./src/stm8s_adc1_GetFlagStatus.c: 70: flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
	ld	a, 0x540c
	ld	(0x02, sp), a
	subw	x, #8
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00137$
00136$:
	sll	(1, sp)
	dec	a
	jrne	00136$
00137$:
	pop	a
	and	a, (0x02, sp)
	jra	00109$
00105$:
;	./src/stm8s_adc1_GetFlagStatus.c: 75: flagstatus = (uint8_t)(ADC1->CSR & Flag);
	ld	a, 0x5400
	and	a, (0x05, sp)
00109$:
;	./src/stm8s_adc1_GetFlagStatus.c: 77: return ((FlagStatus)flagstatus);
;	./src/stm8s_adc1_GetFlagStatus.c: 79: }
	popw	x
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
