;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (FreeBSD)
;--------------------------------------------------------
	.module stm8s_uart1_GetITStatus
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _UART1_GetITStatus
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
;	./src/stm8s_uart1_GetITStatus.c: 54: ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
;	-----------------------------------------
;	 function UART1_GetITStatus
;	-----------------------------------------
_UART1_GetITStatus:
	pushw	x
;	./src/stm8s_uart1_GetITStatus.c: 66: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
	ld	a, (0x06, sp)
	ld	xl, a
	and	a, #0x0f
	push	a
	ld	a, #0x01
	ld	(0x02, sp), a
	pop	a
	tnz	a
	jreq	00162$
00161$:
	sll	(0x01, sp)
	dec	a
	jrne	00161$
00162$:
;	./src/stm8s_uart1_GetITStatus.c: 68: itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
	ld	a, xl
	swap	a
	and	a, #0x0f
;	./src/stm8s_uart1_GetITStatus.c: 70: itmask2 = (uint8_t)((uint8_t)1 << itmask1);
	push	a
	ld	a, #0x01
	ld	(0x03, sp), a
	pop	a
	tnz	a
	jreq	00164$
00163$:
	sll	(0x02, sp)
	dec	a
	jrne	00163$
00164$:
;	./src/stm8s_uart1_GetITStatus.c: 74: if (UART1_IT == UART1_IT_PE)
	ldw	x, (0x05, sp)
	cpw	x, #0x0100
	jrne	00117$
;	./src/stm8s_uart1_GetITStatus.c: 77: enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
	ld	a, 0x5234
	and	a, (0x02, sp)
	ld	xl, a
;	./src/stm8s_uart1_GetITStatus.c: 80: if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
	ld	a, 0x5230
	and	a, (0x01, sp)
	jreq	00102$
	ld	a, xl
	tnz	a
	jreq	00102$
;	./src/stm8s_uart1_GetITStatus.c: 83: pendingbitstatus = SET;
	ld	a, #0x01
	jra	00118$
00102$:
;	./src/stm8s_uart1_GetITStatus.c: 88: pendingbitstatus = RESET;
	clr	a
	jra	00118$
00117$:
;	./src/stm8s_uart1_GetITStatus.c: 92: else if (UART1_IT == UART1_IT_LBDF)
	ldw	x, (0x05, sp)
	cpw	x, #0x0346
	jrne	00114$
;	./src/stm8s_uart1_GetITStatus.c: 95: enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
	ld	a, 0x5237
	and	a, (0x02, sp)
	ld	xl, a
;	./src/stm8s_uart1_GetITStatus.c: 97: if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
	ld	a, 0x5237
	and	a, (0x01, sp)
	jreq	00106$
	ld	a, xl
	tnz	a
	jreq	00106$
;	./src/stm8s_uart1_GetITStatus.c: 100: pendingbitstatus = SET;
	ld	a, #0x01
	jra	00118$
00106$:
;	./src/stm8s_uart1_GetITStatus.c: 105: pendingbitstatus = RESET;
	clr	a
	jra	00118$
00114$:
;	./src/stm8s_uart1_GetITStatus.c: 111: enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
	ld	a, 0x5235
	and	a, (0x02, sp)
	ld	xl, a
;	./src/stm8s_uart1_GetITStatus.c: 113: if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
	ld	a, 0x5230
	and	a, (0x01, sp)
	jreq	00110$
	ld	a, xl
	tnz	a
	jreq	00110$
;	./src/stm8s_uart1_GetITStatus.c: 116: pendingbitstatus = SET;
	ld	a, #0x01
;	./src/stm8s_uart1_GetITStatus.c: 121: pendingbitstatus = RESET;
	.byte 0x21
00110$:
	clr	a
00118$:
;	./src/stm8s_uart1_GetITStatus.c: 126: return  pendingbitstatus;
;	./src/stm8s_uart1_GetITStatus.c: 127: }
	popw	x
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
