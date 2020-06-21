SSTACK SEGMENT STACK
		DW 32 DUP(?)
SSTACK ENDS

CODES SEGMENT
    ASSUME CS:CODES
START:
    MOV DX, 0646H   ;控制口地址
    MOV AL, 80H		;控制字
    OUT DX, AL
    MOV BX, 8001H    ;D0-D15初始状态
AA1:MOV DX, 0640H    ;A口地址
	MOV AL, BH		 ;取D0-D7状态
	OUT DX, AL		;输出
	ROR BH, 1		;右移一位
	MOV DX, 0642H   ;B口地址
	MOV AL, BL		;取D8-D15状态
	OUT DX, AL		;输出
	ROL BL, 1		;左移一位
	CALL DELAY		;延时
	CALL DELAY		;延时
	JMP AA1
DELAY: PUSH CX			;延时
       MOV CX, 0F000H  ;用循环次数控制延时时间

       
AA2:PUSH AX
	POP AX
	LOOP AA2
	POP CX
	RET
    
CODES ENDS
    END START
