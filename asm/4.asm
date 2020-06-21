DATAS SEGMENT
    py dw (0)
    px dw (0)
    le1 dw(0)
    le2 dw(0)
DATAS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS
START:
    MOV AX,DATAS
    MOV DS,AX
    MOV  AH, 0
    MOV AL,12H
    INT 10H
    MOV PY,0C8H
    MOV PX,012CH 
    mov LE2,064H
    mov LE1,01H
    MOV SI,LE2
    MOV DX,PY
HANG: MOV DI,LE1
    MOV CX,PX
    DEC PX
    DEC PX
    INC LE1
    INC LE1
    INC LE1
    INC LE1
HANG1:MOV AL,5
    MOV AH,0CH
    INT 10H    
    INC CX
    DEC DI
    JNZ HANG1
    
    INC DX
    DEC SI
    JNZ HANG
    
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START
