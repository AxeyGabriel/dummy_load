;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_adc1_ClearFlag
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ADC1_ClearFlag
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
;	./src/stm8s_adc1_ClearFlag.c: 47: void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
;	-----------------------------------------
;	 function ADC1_ClearFlag
;	-----------------------------------------
_ADC1_ClearFlag:
	pushw	x
;	./src/stm8s_adc1_ClearFlag.c: 54: if ((Flag & 0x0F) == 0x01)
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
;	./src/stm8s_adc1_ClearFlag.c: 57: ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
	bres	21507, #6
	jra	00110$
00108$:
;	./src/stm8s_adc1_ClearFlag.c: 59: else if ((Flag & 0xF0) == 0x10)
	ld	a, (0x02, sp)
	and	a, #0xf0
	ld	xl, a
	clr	a
	ld	xh, a
	cpw	x, #0x0010
	jrne	00105$
;	./src/stm8s_adc1_ClearFlag.c: 62: temp = (uint8_t)(Flag & (uint8_t)0x0F);
	ld	a, (0x05, sp)
	and	a, #0x0f
;	./src/stm8s_adc1_ClearFlag.c: 63: if (temp < 8)
	ld	xl, a
	cp	a, #0x08
	jrnc	00102$
;	./src/stm8s_adc1_ClearFlag.c: 65: ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
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
	cpl	a
	and	a, (0x02, sp)
	ld	0x540d, a
	jra	00110$
00102$:
;	./src/stm8s_adc1_ClearFlag.c: 69: ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
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
	cpl	a
	and	a, (0x02, sp)
	ld	0x540c, a
	jra	00110$
00105$:
;	./src/stm8s_adc1_ClearFlag.c: 74: ADC1->CSR &= (uint8_t) (~Flag);
	ld	a, 0x5400
	ld	(0x02, sp), a
	ld	a, (0x05, sp)
	cpl	a
	and	a, (0x02, sp)
	ld	0x5400, a
00110$:
;	./src/stm8s_adc1_ClearFlag.c: 76: }
	popw	x
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
