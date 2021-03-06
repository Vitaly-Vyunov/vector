	ORG	100H
	JMP	START
DATA:	EQU	40H
M300:	EQU	DATA
M301:	EQU	DATA+1
M302:	EQU	DATA+2
M304:	EQU	DATA+4
M306:	EQU	DATA+6
M310:	EQU	DATA+8
M312:	EQU	DATA+10
M314:	EQU	DATA+12
SNCH1:	EQU	0CH
SNCH0:	EQU	0BH
MARK1:	EQU	35H
MARK0:	EQU	34H
LOG01:	EQU	0CH
LOG00:	EQU	0BH
LOG11:	EQU	19H
LOG10:	EQU	19H
LBUFER:	EQU	800H
HEXOUT:	PUSH	PSW
	RRC
	RRC
	RRC
	RRC
	CALL	$+4
	POP	PSW
	ANI	15
	CPI	10
	JC	$+5
	ADI	7
	ADI	30H
	MOV	C,A
	JMP	PRINTC
PRINTC:	PUSH	PSW
	PUSH	H
	PUSH	D
	PUSH	B
	MOV	E,C
	MVI	C,2
	CALL	5
	POP	B
	POP	D
	POP	H
	POP	PSW
	RET
FILE:	DW 2,200H,2740H
	DB 'GOVOR           '
	DW 0,0
	DB 'BK-0010(-01)    '
EX:	EQU	0E6FEH
START:	LXI	H,FILE
	DI
	CALL	DRIVER
	JMP	EX
DRIVER:	PUSH	H
	SHLD	M306
	XCHG
	LXI	H,0
	SHLD	M300
	SHLD	M302
	DAD	SP
	SHLD	M310
	XCHG
	MOV	A,M
	LXI	H,EXIT
	PUSH	H
	CPI	2
	JZ	WRITE
	CPI	3
	JZ	READ
	RET
EXIT:	LHLD	M306
	INX	H
	MOV	A,M
	STA	M301
	POP	H
	RET
WRITE:	LHLD	FILE+4
	XCHG
	LXI	H,LBUFER
	CALL	CHKSUM
	SHLD	M312
	LXI	H,1000H
	CALL	NASPOS
	LXI	H,FILE+2
	LXI	B,20
	CALL	MASSIV
	LHLD	FILE+4
	PUSH	H
	POP	B
	LXI	H,LBUFER
	CALL	MASSIV
	LXI	H,M312
	LXI	B,2
	CALL	MAS00
	LXI	H,100H
	CALL	NASPS2
	RET
MASSIV:	PUSH	H
	LXI	H,8
	CALL	NSPS00
	POP	H
MAS00:	PUSH	B
	MVI	B,8
	MOV	C,M
MAS10:	MOV	A,C
	RRC
	MOV	C,A
	JC	MAS20
	MVI	D,LOG01
	MVI	A,1
MAS12:	OUT	0
	DCR	D
	JNZ	MAS12
	MVI	D,LOG00
	XRA	A
MAS14:	OUT	0
	DCR	D
	JNZ	MAS14
	CALL	SINC
MAS30:	DCR	B
	JNZ	MAS10
	POP	B
	INX	H
	DCX	B
	MOV	A,B
	ORA	C
	JNZ	MAS00
	RET
MAS20:	CALL	LOGIC1
	JMP	MAS30
NASPOS:	CALL	MARKOR
NSPS00:	MVI	D,SNCH1
	MVI	A,1
NSPS10:	OUT	0
	DCR	D
	JNZ	NSPS10
	MVI	D,SNCH0
	XRA	A
NSPS20:	OUT	0
	DCR	D
	JNZ	NSPS20
	DCX	H
	MOV	A,H
	ORA	L
	JNZ	NSPS00
	CALL	MARKER
	CALL	LOGIC1
	RET
NASPS2:	CALL	MARKER
NASP00:	MVI	D,0
	MVI	A,1
NASP10:	OUT	0
	DCR	D
	JNZ	NSPS10
	MVI	D,0
	XRA	A
NASP20:	OUT	0
	DCR	D
	JNZ	NASP20
	DCX	H
	MOV	A,H
	ORA	L
	JNZ	NASP00
	CALL	MARKER
	CALL	LOGIC1
	RET
MARKER:	MVI	D,MARK1
	MVI	A,1
MRK10:	OUT	0
	DCR	D
	JNZ	MRK10
	MVI	D,MARK0
	XRA	A
MRK20:	OUT	0
	DCR	D
	JNZ	MRK20
	RET
MARKOR:	MVI	D,0
	MVI	A,1
MRK30:	OUT	0
	DCR	D
	JNZ	MRK30
	MVI	D,0
	XRA	A
	JMP	MRK20
LOGIC1:	MVI	D,LOG11
	MVI	A,1
LOGC10:	OUT	0
	DCR	D
	JNZ	LOGC10
	MVI	D,LOG10
	XRA	A
LOGC20:	OUT	0
	DCR	D
	JNZ	LOGC20
SINC:	MVI	D,SNCH1
	MVI	A,1
SINC10:	OUT	0
	DCR	D
	JNZ	SINC10
	MVI	D,SNCH0
	XRA	A
SINC20:	OUT	0
	DCR	D
	JNZ	SINC20
	RET
CHKSUM:	LXI	B,0
CHKS10:	MOV	A,C
	ADD	M
	MOV	C,A
	MVI	A,0
	ADC	B
	MOV	B,A
	JNC	$+4
	INX	B
	INX	H
	DCX	D
	MOV	A,E
	ORA	D
	JNZ	CHKS10
	PUSH	B
	POP	H
	RET
READ:	LXI	H,1
	SHLD	M304
	XRA	A
	STA	M300
	MVI	A,-1
	OUT	1
	CALL	SEAR
	XRA	A
	OUT	1
	CALL	NAME
	CALL	LDFILE
	RET
NAME:	LXI	H,FILE+22
	LXI	D,20
	CALL	RDMAS
	RET
LDFILE:	LHLD	FILE+24
	XCHG
	LXI	H,LBUFER
	CALL	RDMAS
	LXI	H,M312
	LXI	D,2
	CALL	LDMAS
	LHLD	FILE+24
	XCHG
	LXI	H,LBUFER
	CALL	CHKSUM
	XCHG
	LHLD	M312
	CALL	HDCMP
	RZ
	MVI	C,7
	JMP	PRINTC
HDCMP:	MOV	A,H
	SUB	D
	RNZ
	MOV	A,L
	SUB	E
	RET
SEAR:	LXI	H,800H
	MVI	D,0
SEAR10:	MVI	E,0
SEAR12:	IN	1
	ANI	10H
	JZ	SEAR12
SEAR14:	INR	E
	IN	1
	ANI	10H
	JNZ	SEAR14
	MOV	A,D
	SUB	E
	MOV	D,A
	JM	SEAR16
	CPI	3
	JNC	SEAR
SEAR16:	MOV	D,E
	IN	1
	RLC
	JNC	EX
	DCX	H
	MOV	A,H
	ORA	L
	JNZ	SEAR10
	LXI	D,80H
	LXI	H,0
	MVI	B,0
SEAR20:	CALL	LONG
	DAD	B
	DCX	D
	MOV	A,D
	ORA	E
	JNZ	SEAR20
	MVI	C,7
SEAR22:	MOV	A,H
	RRC
	PUSH	PSW
	ANI	7FH
	MOV	H,A
	POP	PSW
	MOV	A,L
	RAR
	MOV	L,A
	DCR	C
	JNZ	SEAR22
	MOV	A,L
	RRC
	ANI	7FH
	ADD	L
	STA	M314
	MOV	L,A
SEAR23:	MVI	C,0
SEAR24:	INR	C
	IN	1
	ANI	10H
	JNZ	SEAR24
	MOV	A,L
	CMP	C
	JC	SEAR30
	MVI	C,0
SEAR26:	INR	C
	IN	1
	ANI	10H
	JZ	SEAR26
	MOV	A,C
	CMP	L
	JC	SEAR23
	MVI	A,1
	STA	M300
SEAR30:	MOV	A,L
	RLC
	CMP	C
	JC	SEAR32
	JMP	LONG
	POP	PSW
SEAR32:	POP	PSW
	JMP	READ
RDMAS:	LDA	M314
	PUSH	H
	MOV	L,A
	LDA	M300
	ANA	A
	JNZ	OTRZ
POL:	MVI	C,0
POL10:	INR	C
	IN	1
	ANI	10H
	JNZ	POL10
	MOV	A,C
	CMP	L
	JC	POL
	JMP	RDMS10
OTRZ:	MVI	C,0
OTRZ10:	INR	C
	IN	1
	ANI	10H
	JZ	OTRZ10
	MOV	A,C
	CMP	L
	JC	OTRZ
RDMS10:	MOV	A,L
	RLC
	CMP	C
	POP	H
	JC	SEAR32-1
	CALL	LONG
LDMAS:	LDA	M314
	MOV	B,A
LDMS10:	PUSH	D
	MVI	D,8
	MVI	E,0
LDMS12:	CALL	LONG
	MOV	A,B
	CMP	C
	MOV	A,E
	RAR
	MOV	E,A
	DCR	D
	JNZ	LDMS12
	MOV	M,E
	INX	H
	POP	D
	DCX	D
	MOV	A,D
	ORA	E
	JNZ	LDMS10
	RET
LONG:	MVI	C,0
	IN	1
	RLC
	JNC	EX
	LDA	M300
	ANA	A
	JNZ	MINS
PLUS:	IN	1
	ANI	10H
	JNZ	PLUS
PLUS10:	IN	1
	ANI	10H
	JZ	PLUS10
PLUS12:	INR	C
	IN	1
	ANI	10H
	JNZ	PLUS12
PLUS14:	INR	C
	IN	1
	ANI	10H
	JZ	PLUS14
	RET
MINS:	IN	1
	ANI	10H
	JZ	MINS
MINS10:	IN	1
	ANI	10H
	JNZ	MINS10
MINS12:	INR	C
	IN	1
	ANI	10H
	JZ	MINS12
MINS14:	INR	C
	IN	1
	ANI	10H
	JNZ	MINS14
	RET
