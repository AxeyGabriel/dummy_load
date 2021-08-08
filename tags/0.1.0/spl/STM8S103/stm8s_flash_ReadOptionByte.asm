;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_flash_ReadOptionByte
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _FLASH_ReadOptionByte
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
;	./src/stm8s_flash_ReadOptionByte.c: 47: uint16_t FLASH_ReadOptionByte(uint16_t Address)
;	-----------------------------------------
;	 function FLASH_ReadOptionByte
;	-----------------------------------------
_FLASH_ReadOptionByte:
	sub	sp, #4
;	./src/stm8s_flash_ReadOptionByte.c: 55: value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
	ldw	x, (0x07, sp)
	ld	a, (x)
	ld	(0x03, sp), a
;	./src/stm8s_flash_ReadOptionByte.c: 56: value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
	ld	a, (0x1, x)
	ld	(0x04, sp), a
;	./src/stm8s_flash_ReadOptionByte.c: 61: res_value =	 value_optbyte;
	clrw	y
	ld	a, (0x03, sp)
	ld	yl, a
;	./src/stm8s_flash_ReadOptionByte.c: 59: if(Address == 0x4800)	 
	ldw	x, (0x07, sp)
	cpw	x, #0x4800
	jrne	00105$
;	./src/stm8s_flash_ReadOptionByte.c: 61: res_value =	 value_optbyte;
	ldw	x, y
	jra	00106$
00105$:
;	./src/stm8s_flash_ReadOptionByte.c: 65: if(value_optbyte == (uint8_t)(~value_optbyte_complement))
	ld	a, (0x04, sp)
	cpl	a
	cp	a, (0x03, sp)
	jrne	00102$
;	./src/stm8s_flash_ReadOptionByte.c: 67: res_value = (uint16_t)((uint16_t)value_optbyte << 8);
	clr	a
	ld	(0x02, sp), a
;	./src/stm8s_flash_ReadOptionByte.c: 68: res_value = res_value | (uint16_t)value_optbyte_complement;
	clr	(0x03, sp)
	ld	a, (0x02, sp)
	or	a, (0x04, sp)
	ld	xl, a
	ld	a, yl
	or	a, (0x03, sp)
	ld	xh, a
;	./src/stm8s_flash_ReadOptionByte.c: 72: res_value = FLASH_OPTIONBYTE_ERROR;
	.byte 0xbc
00102$:
	ldw	x, #0x5555
00106$:
;	./src/stm8s_flash_ReadOptionByte.c: 75: return(res_value);
;	./src/stm8s_flash_ReadOptionByte.c: 76: }
	addw	sp, #4
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
