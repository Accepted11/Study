CODES SEGMENT
    ASSUME CS:CODES
START:
	MOV AH,01H ;�����һλ��
    INT 21H 
    mov cl,4
	mov BL,AL 
	CMP	bl,40h  ;ת��
	JNA NEXT
    sub  bL,07
NEXT:
	sub bL,30H
    shl bl,cl
	MOV AH,01H;����ڶ�λ��
    INT 21H 
    mov cl,al
    CMP	cl,40h	;ת��
	JNA NEXT1
    sub  cL,07
NEXT1:
	sub cL,30H
 	and cl,0fh
    add bl,cl   ;��bl���
    MOV DL,0AH  ;�������
    MOV AH,02H    
    INT 21H
    MOV DL,0DH
    INT 21H 
	MOV CX,08H
rotate: ROL BL,1      ;ȡ��ʾλ��ֵ
        MOV  AL, BL     ;������AL��
        AND  AL, 01H   ;�����4λ
	    ADD  AL, 30H    ;ת��Ϊ���ֵ�ASCII
	    MOV  DL,AL     ;�� ASCII�ַ���DL
        MOV  AH, 2       ;��ʾDL�е��ַ�
        INT   21H  
         DEC   CH   
        LOOP rotate 
     MOV  AH, 4CH   ;����DOS
     INT    21H
CODES ENDS
    END START



