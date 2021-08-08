;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_itc_SetSoftwarePriority
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ITC_SetSoftwarePriority
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
;	./src/stm8s_itc_SetSoftwarePriority.c: 54: void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
;	-----------------------------------------
;	 function ITC_SetSoftwarePriority
;	-----------------------------------------
_ITC_SetSoftwarePriority:
	pushw	x
;	./src/stm8s_itc_SetSoftwarePriority.c: 68: Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
	ld	a, (0x05, sp)
	clrw	y
	and	a, #0x03
	ld	xl, a
	sllw	x
	ld	a, #0x03
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
	cpl	a
	ld	(0x01, sp), a
;	./src/stm8s_itc_SetSoftwarePriority.c: 71: NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
	ld	a, (0x06, sp)
	push	a
	ld	a, xl
	tnz	a
	jreq	00134$
00133$:
	sll	(1, sp)
	dec	a
	jrne	00133$
00134$:
	pop	a
	ld	(0x02, sp), a
;	./src/stm8s_itc_SetSoftwarePriority.c: 73: switch (IrqNum)
	ld	a, (0x05, sp)
	cp	a, #0x18
	jrule	00135$
	jp	00124$
00135$:
	clrw	x
	ld	a, (0x05, sp)
	ld	xl, a
	sllw	x
	ldw	x, (#00136$, x)
	jp	(x)
00136$:
	.dw	#00104$
	.dw	#00104$
	.dw	#00104$
	.dw	#00104$
	.dw	#00108$
	.dw	#00108$
	.dw	#00108$
	.dw	#00108$
	.dw	#00124$
	.dw	#00124$
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
	.dw	#00124$
	.dw	#00124$
	.dw	#00120$
	.dw	#00120$
	.dw	#00121$
;	./src/stm8s_itc_SetSoftwarePriority.c: 78: case ITC_IRQ_PORTA:
00104$:
;	./src/stm8s_itc_SetSoftwarePriority.c: 79: ITC->ISPR1 &= Mask;
	ld	a, 0x7f70
	and	a, (0x01, sp)
	ld	0x7f70, a
;	./src/stm8s_itc_SetSoftwarePriority.c: 80: ITC->ISPR1 |= NewPriority;
	ld	a, 0x7f70
	or	a, (0x02, sp)
	ld	0x7f70, a
;	./src/stm8s_itc_SetSoftwarePriority.c: 81: break;
	jra	00124$
;	./src/stm8s_itc_SetSoftwarePriority.c: 86: case ITC_IRQ_PORTE:
00108$:
;	./src/stm8s_itc_SetSoftwarePriority.c: 87: ITC->ISPR2 &= Mask;
	ld	a, 0x7f71
	and	a, (0x01, sp)
	ld	0x7f71, a
;	./src/stm8s_itc_SetSoftwarePriority.c: 88: ITC->ISPR2 |= NewPriority;
	ld	a, 0x7f71
	or	a, (0x02, sp)
	ld	0x7f71, a
;	./src/stm8s_itc_SetSoftwarePriority.c: 89: break;
	jra	00124$
;	./src/stm8s_itc_SetSoftwarePriority.c: 99: case ITC_IRQ_TIM1_OVF:
00110$:
;	./src/stm8s_itc_SetSoftwarePriority.c: 100: ITC->ISPR3 &= Mask;
	ld	a, 0x7f72
	and	a, (0x01, sp)
	ld	0x7f72, a
;	./src/stm8s_itc_SetSoftwarePriority.c: 101: ITC->ISPR3 |= NewPriority;
	ld	a, 0x7f72
	or	a, (0x02, sp)
	ld	0x7f72, a
;	./src/stm8s_itc_SetSoftwarePriority.c: 102: break;
	jra	00124$
;	./src/stm8s_itc_SetSoftwarePriority.c: 112: case ITC_IRQ_TIM3_OVF:
00114$:
;	./src/stm8s_itc_SetSoftwarePriority.c: 113: ITC->ISPR4 &= Mask;
	ld	a, 0x7f73
	and	a, (0x01, sp)
	ld	0x7f73, a
;	./src/stm8s_itc_SetSoftwarePriority.c: 114: ITC->ISPR4 |= NewPriority;
	ld	a, 0x7f73
	or	a, (0x02, sp)
	ld	0x7f73, a
;	./src/stm8s_itc_SetSoftwarePriority.c: 115: break;
	jra	00124$
;	./src/stm8s_itc_SetSoftwarePriority.c: 127: case ITC_IRQ_I2C:
00118$:
;	./src/stm8s_itc_SetSoftwarePriority.c: 128: ITC->ISPR5 &= Mask;
	ld	a, 0x7f74
	and	a, (0x01, sp)
	ld	0x7f74, a
;	./src/stm8s_itc_SetSoftwarePriority.c: 129: ITC->ISPR5 |= NewPriority;
	ld	a, 0x7f74
	or	a, (0x02, sp)
	ld	0x7f74, a
;	./src/stm8s_itc_SetSoftwarePriority.c: 130: break;
	jra	00124$
;	./src/stm8s_itc_SetSoftwarePriority.c: 152: case ITC_IRQ_TIM4_OVF:
00120$:
;	./src/stm8s_itc_SetSoftwarePriority.c: 154: ITC->ISPR6 &= Mask;
	ld	a, 0x7f75
	and	a, (0x01, sp)
	ld	0x7f75, a
;	./src/stm8s_itc_SetSoftwarePriority.c: 155: ITC->ISPR6 |= NewPriority;
	ld	a, 0x7f75
	or	a, (0x02, sp)
	ld	0x7f75, a
;	./src/stm8s_itc_SetSoftwarePriority.c: 156: break;
	jra	00124$
;	./src/stm8s_itc_SetSoftwarePriority.c: 158: case ITC_IRQ_EEPROM_EEC:
00121$:
;	./src/stm8s_itc_SetSoftwarePriority.c: 159: ITC->ISPR7 &= Mask;
	ld	a, 0x7f76
	and	a, (0x01, sp)
	ld	0x7f76, a
;	./src/stm8s_itc_SetSoftwarePriority.c: 160: ITC->ISPR7 |= NewPriority;
	ld	a, 0x7f76
	or	a, (0x02, sp)
	ld	0x7f76, a
;	./src/stm8s_itc_SetSoftwarePriority.c: 165: }
00124$:
;	./src/stm8s_itc_SetSoftwarePriority.c: 166: }
	popw	x
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
