SSTACK SEGMENT STACK
		DW 32 DUP(?)
SSTACK ENDS

CODES SEGMENT
    ASSUME CS:CODES
START:
    MOV DX, 0646H   ;���ƿڵ�ַ
    MOV AL, 80H		;������
    OUT DX, AL
    MOV BX, 8001H    ;D0-D15��ʼ״̬
AA1:MOV DX, 0640H    ;A�ڵ�ַ
	MOV AL, BH		 ;ȡD0-D7״̬
	OUT DX, AL		;���
	ROR BH, 1		;����һλ
	MOV DX, 0642H   ;B�ڵ�ַ
	MOV AL, BL		;ȡD8-D15״̬
	OUT DX, AL		;���
	ROL BL, 1		;����һλ
	CALL DELAY		;��ʱ
	CALL DELAY		;��ʱ
	JMP AA1
DELAY: PUSH CX			;��ʱ
       MOV CX, 0F000H  ;��ѭ������������ʱʱ��

       
AA2:PUSH AX
	POP AX
	LOOP AA2
	POP CX
	RET
    
CODES ENDS
    END START
