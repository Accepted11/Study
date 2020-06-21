;=======================================================
; 文件名: Keyscan.asm
; 功能描述: 键盘及数码管显示实验，通过8255控制。
;     8255的 B口控制数码管的段显示，
;            A口控制键盘列扫描及数码管的位驱动，
;            C口控制键盘的行扫描。
;     按下按键，该按键对应的位置将按顺序显示在数码管上。
;=======================================================

IOY0         EQU   0600H          ;片选IOY0对应的端口始地址
MY8255_A     EQU   IOY0+00H*2     ;8255的A口地址
MY8255_B     EQU   IOY0+01H*2     ;8255的B口地址
MY8255_C     EQU   IOY0+02H*2     ;8255的C口地址
MY8255_CON   EQU   IOY0+03H*2     ;8255的控制寄存器地址

SSTACK	SEGMENT STACK
		DW 16 DUP(?)
SSTACK	ENDS		

DATA  	SEGMENT

; DATBLE是 将需要输入按键的值对应需要给的显示器的值
; 比如按键1表示的值是1 但是我们送给显示器的是06H
; 该程序是通过判断按键按下 获取其代表的偏移量（相对于DTABLE）
; 比如按键1的偏移量是1 我们扫描按键 得出一个值 1
; 然后利用该值在DTABLE中找到需要输出值的对应显示代码值
; 从B口送出去即可

DTABLE	DB 3FH,06H,5BH,4FH,66H,6DH,7DH,07H
		DB 7FH,6FH,77H,7CH,39H,5EH,79H,71H
DATA  	ENDS

CODE 	SEGMENT
      	ASSUME CS:CODE,DS:DATA
START:
		
		MOV AX,DATA
		MOV DS,AX
 		
 		; 把3000H--3005H中的值全部初始化为00H
 		; 说明初始偏移量全为0(3000H--3005H)
 		MOV SI,3000H
		MOV AL,00H
		
		MOV [SI],AL					;清显示缓冲
		MOV [SI+1],AL
		MOV [SI+2],AL
		MOV [SI+3],AL
		MOV [SI+4],AL
		MOV [SI+5],AL
		
		
		MOV DI,3005H
		
		MOV DX,MY8255_CON			;8255控制字初始化
		MOV AL,81H					;1000 0001    A、B口输出 C口输入
		OUT DX,AL

BEGIN:	
		; 调用显示子程序 
		CALL DIS			
		
		;清屏	
		CALL CLEAR					
		
		;扫描 看是否有键按下
		CALL CCSCAN					
		
		;有键按下 跳INK1
		JNZ INK1       
		
		JMP BEGIN

INK1:	
 		CALL DIS
		CALL DALLY
		CALL DALLY
		CALL CLEAR
		CALL CCSCAN
		
		; 若结果不为0 ZF=0 则说明一定有键按下 则跳转 判断哪个键按下
		JNZ INK2					
		JMP BEGIN
		
		;确定按下键的位置
INK2:	
		MOV CH,0FEH 	; FEH=1111 1110（对应关系：PA7 PA6..PA1 PA0 ） 
                    	; PA5-PA0=1111 10 (这里对应关系要弄明白)     
                    	;PA0对应的按键则是 从左到右第一列（这里不会晕哦）                  
		MOV CL,00H      ; 初始对于行的偏移量 为0 

		;列循环 即扫描列 从第一列开始
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

; 找到按键后 此时AL存的的第一列每一行的初始值 0 4 8 C
; CL 存的是对应行的偏移量
; 假设 AL为08H CL为2 则表示的总偏移量为 8+2=10H
; 说明在table中该数字的偏移量为10H
; 输出该数字 利用偏移量就行 因为数字其实是存在table中的
KCODE:	ADD AL,CL
		CALL PUTBUF
		PUSH AX
KON: 	CALL DIS
		CALL CLEAR
		CALL CCSCAN
		JNZ KON
		POP AX
NEXT:	INC CL  ; CL相当于 行偏移量
		MOV AL,CH
		TEST AL,08H 	; 08H=0000 1000 当AL为1111 0111 && 0000 1000 结果为0 
		             	; ZF=1 说明行偏移量达到最大值 3
		JZ KERR 		;  4次列循环结束 跳KERR
		ROL AL,1
		MOV CH,AL
		JMP COLUM
KERR:	JMP BEGIN


; 键盘扫描子程序
; 原理是 先向全部列输出低电平
; 然后从C口读入 行电平
; 如果没有按键按下 所有行应该均为高电平 
; 反之 若有按键按下 则开始仔细判断出到底是哪个按键按下 具体判断方法是：
; 先向第一列输出低电平（从左到右）
; 然后从C口读入行电平 利用 AND 
; 判断哪一行是否为低电平即可(后面为了计算方便取反了行电平)
; 若行全为高 为开始向下一列输出低电平 循环4次即可
CCSCAN:	MOV AL,00H	 				
		MOV DX,MY8255_A  
		OUT DX,AL		; 向所有列输出 低电平
		MOV DX,MY8255_C 
		IN  AL,DX       ;读所有行电平
		
		;原来没有任何键按下 4行全为1
		;这里取反 变成 0000 便于后面的判断
		NOT AL
		
		; 假设没有按键按下 
	 	; 0000&1111=0
		; 结果为0 ZF=1 
		AND AL,0FH
		RET

;清屏子程序
;就是使得所有的灯熄灭 00H表示全不亮 瞬间 很快 
CLEAR:	MOV DX,MY8255_B 			
		MOV AL,00H
		OUT DX,AL
		RET


; 显示子程序 (这里稍微有点绕)
DIS:	PUSH AX					
		MOV SI,3000H
		
		; 0DFH=1101 1111 对应PA7 PA6 PA5...PA1 PA0
		; 由电路图 得出 X1-PA0 X2-PA1.....
		; 6个显示器 从左到右依次是 X1 X2 X3... X5 X6
		; 所以 对应的PA:          PA0 PA1 PA2...PA4 PA5
		; 这里初始是0DFH   代表    1  1 1 1 1 0 
		; 意思是 第六个显示 开始显示数字
		; 哈哈 这里其实是从X6到X1依次显示的
		; 每个数字显示间隔很快 我们会认为是6个数字一起显示 其实是逐个显示
		MOV DL,0DFH
		MOV AL,DL

AGAIN:	PUSH DX
		; 把AL送给A口 觉得开放哪个灯 （这里要看电路图 A口也控制灯的开放）
		MOV DX,MY8255_A 
		OUT DX,AL
		
		
		MOV AL,[SI]  				; 把3000H--3005H中存的偏移量（相对）取出
		MOV BX,OFFSET DTABLE		; 获取DTABLE的首地址
		AND AX,00FFH           		;因为后面会有加法运算 先把ah清0 这样ax就是						 
									; al的值，防止出错
		ADD BX,AX                   ; 获取需要的值的偏移量（这个是绝对偏移量）
		MOV AL,[BX]         		; 获取显示数字需要的值 例 显示0需要3FH
	
		MOV DX,MY8255_B   			; 送往B口 显示数字
		OUT DX,AL
	
		CALL DALLY 					;延时
		INC SI              		;移动SI 读取下一个偏移量
		POP DX
		MOV AL,DL					; DL: 控制哪个灯的开放 开始是0DF 1101 1111
									; 取后6位（看电路图 只连了6根线）即01 1111
									; 赋值给AL
		TEST AL,01H            		; 测试AL 看是否为11 1110 
									; 6个灯 一次显示需要循环6次
									; 这里第六次结束是 AL=11 1110
									; 对于灯 就是x1灯显示完（灯：X6->X1）
		JZ  OUT1 					; 6次循环完成后 跳出
		ROR AL,1					; 循环右移
									; 例 第一个灯亮 AL=01 1111 
									;  则 第二个灯亮 为 10 1111
									;  所以需要循环右移
									;  反映在灯上 则是左移（不要绕进去了哦）
		MOV DL,AL
		JMP AGAIN           		; 跳回 继续显示 需循环6次
OUT1:	POP AX
		RET

; 子程序 延时作用 RET为子程序结束标记
DALLY:	PUSH CX						
		MOV CX,0006H
T1:		MOV AX,009FH
T2:		DEC AX
		JNZ T2
		LOOP T1
		POP CX
		RET

; 将获得的偏移量存入3000H--30005H中
; 便于后面的显示 
; 显示其实就是从3000H--3005H中读取偏移量
; 然后在table中找到真正的值即可
PUTBUF:	MOV SI,DI					;存键盘值到相应位的缓冲中
		MOV [SI],AL  ;先存入地址3005H 再递减 也就是下一个存入偏移量的是3004H
		DEC DI
		CMP DI,2FFFH
		JNZ GOBACK
		MOV DI,3005H
GOBACK:	RET

CODE	ENDS
		END START


