DATAS SEGMENT 
;BUFFER DB ?
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS

START:
	MOV AX,DATAS
	MOV DS,AX
	
	MOV AH,01H
    INT 21H 
    mov cl,4
	mov BL,AL 
	
	CMP	bl,40h
	JNA NEXT
    sub  bL,07
NEXT:sub bL,30H

    shl bl,cl
	
	MOV AH,01H
    INT 21H 
    mov cl,al
    CMP	cl,40h
	JNA NEXT1
    sub  cL,07
NEXT1:sub cL,30H
 	and cl,0fh
    add bl,cl
	
	
    MOV DL,0AH
    MOV AH,02H    
    INT 21H
    MOV DL,0DH
    INT 21H 
      
	MOV CX,08H
AGAIN:
	SHL BL,1
	MOV DL,0H
	ADC DL,30H
	MOV AH,02H
	INT 21H
	LOOP AGAIN
MOV AH,4CH
	INT 21H
	CODES ENDS
           END START

