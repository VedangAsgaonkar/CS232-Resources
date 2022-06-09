	AREA my_code, CODE, READONLY

	MOV R1, #84
	MOV R2, #144

; Numbers stored in R1, R2; GCD in R3
    MOV R4, R1
    MOV R5, R2
loop CMP R4, R5
    BEQ return
    BGT point1
    BLT point2

point1 SUB R4, R4, R5
    B loop

point2 SUB R5, R5, R4
    B loop

return MOV R3, R4

here B here

	END
