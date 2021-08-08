;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_awu_LSICalibrationConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _AWU_LSICalibrationConfig
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
;	./src/stm8s_awu_LSICalibrationConfig.c: 55: void AWU_LSICalibrationConfig(uint32_t LSIFreqHz)
;	-----------------------------------------
;	 function AWU_LSICalibrationConfig
;	-----------------------------------------
_AWU_LSICalibrationConfig:
	sub	sp, #6
;	./src/stm8s_awu_LSICalibrationConfig.c: 63: lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
	push	#0xe8
	push	#0x03
	clrw	x
	pushw	x
	ldw	x, (0x0f, sp)
	pushw	x
	ldw	x, (0x0f, sp)
	pushw	x
	call	__divulong
	addw	sp, #8
	exgw	x, y
;	./src/stm8s_awu_LSICalibrationConfig.c: 67: A = (uint16_t)(lsifreqkhz >> 2U); /* Division by 4, keep integer part only */
	ldw	x, y
	srlw	x
	srlw	x
;	./src/stm8s_awu_LSICalibrationConfig.c: 69: if ((4U * A) >= ((lsifreqkhz - (4U * A)) * (1U + (2U * A))))
	ldw	(0x01, sp), x
	sllw	x
	sllw	x
	ldw	(0x03, sp), x
	subw	y, (0x03, sp)
	ldw	x, (0x01, sp)
	sllw	x
	incw	x
	pushw	x
	pushw	y
;	./src/stm8s_awu_LSICalibrationConfig.c: 71: AWU->APR = (uint8_t)(A - 2U);
	call	__mulint
	addw	sp, #4
	ldw	(0x05, sp), x
	ld	a, (0x02, sp)
;	./src/stm8s_awu_LSICalibrationConfig.c: 69: if ((4U * A) >= ((lsifreqkhz - (4U * A)) * (1U + (2U * A))))
	ldw	x, (0x03, sp)
	cpw	x, (0x05, sp)
	jrc	00102$
;	./src/stm8s_awu_LSICalibrationConfig.c: 71: AWU->APR = (uint8_t)(A - 2U);
	sub	a, #0x02
	ld	0x50f1, a
	jra	00104$
00102$:
;	./src/stm8s_awu_LSICalibrationConfig.c: 75: AWU->APR = (uint8_t)(A - 1U);
	dec	a
	ld	0x50f1, a
00104$:
;	./src/stm8s_awu_LSICalibrationConfig.c: 77: }
	addw	sp, #6
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
