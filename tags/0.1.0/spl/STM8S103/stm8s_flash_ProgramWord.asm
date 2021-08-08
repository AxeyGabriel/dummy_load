;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_flash_ProgramWord
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _FLASH_ProgramWord
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
;	./src/stm8s_flash_ProgramWord.c: 50: void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
;	-----------------------------------------
;	 function FLASH_ProgramWord
;	-----------------------------------------
_FLASH_ProgramWord:
	sub	sp, #4
;	./src/stm8s_flash_ProgramWord.c: 56: FLASH->CR2 |= FLASH_CR2_WPRG;
	bset	20571, #6
;	./src/stm8s_flash_ProgramWord.c: 57: FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
	bres	20572, #6
;	./src/stm8s_flash_ProgramWord.c: 62: *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
	ldw	y, (0x09, sp)
	ldw	x, sp
	addw	x, #11
	ldw	(0x01, sp), x
	ld	a, (x)
	ld	(y), a
;	./src/stm8s_flash_ProgramWord.c: 64: *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1); 
	ldw	x, y
	incw	x
	ldw	(0x03, sp), x
	ldw	x, (0x01, sp)
	ld	a, (0x1, x)
	ldw	x, (0x03, sp)
	ld	(x), a
;	./src/stm8s_flash_ProgramWord.c: 66: *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2); 
	ldw	x, y
	incw	x
	incw	x
	ldw	(0x03, sp), x
	ldw	x, (0x01, sp)
	ld	a, (0x2, x)
	ldw	x, (0x03, sp)
	ld	(x), a
;	./src/stm8s_flash_ProgramWord.c: 68: *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3); 
	addw	y, #0x0003
	ldw	x, (0x01, sp)
	ld	a, (0x3, x)
	ld	(y), a
;	./src/stm8s_flash_ProgramWord.c: 75: }
	addw	sp, #4
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
