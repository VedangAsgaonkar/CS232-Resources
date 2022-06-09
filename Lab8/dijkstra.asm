	AREA my_code, CODE, READONLY

start

; ZERO REGISTER
    MOV R0, #0

; Value of N is in R1
    LDR R1, =0x30000000
    LDR R1, [R1]
; Adjacency matrix pointer is in R2
    LDR R2, =0x60000000  
; source ID is in R3
    LDR R3, =0x40000000
    LDR R3, [R3]  
	SUB R3, R3, #1
; d[] array base pointer is R4
    LDR R4, =0x70000000
	; intialize d[]
	MOV R5, #0
	LDR R6, =0x00aaffff
looparr
	CMP R5, R1
    BEQ endlooparr
	STR R6, [R4, R5, LSL #2]
	ADD R5, R5, #1
	B looparr
endlooparr
	STR R0, [R4, R3, LSL #2]
; R6 is a pointer to an array of flags indicating whether a node is in the set
	LDR R6, =0x50000000
    MOV R5, #0
; Initialize all flags to 0: Flags will be bytes
loop0
    CMP R5, R1
    BEQ endloop0
    STRB R0, [R6, R5]
	ADD R5, R5, #1
	B loop0
endloop0
	MOV R0, #1

; R5 is counter for loop1
    MOV R5, #0
loop1
    CMP R5, R1
    BEQ endloop1
; R7 is counter for loop2
; R8 stores the index of the SMALLEST element, R0 stores its value
	MOV R7, #0
	MOV R8, #0
	MOV R10, #1 ; constant value 1
	LDR R0, =0x00aaffff
loop2
	CMP R7, R1
	BEQ endloop2
	; checking for flag
	LDRB R11, [R6, R7]
	CMP R11, R10
	BEQ else1
; R9 is the current element
	LDR R9, [R4, R7, LSL #2]
	CMP R0, R9 ; comparing to find smallest element
	BLE else1
	MOV R8, R7
	MOV R0, R9
else1 ADD R7, R7, #1
	B loop2
endloop2 
	; set flag
	STRB R10, [R6, R8]
    
; R7 is counter for loop3
	MOV R7, #0
	MUL R10, R8, R1
	MOV R8, R10, LSL #2
	ADD R8, R8, R2
loop3
	CMP R7, R1
	BEQ endloop3
	LDR R9, [R8, R7, LSL #2] ; edge vale
	LDR R10, [R4, R7, LSL #2] ; d value
	ADD R11, R0, R9 ; d[R0] + edge
	CMP R10, R11
	BLE else2	
	STR R11, [R4, R7, LSL #2]	
else2 ADD R7, R7, #1
	B loop3
endloop3
	ADD R5, R5, #1
	B loop1
endloop1

here B here

	END
