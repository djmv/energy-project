;**********************************************************************
;   This file is a basic code template for assembly code generation   *
;   on the PIC16F886. This file contains the basic code               *
;   building blocks to build upon.                                    *
;                                                                     *
;   Refer to the MPASM User's Guide for additional information on     *
;   features of the assembler (Document DS33014).                     *
;                                                                     *
;   Refer to the respective PIC data sheet for additional             *
;   information on the instruction set.                               *
;                                                                     *
;**********************************************************************
;                                                                     *
;    Filename:	    xxx.asm                                           *
;    Date:                                                            *
;    File Version:                                                    *
;                                                                     *
;    Author:                                                          *
;    Company:                                                         *
;                                                                     *
;                                                                     *
;**********************************************************************
;                                                                     *
;    Files Required: P16F886.INC                                      *
;                                                                     *
;**********************************************************************
;                                                                     *
;    Notes:                                                           *
;                                                                     *
;**********************************************************************


	list		p=16f886	; list directive to define processor
	#include	<p16f886.inc>	; processor specific variable definitions
	#include	<macros.inc>

; '__CONFIG' directive is used to embed configuration data within .asm file.
; The labels following the directive are located in the respective .inc file.
; See respective data sheet for additional information on configuration word.

	__CONFIG    _CONFIG1, _LVP_OFF & _FCMEN_ON & _IESO_OFF & _BOR_OFF & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_ON & _WDT_OFF & _INTRC_OSC_NOCLKOUT
	__CONFIG    _CONFIG2, _WRT_OFF & _BOR21V



;***** VARIABLE DEFINITIONS
w_temp		EQU	0x7D		; variable used for context saving
status_temp	EQU	0x7E		; variable used for context saving
pclath_temp	EQU	0x7F		; variable used for context saving
contador	EQU	0x20

;**********************************************************************
	ORG     0x000             ; processor reset vector

	nop
  	goto    main              ; go to beginning of program


	ORG     0x004             ; interrupt vector location

	movwf   w_temp            ; save off current W register contents
	movf	STATUS,w          ; move status register into W register
	movwf	status_temp       ; save off contents of STATUS register
	movf	PCLATH,w	  ; move pclath register into w register
	movwf	pclath_temp	  ; save off contents of PCLATH register

; isr code can go here or be located as a call subroutine elsewhere

	movf	pclath_temp,w	  ; retrieve copy of PCLATH register
	movwf	PCLATH		  ; restore pre-isr PCLATH register contents
	movf    status_temp,w     ; retrieve copy of STATUS register
	movwf	STATUS            ; restore pre-isr STATUS register contents
	swapf   w_temp,f
	swapf   w_temp,w          ; restore pre-isr W register contents
	retfie                    ; return from interrupt



main
	    bcf STATUS,IRP
	    movlw 0x020
	    movwf FSR
	    movlw 0x00
	    movwf 0x70
	    
prueba	    enqueue "A"
	    incf 0x70
	    btfss 0x70,7 
	    goto prueba
	    btfss 0x70,6
	    goto prueba
	    btfss 0x70,5 
	    goto prueba
	    btfss 0x70,4 
	    goto prueba
	    btfss 0x70,3 
	    goto prueba
	    btfss 0x70,2 
	    goto prueba
	    btfss 0x70,1 
	    goto prueba
	    btfss 0x70,0 
	    goto prueba
	    goto $




	END                       ; directive 'end of program'

