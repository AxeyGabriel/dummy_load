;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_beep_LSICalibrationConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _BEEP_LSICalibrationConfig
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
;	./src/stm8s_beep_LSICalibrationConfig.c: 54: void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
;	-----------------------------------------
;	 function BEEP_LSICalibrationConfig
;	-----------------------------------------
_BEEP_LSICalibrationConfig:
	sub	sp, #7
;	./src/stm8s_beep_LSICalibrationConfig.c: 62: lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
	push	#0xe8
	push	#0x03
	clrw	x
	pushw	x
	ldw	x, (0x10, sp)
	pushw	x
	ldw	x, (0x10, sp)
	pushw	x
	call	__divulong
	addw	sp, #8
	exgw	x, y
;	./src/stm8s_beep_LSICalibrationConfig.c: 66: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
	ld	a, 0x50f3
	and	a, #0xe0
	ld	0x50f3, a
;	./src/stm8s_beep_LSICalibrationConfig.c: 68: A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
	ldw	x, y
	srlw	x
	srlw	x
	srlw	x
;	./src/stm8s_beep_LSICalibrationConfig.c: 70: if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
	ldw	(0x01, sp), x
	sllw	x
	sllw	x
	sllw	x
	ldw	(0x03, sp), x
	subw	y, (0x03, sp)
	ldw	x, (0x01, sp)
	sllw	x
	incw	x
	pushw	x
	pushw	y
;	./src/stm8s_beep_LSICalibrationConfig.c: 66: BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
	call	__mulint
	addw	sp, #4
	ldw	(0x05, sp), x
	ld	a, 0x50f3
	ld	(0x07, sp), a
;	./src/stm8s_beep_LSICalibrationConfig.c: 72: BEEP->CSR |= (uint8_t)(A - 2U);
	ld	a, (0x02, sp)
;	./src/stm8s_beep_LSICalibrationConfig.c: 70: if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
	ldw	x, (0x03, sp)
	cpw	x, (0x05, sp)
	jrc	00102$
;	./src/stm8s_beep_LSICalibrationConfig.c: 72: BEEP->CSR |= (uint8_t)(A - 2U);
	sub	a, #0x02
	or	a, (0x07, sp)
	ld	0x50f3, a
	jra	00104$
00102$:
;	./src/stm8s_beep_LSICalibrationConfig.c: 76: BEEP->CSR |= (uint8_t)(A - 1U);
	dec	a
	or	a, (0x07, sp)
	ld	0x50f3, a
00104$:
;	./src/stm8s_beep_LSICalibrationConfig.c: 78: }
	addw	sp, #7
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
