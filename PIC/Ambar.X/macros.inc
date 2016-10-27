; MACROS

inicio_cola1	EQU 0x020
inicio_cola2	EQU 0x0a0
	
enqueue	macro dato
	local cambio, exit, caso1, caso2
		movlw dato
		movwf INDF
		incf FSR
		btfss FSR,6
		goto exit
		btfss FSR,5
		goto exit
		btfss FSR,4	    
		goto exit
		btfss FSR,7
		goto caso1
		goto caso2
	caso1	movlw inicio_cola2
		movwf FSR	
		goto exit
	caso2	movlw inicio_cola1
		movwf FSR
		bsf STATUS,IRP
	exit  
	endm


