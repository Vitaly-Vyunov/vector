	ORG	100H
	LXI	SP,80H
	JMP	START
SELDSK:	EQU	0FB1BH
SETTRK:	EQU	0FB1EH
SETSEC:	EQU	0FB21H
SETDMA:	EQU	0FB24H
WRITE:	EQU	0FB2AH
READ:	EQU	0FB27H
OS:	EQU	400H
STRA:	EQU	OS+60H
RDS:	EQU	OS+100H
COM:	EQU	RDS+4000H
STR0:	DB 12,27,'/',27,'b'
DB '(c) Резидентная Дисковая Система.              Версия 3.00 '
 DB 10
DB '(c) Вьюнов В.А.   Copyright (c) 1994-1996 by Vitaly Vewnov.'
 DB 10,'Сентября 14 числа 1996г. от Р.Х..',10,27,'a$'
STR1:	DB 10,'Квази-диск отформатирован.$'
STR2:	DB 10,'Форматирование диска C:.$'
STRHDD:	DB 10,'Инициализация HDD...$'
STRHDE:	DB 10,'Ошибка !$'
START:	DI
	MVI	A,20H
	OUT	10H
	LXI	H,RDS
	LXI	D,0A000H
BEGIN:	MOV	A,M
	STAX	D
	INX	H
	INX	D
	MOV	A,D
	CPI	0E0H
	JC	BEGIN
	CALL	0CA00H
	LXI	H,'РД'
	SHLD	11
	LXI	H,30F3H
	SHLD	13
	LXI	SP,0
	EI
	LXI	D,STR0
	MVI	C,9
	CALL	5
	IN	1
	ANI	40H
	JNZ	EXIT
	LXI	D,STR2
	MVI	C,9
	CALL	5
	LXI	H,80H
FORM10:	MVI	M,0E5H
	INR	L
	JNZ	FORM10
	LXI	B,80H
	CALL	SETDMA
	MVI	C,2
	CALL	SELDSK
	LXI	D,1
FORM11:	PUSH	D
	MOV	C,D
	CALL	SETTRK
	POP	D
FORM12:	PUSH	D
	MOV	C,E
	CALL	SETSEC
	CALL	WRITE
	POP	D
	INR	E
	MVI	A,9
	CMP	E
	JNZ	FORM12
	MVI	E,1
	INR	D
	MVI	A,220
	CMP	D
	JNZ	FORM11
	LXI	D,STR1
	MVI	C,9
	CALL	5
	MVI	E,2
	MVI	C,14
	CALL	5
	LXI	B,0D80H
	CALL	5
	XRA	A
	STA	3FH
	MVI	A,2
	STA	WSECT
	LXI	H,OS
	SHLD	DMA
	LXI	H,FILE0
	CALL	SAVE
	MVI	A,23
	STA	WSECT
	LXI	H,COM
	SHLD	DMA
	LXI	H,FILE1
	CALL	SAVE
EXIT:	CALL	INIHDD
	MVI	C,13
	CALL	5
	MVI	E,10
	MVI	C,2
	CALL	5
	LXI	D,STRA+1
	MVI	C,9
	CALL	5
	JMP	0
INIHDD:	LXI	D,STRHDD
	MVI	C,9
	CALL	5
	LXI	B,80H
	CALL	SETDMA
	MVI	A,2
	STA	3FH
	MVI	B,4
INIH10:	PUSH	B
	MVI	C,0
	CALL	SELDSK
	MVI	C,2
	CALL	SETSEC
	MVI	C,-1
	CALL	SETTRK
	CALL	READ
	ANA	A
	POP	B
	JZ	INIH12
	DCR	B
	JNZ	INIH10
	XRA	A
	STA	3FH
	LXI	D,STRHDE
	MVI	C,9
	CALL	5
	LXI	D,0
	LXI	B,0F80H
	JMP	5
INIH12:	DI
	XRA	A
	STA	3FH
	MVI	A,20H
	OUT	10H
	LHLD	0A000H
	LXI	D,41H
	DAD	D
	MOV	E,M
	INX	H
	MOV	D,M
	XCHG
	MOV	E,M
	INX	H
	MOV	D,M
	INX	H
	PUSH	D
	MOV	E,M
	INX	H
	MOV	D,M
	INX	H
	MOV	A,M
	INX	H
	MOV	H,M
	MOV	L,A
	INX	H
	SHLD	APAR2+1
	XCHG
	INX	H
	SHLD	APAR10+1
	LXI	D,6
	DAD	D
	SHLD	APAR1+1
	POP	H
	INX	H
	SHLD	APAR00+1
	DAD	D
	SHLD	APAR0+1
	LDA	80H
	MOV	L,A
	MVI	H,0
	PUSH	H
APAR0:	SHLD	0
	CALL	MUL16
APAR00:	SHLD	0
	POP	D
	LXI	H,0
	LDA	81H
INIH14:	DAD	D
	DCR	A
	JNZ	INIH14
APAR1:	SHLD	0
	CALL	MUL16
APAR10:	SHLD	0
	LHLD	84H
	INX	H
	CALL	NEG
APAR2:	SHLD	0
	MVI	A,23H
	OUT	10H
	EI
	RET
MUL16:	MVI	B,16
	XCHG
	LXI	H,0
MUL160:	DAD	D
	DCR	B
	JNZ	MUL160
NEG:	MOV	A,H
	CMA
	MOV	H,A
	MOV	A,L
	CMA
	MOV	L,A
	INX	H
	RET
DMA:	DW	0
WSECT:	DB	0
FILE0:	DB 0,'OS      COM'
FILE1:	DB 0,'COMMAND SYS'
SAVE:	LXI	D,5CH
	MVI	B,12
SAVE10:	MOV	A,M
	STAX	D
	INX	H
	INX	D
	DCR	B
	JNZ	SAVE10
	XCHG
SAVE12:	MVI	M,0
	INR	L
	JNZ	SAVE12
	LXI	D,5CH
	MVI	C,22
	CALL	5
	LHLD	DMA
	LDA	WSECT
	MOV	B,A
	XCHG
SAVE20:	PUSH	B
	PUSH	D
	MVI	C,1AH
	CALL	5
	LXI	D,5CH
	MVI	C,21
	CALL	5
	POP	D
	POP	B
	LXI	H,128
	DAD	D
	XCHG
	DCR	B
	JNZ	SAVE20
	LXI	D,5CH
	MVI	C,16
	JMP	5
