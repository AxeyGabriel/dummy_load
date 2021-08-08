;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_adc1_GetITStatus
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ADC1_GetITStatus
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
;	./src/stm8s_adc1_GetITStatus.c: 59: ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
;	-----------------------------------------
;	 function ADC1_GetITStatus
;	-----------------------------------------
_ADC1_GetITStatus:
	push	a
;	./src/stm8s_adc1_GetITStatus.c: 67: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
	ld	a, (0x05, sp)
	and	a, #0xf0
	ld	xl, a
	clr	a
	ld	xh, a
;	./src/stm8s_adc1_GetITStatus.c: 70: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
	ld	a, (0x05, sp)
;	./src/stm8s_adc1_GetITStatus.c: 67: if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
	cpw	x, #0x0010
	jrne	00105$
;	./src/stm8s_adc1_GetITStatus.c: 70: temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
	and	a, #0x0f
;	./src/stm8s_adc1_GetITStatus.c: 71: if (temp < 8)
	ld	xl, a
	cp	a, #0x08
	jrnc	00102$
;	./src/stm8s_adc1_GetITStatus.c: 73: itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
	ld	a, 0x540d
	push	a
	ld	a, #0x01
	ld	(0x02, sp), a
	ld	a, xl
	tnz	a
	jreq	00124$
00123$:
	sll	(0x02, sp)
	dec	a
	jrne	00123$
00124$:
	pop	a
	and	a, (0x01, sp)
	jra	00106$
00102$:
;	./src/stm8s_adc1_GetITStatus.c: 77: itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
	ld	a, 0x540c
	ld	(0x01, sp), a
	subw	x, #8
	ld	a, #0x01
	push	a
	ld	a, xl
	tnz	a
	jreq	00126$
00125$:
	sll	(1, sp)
	dec	a
	jrne	00125$
00126$:
	pop	a
	and	a, (0x01, sp)
	jra	00106$
00105$:
;	./src/stm8s_adc1_GetITStatus.c: 82: itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
	ldw	x, #0x5400
	push	a
	ld	a, (x)
	ld	(0x02, sp), a
	pop	a
	and	a, (0x01, sp)
00106$:
;	./src/stm8s_adc1_GetITStatus.c: 84: return ((ITStatus)itstatus);
;	./src/stm8s_adc1_GetITStatus.c: 85: }
	addw	sp, #1
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
