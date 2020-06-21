CODES SEGMENT
    ASSUME CS:CODES
START:
	MOV AH,01H ;输入第一位数
    INT 21H 
    mov cl,4
	mov BL,AL 
	CMP	bl,40h  ;转化
	JNA NEXT
    sub  bL,07
NEXT:
	sub bL,30H
    shl bl,cl
	MOV AH,01H;输入第二位数
    INT 21H 
    mov cl,al
    CMP	cl,40h	;转化
	JNA NEXT1
    sub  cL,07
NEXT1:
	sub cL,30H
 	and cl,0fh
    add bl,cl   ;将bl输出
    MOV DL,0AH  ;输出换行
    MOV AH,02H    
    INT 21H
    MOV DL,0DH
    INT 21H 
	MOV CX,08H
rotate: ROL BL,1      ;取显示位的值
        MOV  AL, BL     ;保存在AL中
        AND  AL, 01H   ;清除高4位
	    ADD  AL, 30H    ;转变为数字的ASCII
	    MOV  DL,AL     ;送 ASCII字符到DL
        MOV  AH, 2       ;显示DL中的字符
        INT   21H  
         DEC   CH   
        LOOP rotate 
     MOV  AH, 4CH   ;返回DOS
     INT    21H
CODES ENDS
    END START



