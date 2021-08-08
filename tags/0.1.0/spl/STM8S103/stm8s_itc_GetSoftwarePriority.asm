;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_itc_GetSoftwarePriority
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ITC_GetSoftwarePriority
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
;	./src/stm8s_itc_GetSoftwarePriority.c: 46: ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
;	-----------------------------------------
;	 function ITC_GetSoftwarePriority
;	-----------------------------------------
_ITC_GetSoftwarePriority:
	sub	sp, #3
;	./src/stm8s_itc_GetSoftwarePriority.c: 48: uint8_t Value = 0;
	clr	(0x01, sp)
;	./src/stm8s_itc_GetSoftwarePriority.c: 55: Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
	ld	a, (0x06, sp)
	clrw	y
	and	a, #0x03
	sll	a
	ld	(0x02, sp), a
	ld	a, #0x03
	ld	(0x03, sp), a
	ld	a, (0x02, sp)
	jreq	00132$
00131$:
	sll	(0x03, sp)
	dec	a
	jrne	00131$
00132$:
;	./src/stm8s_itc_GetSoftwarePriority.c: 57: switch (IrqNum)
	ld	a, (0x06, sp)
	cp	a, #0x18
	jrugt	00123$
	clrw	x
	ld	a, (0x06, sp)
	ld	xl, a
	sllw	x
	ldw	x, (#00134$, x)
	jp	(x)
00134$:
	.dw	#00104$
	.dw	#00104$
	.dw	#00104$
	.dw	#00104$
	.dw	#00108$
	.dw	#00108$
	.dw	#00108$
	.dw	#00108$
	.dw	#00123$
	.dw	#00123$
	.dw	#00110$
	.dw	#00110$
	.dw	#00114$
	.dw	#00114$
	.dw	#00114$
	.dw	#00114$
	.dw	#00118$
	.dw	#00118$
	.dw	#00118$
	.dw	#00118$
	.dw	#00123$
	.dw	#00123$
	.dw	#00120$
	.dw	#00120$
	.dw	#00121$
;	./src/stm8s_itc_GetSoftwarePriority.c: 62: case ITC_IRQ_PORTA:
00104$:
;	./src/stm8s_itc_GetSoftwarePriority.c: 63: Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
	ld	a, 0x7f70
	and	a, (0x03, sp)
	ld	(0x01, sp), a
;	./src/stm8s_itc_GetSoftwarePriority.c: 64: break;
	jra	00123$
;	./src/stm8s_itc_GetSoftwarePriority.c: 69: case ITC_IRQ_PORTE:
00108$:
;	./src/stm8s_itc_GetSoftwarePriority.c: 70: Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
	ld	a, 0x7f71
	and	a, (0x03, sp)
	ld	(0x01, sp), a
;	./src/stm8s_itc_GetSoftwarePriority.c: 71: break;
	jra	00123$
;	./src/stm8s_itc_GetSoftwarePriority.c: 81: case ITC_IRQ_TIM1_OVF:
00110$:
;	./src/stm8s_itc_GetSoftwarePriority.c: 82: Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
	ld	a, 0x7f72
	and	a, (0x03, sp)
	ld	(0x01, sp), a
;	./src/stm8s_itc_GetSoftwarePriority.c: 83: break;
	jra	00123$
;	./src/stm8s_itc_GetSoftwarePriority.c: 93: case ITC_IRQ_TIM3_OVF:
00114$:
;	./src/stm8s_itc_GetSoftwarePriority.c: 94: Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
	ld	a, 0x7f73
	and	a, (0x03, sp)
	ld	(0x01, sp), a
;	./src/stm8s_itc_GetSoftwarePriority.c: 95: break;
	jra	00123$
;	./src/stm8s_itc_GetSoftwarePriority.c: 107: case ITC_IRQ_I2C:
00118$:
;	./src/stm8s_itc_GetSoftwarePriority.c: 108: Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
	ld	a, 0x7f74
	and	a, (0x03, sp)
	ld	(0x01, sp), a
;	./src/stm8s_itc_GetSoftwarePriority.c: 109: break;
	jra	00123$
;	./src/stm8s_itc_GetSoftwarePriority.c: 128: case ITC_IRQ_TIM4_OVF:
00120$:
;	./src/stm8s_itc_GetSoftwarePriority.c: 130: Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
	ld	a, 0x7f75
	and	a, (0x03, sp)
	ld	(0x01, sp), a
;	./src/stm8s_itc_GetSoftwarePriority.c: 131: break;
	jra	00123$
;	./src/stm8s_itc_GetSoftwarePriority.c: 133: case ITC_IRQ_EEPROM_EEC:
00121$:
;	./src/stm8s_itc_GetSoftwarePriority.c: 134: Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
	ld	a, 0x7f76
	and	a, (0x03, sp)
	ld	(0x01, sp), a
;	./src/stm8s_itc_GetSoftwarePriority.c: 139: }
00123$:
;	./src/stm8s_itc_GetSoftwarePriority.c: 141: Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
	ld	a, (0x01, sp)
	push	a
	ld	a, (0x03, sp)
	jreq	00136$
00135$:
	srl	(1, sp)
	dec	a
	jrne	00135$
00136$:
	pop	a
;	./src/stm8s_itc_GetSoftwarePriority.c: 143: return((ITC_PriorityLevel_TypeDef)Value);
;	./src/stm8s_itc_GetSoftwarePriority.c: 144: }
	addw	sp, #3
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
