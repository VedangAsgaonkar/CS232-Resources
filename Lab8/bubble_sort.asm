	AREA my_code, CODE, READONLY

start
		ADR		R0,source_array_ROM	;R0 is now source_array pointer  
		LDR		R1,=0x40000001  	;R1 is now dest_array pointer  
		MOV		R2,#05				;R2 holds loop-Count of array-length 
		
		;copy 5 bytes from Source_ROM to dest_RAM(0x40000000)
up		LDRB	R3,[R0],#01			;R3 act as temp register
		STRB	R3,[R1],#01
		SUBS	R2,R2,#01			;decrement loop counter
		BNE		up		;jump to label up if loop-count Not-Equal to zero
		
		MOV R2, #05
		MOV R1, #0x40000000
		STRB R2,[R1],#1
		
	; N is stored at 0x40000000. N-1 to be transfered to R0
	; Array starts at 0x40000001. Stored in R1
	; Loop counters are R2, R3
	; R4, R5 are temporary registers for exchange
	MOV R0, #0x40000000
	LDRB R0, [R0]	
	MOV R1, #0x40000001
	SUB R0, R0, #1
	MOV R2, #0
	
loop1 CMP R2, R0
    BGT end_loop1
	MOV R3, #0
loop2 CMP R3, R0
	BGE end_loop2
	LDRB R4, [R1, R3]
	ADD R3, R3, #1
	LDRB R5, [R1, R3]
	CMP R4, R5
	BLE else1
	STRB R4, [R1, R3]
	SUB R3, R3, #1
	STRB R5, [R1, R3]
	ADD R3, R3, #1
else1 B loop2
end_loop2	ADD R2, R2, #1
	B loop1
end_loop1

here B here

source_array_ROM	DCB		0x05,0x03,0x02,0x01,0x04
	
	END
