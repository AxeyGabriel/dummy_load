;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_i2c_FastModeDutyCycleConfig
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _I2C_FastModeDutyCycleConfig
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
;	./src/stm8s_i2c_FastModeDutyCycleConfig.c: 48: void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
;	-----------------------------------------
;	 function I2C_FastModeDutyCycleConfig
;	-----------------------------------------
_I2C_FastModeDutyCycleConfig:
;	./src/stm8s_i2c_FastModeDutyCycleConfig.c: 56: I2C->CCRH |= I2C_CCRH_DUTY;
	ld	a, 0x521c
;	./src/stm8s_i2c_FastModeDutyCycleConfig.c: 53: if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
	push	a
	ld	a, (0x04, sp)
	cp	a, #0x40
	pop	a
	jrne	00102$
;	./src/stm8s_i2c_FastModeDutyCycleConfig.c: 56: I2C->CCRH |= I2C_CCRH_DUTY;
	or	a, #0x40
	ld	0x521c, a
	ret
00102$:
;	./src/stm8s_i2c_FastModeDutyCycleConfig.c: 61: I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
	and	a, #0xbf
	ld	0x521c, a
;	./src/stm8s_i2c_FastModeDutyCycleConfig.c: 63: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
