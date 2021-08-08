;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_i2c_ITConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _I2C_ITConfig
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
;	./src/stm8s_i2c_ITConfig.c: 50: void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
;	-----------------------------------------
;	 function I2C_ITConfig
;	-----------------------------------------
_I2C_ITConfig:
	push	a
;	./src/stm8s_i2c_ITConfig.c: 59: I2C->ITR |= (uint8_t)I2C_IT;
	ld	a, 0x521a
;	./src/stm8s_i2c_ITConfig.c: 56: if (NewState != DISABLE)
	tnz	(0x05, sp)
	jreq	00102$
;	./src/stm8s_i2c_ITConfig.c: 59: I2C->ITR |= (uint8_t)I2C_IT;
	or	a, (0x04, sp)
	ld	0x521a, a
	jra	00104$
00102$:
;	./src/stm8s_i2c_ITConfig.c: 64: I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
	push	a
	ld	a, (0x05, sp)
	cpl	a
	ld	(0x02, sp), a
	pop	a
	and	a, (0x01, sp)
	ld	0x521a, a
00104$:
;	./src/stm8s_i2c_ITConfig.c: 66: }
	pop	a
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
