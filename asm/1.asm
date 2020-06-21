;=======================================================
; �ļ���: Keyscan.asm
; ��������: ���̼��������ʾʵ�飬ͨ��8255���ơ�
;     8255�� B�ڿ�������ܵĶ���ʾ��
;            A�ڿ��Ƽ�����ɨ�輰����ܵ�λ������
;            C�ڿ��Ƽ��̵���ɨ�衣
;     ���°������ð�����Ӧ��λ�ý���˳����ʾ��������ϡ�
;=======================================================

IOY0         EQU   0600H          ;ƬѡIOY0��Ӧ�Ķ˿�ʼ��ַ
MY8255_A     EQU   IOY0+00H*2     ;8255��A�ڵ�ַ
MY8255_B     EQU   IOY0+01H*2     ;8255��B�ڵ�ַ
MY8255_C     EQU   IOY0+02H*2     ;8255��C�ڵ�ַ
MY8255_CON   EQU   IOY0+03H*2     ;8255�Ŀ��ƼĴ�����ַ

SSTACK	SEGMENT STACK
		DW 16 DUP(?)
SSTACK	ENDS		

DATA  	SEGMENT

; DATBLE�� ����Ҫ���밴����ֵ��Ӧ��Ҫ������ʾ����ֵ
; ���簴��1��ʾ��ֵ��1 ���������͸���ʾ������06H
; �ó�����ͨ���жϰ������� ��ȡ������ƫ�����������DTABLE��
; ���簴��1��ƫ������1 ����ɨ�谴�� �ó�һ��ֵ 1
; Ȼ�����ø�ֵ��DTABLE���ҵ���Ҫ���ֵ�Ķ�Ӧ��ʾ����ֵ
; ��B���ͳ�ȥ����

DTABLE	DB 3FH,06H,5BH,4FH,66H,6DH,7DH,07H
		DB 7FH,6FH,77H,7CH,39H,5EH,79H,71H
DATA  	ENDS

CODE 	SEGMENT
      	ASSUME CS:CODE,DS:DATA
START:
		
		MOV AX,DATA
		MOV DS,AX
 		
 		; ��3000H--3005H�е�ֵȫ����ʼ��Ϊ00H
 		; ˵����ʼƫ����ȫΪ0(3000H--3005H)
 		MOV SI,3000H
		MOV AL,00H
		
		MOV [SI],AL					;����ʾ����
		MOV [SI+1],AL
		MOV [SI+2],AL
		MOV [SI+3],AL
		MOV [SI+4],AL
		MOV [SI+5],AL
		
		
		MOV DI,3005H
		
		MOV DX,MY8255_CON			;8255�����ֳ�ʼ��
		MOV AL,81H					;1000 0001    A��B����� C������
		OUT DX,AL

BEGIN:	
		; ������ʾ�ӳ��� 
		CALL DIS			
		
		;����	
		CALL CLEAR					
		
		;ɨ�� ���Ƿ��м�����
		CALL CCSCAN					
		
		;�м����� ��INK1
		JNZ INK1       
		
		JMP BEGIN

INK1:	
 		CALL DIS
		CALL DALLY
		CALL DALLY
		CALL CLEAR
		CALL CCSCAN
		
		; �������Ϊ0 ZF=0 ��˵��һ���м����� ����ת �ж��ĸ�������
		JNZ INK2					
		JMP BEGIN
		
		;ȷ�����¼���λ��
INK2:	
		MOV CH,0FEH 	; FEH=1111 1110����Ӧ��ϵ��PA7 PA6..PA1 PA0 �� 
                    	; PA5-PA0=1111 10 (�����Ӧ��ϵҪŪ����)     
                    	;PA0��Ӧ�İ������� �����ҵ�һ�У����ﲻ����Ŷ��                  
		MOV CL,00H      ; ��ʼ�����е�ƫ���� Ϊ0 

		;��ѭ�� ��ɨ���� �ӵ�һ�п�ʼ
COLUM:	
		MOV AL,CH
		MOV DX,MY8255_A 
		OUT DX,AL   
		
		MOV DX,MY8255_C 
		IN AL,DX
L1:		TEST AL,01H         			;is L1?
		JNZ L2
		MOV AL,00H          			;L1
		JMP KCODE
L2:		TEST AL,02H         			;is L2?
		JNZ L3
		MOV AL,04H          			;L2
		JMP KCODE
L3:		TEST AL,04H         			;is L3?
		JNZ L4
		MOV AL,08H          			;L3
		JMP KCODE
L4:		TEST AL,08H         			;is L4?
		JNZ NEXT
		MOV AL,0CH          			;L4

; �ҵ������� ��ʱAL��ĵĵ�һ��ÿһ�еĳ�ʼֵ 0 4 8 C
; CL ����Ƕ�Ӧ�е�ƫ����
; ���� ALΪ08H CLΪ2 ���ʾ����ƫ����Ϊ 8+2=10H
; ˵����table�и����ֵ�ƫ����Ϊ10H
; ��������� ����ƫ�������� ��Ϊ������ʵ�Ǵ���table�е�
KCODE:	ADD AL,CL
		CALL PUTBUF
		PUSH AX
KON: 	CALL DIS
		CALL CLEAR
		CALL CCSCAN
		JNZ KON
		POP AX
NEXT:	INC CL  ; CL�൱�� ��ƫ����
		MOV AL,CH
		TEST AL,08H 	; 08H=0000 1000 ��ALΪ1111 0111 && 0000 1000 ���Ϊ0 
		             	; ZF=1 ˵����ƫ�����ﵽ���ֵ 3
		JZ KERR 		;  4����ѭ������ ��KERR
		ROL AL,1
		MOV CH,AL
		JMP COLUM
KERR:	JMP BEGIN


; ����ɨ���ӳ���
; ԭ���� ����ȫ��������͵�ƽ
; Ȼ���C�ڶ��� �е�ƽ
; ���û�а������� ������Ӧ�þ�Ϊ�ߵ�ƽ 
; ��֮ ���а������� ��ʼ��ϸ�жϳ��������ĸ��������� �����жϷ����ǣ�
; �����һ������͵�ƽ�������ң�
; Ȼ���C�ڶ����е�ƽ ���� AND 
; �ж���һ���Ƿ�Ϊ�͵�ƽ����(����Ϊ�˼��㷽��ȡ�����е�ƽ)
; ����ȫΪ�� Ϊ��ʼ����һ������͵�ƽ ѭ��4�μ���
CCSCAN:	MOV AL,00H	 				
		MOV DX,MY8255_A  
		OUT DX,AL		; ����������� �͵�ƽ
		MOV DX,MY8255_C 
		IN  AL,DX       ;�������е�ƽ
		
		;ԭ��û���κμ����� 4��ȫΪ1
		;����ȡ�� ��� 0000 ���ں�����ж�
		NOT AL
		
		; ����û�а������� 
	 	; 0000&1111=0
		; ���Ϊ0 ZF=1 
		AND AL,0FH
		RET

;�����ӳ���
;����ʹ�����еĵ�Ϩ�� 00H��ʾȫ���� ˲�� �ܿ� 
CLEAR:	MOV DX,MY8255_B 			
		MOV AL,00H
		OUT DX,AL
		RET


; ��ʾ�ӳ��� (������΢�е���)
DIS:	PUSH AX					
		MOV SI,3000H
		
		; 0DFH=1101 1111 ��ӦPA7 PA6 PA5...PA1 PA0
		; �ɵ�·ͼ �ó� X1-PA0 X2-PA1.....
		; 6����ʾ�� ������������ X1 X2 X3... X5 X6
		; ���� ��Ӧ��PA:          PA0 PA1 PA2...PA4 PA5
		; �����ʼ��0DFH   ����    1  1 1 1 1 0 
		; ��˼�� ��������ʾ ��ʼ��ʾ����
		; ���� ������ʵ�Ǵ�X6��X1������ʾ��
		; ÿ��������ʾ����ܿ� ���ǻ���Ϊ��6������һ����ʾ ��ʵ�������ʾ
		MOV DL,0DFH
		MOV AL,DL

AGAIN:	PUSH DX
		; ��AL�͸�A�� ���ÿ����ĸ��� ������Ҫ����·ͼ A��Ҳ���ƵƵĿ��ţ�
		MOV DX,MY8255_A 
		OUT DX,AL
		
		
		MOV AL,[SI]  				; ��3000H--3005H�д��ƫ��������ԣ�ȡ��
		MOV BX,OFFSET DTABLE		; ��ȡDTABLE���׵�ַ
		AND AX,00FFH           		;��Ϊ������мӷ����� �Ȱ�ah��0 ����ax����						 
									; al��ֵ����ֹ����
		ADD BX,AX                   ; ��ȡ��Ҫ��ֵ��ƫ����������Ǿ���ƫ������
		MOV AL,[BX]         		; ��ȡ��ʾ������Ҫ��ֵ �� ��ʾ0��Ҫ3FH
	
		MOV DX,MY8255_B   			; ����B�� ��ʾ����
		OUT DX,AL
	
		CALL DALLY 					;��ʱ
		INC SI              		;�ƶ�SI ��ȡ��һ��ƫ����
		POP DX
		MOV AL,DL					; DL: �����ĸ��ƵĿ��� ��ʼ��0DF 1101 1111
									; ȡ��6λ������·ͼ ֻ����6���ߣ���01 1111
									; ��ֵ��AL
		TEST AL,01H            		; ����AL ���Ƿ�Ϊ11 1110 
									; 6���� һ����ʾ��Ҫѭ��6��
									; ��������ν����� AL=11 1110
									; ���ڵ� ����x1����ʾ�꣨�ƣ�X6->X1��
		JZ  OUT1 					; 6��ѭ����ɺ� ����
		ROR AL,1					; ѭ������
									; �� ��һ������ AL=01 1111 
									;  �� �ڶ������� Ϊ 10 1111
									;  ������Ҫѭ������
									;  ��ӳ�ڵ��� �������ƣ���Ҫ�ƽ�ȥ��Ŷ��
		MOV DL,AL
		JMP AGAIN           		; ���� ������ʾ ��ѭ��6��
OUT1:	POP AX
		RET

; �ӳ��� ��ʱ���� RETΪ�ӳ���������
DALLY:	PUSH CX						
		MOV CX,0006H
T1:		MOV AX,009FH
T2:		DEC AX
		JNZ T2
		LOOP T1
		POP CX
		RET

; ����õ�ƫ��������3000H--30005H��
; ���ں������ʾ 
; ��ʾ��ʵ���Ǵ�3000H--3005H�ж�ȡƫ����
; Ȼ����table���ҵ�������ֵ����
PUTBUF:	MOV SI,DI					;�����ֵ����Ӧλ�Ļ�����
		MOV [SI],AL  ;�ȴ����ַ3005H �ٵݼ� Ҳ������һ������ƫ��������3004H
		DEC DI
		CMP DI,2FFFH
		JNZ GOBACK
		MOV DI,3005H
GOBACK:	RET

CODE	ENDS
		END START


