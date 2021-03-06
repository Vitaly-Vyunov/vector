	ORG	2A00H
	LXI	SP,100H
	XRA	A
	OUT	10H
	JMP	START
EXIT:	JMP	0
DECV:	JMP	DEC
PRINT:	EQU	138H
PRINTC:	EQU	129H
HEXOUT:	EQU	135H
INKEY:	EQU	13BH
INIT:	EQU	120H
SCR0:	EQU	189H
SCR2:	EQU	18CH
COLOR:	EQU	156H
YY:	EQU	0E8DH
XX:	EQU	0E8EH
COLORS:	DB   0,192,7,12,199,34,54,255
	DB   0,192,7,12,199,34,54,255
STR0:	DB 'Уровень ',0
START:	CALL	INIT
	MVI	A,7
	CALL	SCR2
	LXI	D,COLORS
	CALL	SCR0
	MVI	A,1
	STA	WLEVEL
BEGI0:	MVI	C,13
	CALL	PRINTC
	MVI	C,1FH
	CALL	PRINTC
	XRA	A
	STA	WPARSH
	STA	WPODST
	STA	WDOOR
	STA	WVANIA
	CALL	RASLEV
	CALL	LEVLS
	CALL	LEVEL
	CALL	CONKEY
	MVI	A,7
	CALL	COLOR
	LXI	H,6020H
	SHLD	YY
	LXI	H,STR0
	CALL	PRINT
	LDA	WLEVEL
	CALL	DEC
	CALL	HEXOUT
	LXI	H,0A0EH
	SHLD	MARK
BEGIN:	CALL	SMARK
BEG10:	CALL	INKEY
	CPI	-1
	JZ	BEG10
	PUSH	PSW
	CALL	SMARK
	POP	PSW
	LXI	D,-1
	CPI	8
	JZ	DMARK
	LXI	D,1
	CPI	18H
	JZ	DMARK
	LXI	D,-100H
	CPI	19H
	JZ	DMARK
	LXI	D,100H
	CPI	1AH
	JZ	DMARK
	CPI	2
	JZ	INCLEV
	CPI	1BH
	JZ	DECLEV
	CPI	3
	JZ	EXIT
	CPI	20H
	JZ	RECLEV
	CPI	'R'
	JZ	RIGHT
	CPI	'D'
	JZ	DOWN
	SUI	30H
	JM	BEGIN
	CPI	0AH
	JNC	BEGIN
	LXI	H,TCOD
	MOV	E,A
	MVI	D,0
	DAD	D
	MOV	A,M
	PUSH	PSW
	CALL	GETPIC
	POP	PSW
	LHLD	MARK
	CALL	OGRAN
	MOV	B,A
	CALL	RECORD
	CALL	COORD
	CALL	COPY
	JMP	BEGIN
INCLEV:	LXI	H,WLEVEL
	INR	M
	MOV	A,M
	CPI	29
	JC	BEGI0
	MVI	M,1
	JMP	BEGI0
DECLEV:	LXI	H,WLEVEL
	DCR	M
	JNZ	BEGI0
	MVI	M,28
	JMP	BEGI0
RECLEV:	XRA	A
	STA	LPOINT
	LHLD	LEVELS
	SHLD	TABLES
	LXI	H,OLEVEL+31
	MVI	B,19
RECL10:	MVI	C,28
RECL20:	MOV	A,M
	CALL	RECL30
	INX	H
	DCR	C
	JNZ	RECL20
	INX	H
	INX	H
	DCR	B
	JNZ	RECL10
	JMP	BEGI0
LEVLS:	LXI	H,TLEVEL
	LXI	D,266
	LDA	WLEVEL
LEVL10:	DAD	D
	DCR	A
	JNZ	LEVL10
	SHLD	LEVELS
	RET
RIGHT:	LHLD	MARK
	CALL	WHO
	CPI	5
	JZ	RIGH10
	CPI	11
	JZ	RIGH10
	CPI	13
	JZ	RIGH20
	CPI	8
	JNZ	BEGIN
RIGH20:	MVI	B,12
RIGH15:	CALL	RECORD
	CALL	COORD
	LXI	D,STRR
	CALL	MCOPY
	JMP	BEGIN
RIGH10:	MVI	B,10
	JMP	RIGH15
DOWN:	LHLD	MARK
	CALL	WHO
	CPI	5
	JZ	DOWN10
	CPI	10
	JZ	DOWN10
	CPI	8
	JZ	DOWN20
	CPI	12
	JNZ	BEGIN
DOWN20:	MVI	B,13
DOWN15:	CALL	RECORD
	CALL	COORD
	LXI	D,STRD
	CALL	MCOPY
	JMP	BEGIN
DOWN10:	MVI	B,11
	JMP	DOWN15
OGRAN:	ANA	A
	JZ	OGR100
	CPI	4
	JZ	OGR200
	CPI	7
	JZ	OGR300
	CPI	9
	JZ	OGR400
	CPI	14
	RNZ
	MOV	C,A
	LDA	WDOOR
	ANA	A
	MOV	A,C
	STA	WDOOR
	RZ
	JMP	OGR210
OGR200:	MOV	C,A
	LDA	WVANIA
	ANA	A
	MOV	A,C
	STA	WVANIA
	RZ
OGR210:	POP	H
	JMP	BEGIN
OGR300:	MOV	C,A
	LDA	WPARSH
	INR	A
	CPI	19
	JZ	OGR210
	STA	WPARSH
	MOV	A,C
	RET
OGR400:	MOV	C,A
	LDA	WPODST
	INR	A
	CPI	33
	JZ	OGR210
	STA	WPODST
	MOV	A,C
	RET
OGR100:	PUSH	PSW
	CALL	WHO
	CPI	4
	JZ	OGR110
	CPI	7
	JZ	OGR120
	CPI	9
	JZ	OGR130
	CPI	14
	JNZ	OGR140
	XRA	A
	STA	WDOOR
OGR140:	POP	PSW
	RET
OGR110:	XRA	A
	STA	WVANIA
	JMP	OGR140
OGR120:	LDA	WPARSH
	DCR	A
	STA	WPARSH
	JMP	OGR140
OGR130:	LDA	WPODST
	DCR	A
	STA	WPODST
	JMP	OGR140
GETPIC:	ANA	A
	LXI	D,PUSTP
	RZ
	LXI	D,PSZP
	CPI	2
	RZ
	LXI	D,STENAP
	CPI	3
	RZ
	LXI	D,VANIAP
	CPI	4
	RZ
	LXI	D,PEREGP
	CPI	5
	RZ
	LXI	D,BIDONP
	CPI	6
	RZ
	LXI	D,PARSHP
	CPI	7
	RZ
	LXI	D,CHERP
	CPI	8
	RZ
	LXI	D,PODSTP
	CPI	9
	RZ
	LXI	D,DOORP
	RET
	JMP	BEGIN
DEC:	PUSH	B
	MOV	C,A
	ANI	15
	MOV	B,A
	XRA	A
	MOV	A,B
	DAA
	MOV	B,A
	MOV	A,C
	ANI	0F0H
	RLC
	RLC
	RLC
	RLC
	MOV	C,A
	INR	C
DEC10:	DCR	C
	JZ	DEC20
	XRA	A
	MVI	A,16H
	ADD	B
	DAA
	MOV	B,A
	JMP	DEC10
DEC20:	MOV	A,B
	POP	B
	RET
CONKEY:	LXI	H,VCNKEY
	LXI	B,TCNKL
	MVI	A,11
CNCK10:	PUSH	PSW
	LDAX	B
	MOV	E,A
	INX	B
  	LDAX	B
	MOV	D,A
	INX	B
	CALL	COPY
	INR	H
	INR	H
	POP	PSW
	DCR	A
	JNZ	CNCK10
	MVI	A,6
	CALL	COLOR
	LXI	H,2116H
	SHLD	YY
	MVI	L,10
	MVI	D,30H
CNCK20:	MOV	C,D
	CALL	PRINTC
	INR	D
	MOV	A,H
	ADI	16
	STA	XX
	MOV	H,A
	DCR	L
	JNZ	CNCK20
	MVI	C,'R'
	CALL	PRINTC
	MOV	A,H
	ADI	16
	STA	XX
	MVI	C,'D'
	CALL	PRINTC
	RET
DMARK:	LHLD	MARK
	DAD	D
	CALL	WHO
	CPI	1
	JZ	BEGIN
	SHLD	MARK
	JMP	BEGIN
SMARK:	LHLD	MARK
	CALL	COORD
	LXI	D,2000H
	MVI	B,3
SMRK10:	MVI	C,10
	PUSH	H
SMRK20:	MOV	A,M
	CMA
	MOV	M,A
	DCR	L
	DCR	C
	JNZ	SMRK20
	POP	H
	DAD	D
	DCR	B
	JNZ	SMRK10
	RET
PRINTH:	MOV	A,H
	CALL	HEXOUT
	MOV	A,L
	JMP	HEXOUT
HDCMP:	MOV	A,H
	CMP	D
	RNZ
	MOV	A,L
	CMP	E
	RET
ZAD:	DCX	B
	MOV	A,B
	ORA	C
	JNZ	ZAD
	RET
WHO:	PUSH	H
	PUSH	D
	PUSH	B
	CALL	WHO00
	MOV	A,M
	POP	B
	POP	D
	POP	H
	RET
RECORD:	PUSH	H
	PUSH	D
	PUSH	PSW
	PUSH	B
	CALL	WHO00
	POP	B
	MOV	A,M
	ANI	80H
	ORA	B
	MOV	M,A
	POP	PSW
	POP	D
	POP	H
	RET
WHO00: 	LXI	D,OLEVEL
	XCHG
	LXI	B,30
	MOV	A,D
WHO10:	ANA	A
	JZ	WHO20
	DAD	B
	DCR	A
	JMP	WHO10
WHO20:	MOV	A,E
WHO30:	ANA	A
	RZ
	INX	H
	DCR	A
	JMP	WHO30
COORD:	PUSH	D
	PUSH	B
	XCHG
	LXI	H,VIDEO
	MOV	A,E
COOR10:	ANA	A
	JZ	COOR20
	INR	H
	DCR	A
	JMP	COOR10
COOR20:	MOV	A,D
	LXI	B,-10
COOR30:	ANA	A
	JZ	COOR40
	DAD	B
	DCR	A
	JNZ	COOR30
COOR40:	POP	B
	POP	D
	RET
RASLEV:	LXI	H,OLEVEL
	LXI	D,29
	MVI	B,19
	CALL	RASL10
RASL20:	MVI	M,1
	DAD	D
	MVI	M,1
	INX	H
	DCR	B
	JNZ	RASL20
	CALL	RASL10
	RET
RASL10:	MVI	C,30
	MVI	M,1
	INX	H
	DCR	C
	JNZ	RASL10+2
	RET
LEVEL:	LHLD	LEVELS
	SHLD	TABLES
	LXI	D,OLEVEL+31
	XRA	A
	STA	LPOINT
	CALL	LEVRAS
	LXI	H,VIDEO
	LXI	D,OLEVEL
	MVI	B,21
LEV10:	MVI	C,30
	PUSH	H
LEV20:	LDAX	D
	INX	D
	PUSH	D
	DCR	A
	JZ	FUND
	DCR	A
	JZ	PSZ
	DCR	A
	JZ	STENA
	DCR	A
	JZ	VANIA
	DCR	A
	JZ	PEREG
	DCR	A
	JZ	BIDON
	DCR	A
	JZ	PARSH
	DCR	A
	JZ	CHER
	DCR	A
	JZ	PODST
	DCR	A
	JZ	PEREG0
	DCR	A
	JZ	PEREG1
	DCR	A
	JZ	CHER0
	DCR	A
	JZ	CHER1
	DCR	A
	JZ	DOOR
	DCR	A
	JZ	NEMO
LEV30:	POP	D
	INR	H
	DCR	C
	JNZ	LEV20
	POP	H
	PUSH	D
	LXI	D,-10
	DAD	D
	POP	D
	DCR	B
	JNZ	LEV10
	RET
LEVRAS:	MVI	B,19
LEVR10:	MVI	C,28
LEVR12:	CALL	GETCOD
	STAX	D
	INX	D
	DCR	C
	JNZ	LEVR12
	INX	D
	INX	D
	DCR	B
	JNZ	LEVR10
	RET
VANIA:	LXI	D,VANIAP
	MVI	A,1
	STA	WVANIA
LEV15:	CALL	COPY
	JMP	LEV30
NEMO:	LXI	D,PUSTP
	JMP	LEV15
KOORD: 	MVI	A,30
	SUB	C
	MOV	L,A
	MVI	A,21
	SUB	B
	MOV	H,A
	RET
STENA:	LXI	D,STENAP
	JMP	LEV15
BIDON:	LXI	D,BIDONP
	JMP	LEV15
PEREG:	LXI	D,PEREGP
	JMP	LEV15
PEREG0:	LXI	D,PEREGP
	CALL	COPY
	LXI	D,STRR
	CALL	MCOPY
	JMP	LEV30
PEREG1:	LXI	D,PEREGP
	CALL	COPY
	LXI	D,STRD
	CALL	MCOPY
	JMP	LEV30
FUND:	LXI	D,FUNDP
	JMP	LEV15
PSZ:	LXI	D,PSZP
	JMP	LEV15
PARSH:	LXI	D,PARSHP
	LDA	WPARSH
	INR	A
	STA	WPARSH
	JMP	LEV15
CHER:	LXI	D,CHERP
	JMP	LEV15
CHER0:	LXI	D,CHERP
	CALL	COPY
	LXI	D,STRR
	CALL	MCOPY
	JMP	LEV30
CHER1:	LXI	D,CHERP
	CALL	COPY
	LXI	D,STRD
	CALL	MCOPY
	JMP	LEV30
PODST:	LXI	D,PODSTP
	LDA	WPODST
	INR	A
	STA	WPODST
	JMP	LEV15
DOOR:	LXI	D,DOORP
	MVI	A,1
	STA	WDOOR
	JMP	LEV15
MCOPY:	PUSH	H
	PUSH	B
	LXI	B,-5
	DAD	B
	XCHG
	LXI	B,5
	DAD	B
	XCHG
	MVI	B,3
MCOP10:	MVI	C,5
	PUSH	H
	PUSH	D
MCOP20:	LDAX	D
	MOV	M,A
	INX	D
	DCR	L
	DCR	C
	JNZ	MCOP20
	POP	D
	POP	H
	MVI	A,20H
	ADD	H
	MOV	H,A
	PUSH	H
	LXI	H,10
	DAD	D
	XCHG
	POP	H
	DCR	B
	JNZ	MCOP10
	POP	B
	POP	H
	RET
COPY:	PUSH	H
	CALL	COPY10
	POP	H
	RET
COPY10:	PUSH	B
	MVI	C,10
COPY20:	LDAX	D
	MOV	M,A
	PUSH	H
	PUSH	D
	MVI	A,20H
	ADD	H
	MOV	H,A
	PUSH	H
	LXI	H,10
	DAD	D
	XCHG
	POP	H
	LDAX	D
	MOV	M,A
	MVI	A,20H
	ADD	H
	MOV	H,A
	PUSH	H
	LXI	H,10
	DAD	D
	XCHG
	POP	H
	LDAX	D
	MOV	M,A
	POP	D
	POP	H
	INX	D
	DCR	L
	DCR	C
	JNZ	COPY20
	POP	B
	RET
GETCOD:	LDA	LPOINT
	ANA	A
	JZ	GETC10
	XRA	A
	STA	LPOINT
	MOV	A,M
	INX	H
	ANI	0FH
	RET
GETC10:	INR	A
	STA	LPOINT
	MOV	A,M
	ANI	0F0H
	RLC
	RLC
	RLC
	RLC
	RET
RECL30:	PUSH	H
	LHLD	TABLES
	MOV	D,A
	LDA	LPOINT
	ANA	A
	JZ	RECL35
	XRA	A
	STA	LPOINT
	MOV	A,M
	ORA	D
	MOV	M,A
	INX	H
	SHLD	TABLES
	POP	H
	RET
RECL35:	MVI	A,1
	STA	LPOINT
	MOV	A,D
	RRC
	RRC
	RRC
	RRC
	MOV	M,A
	POP	H
	RET
LPOINT:	DB	0
WPODST:	DB	0
WPARSH:	DB	0
WLEVEL:	DB	0
WVANIA:	DB	0
WDOOR:	DB	0
LEVELS:	DW	0
TABLES:	DW	0
MARK:	DW	0
VCNKEY:	EQU	0A60CH
VIDEO:	EQU	0A1FFH-10
OLEVEL:	EQU	7800H
TLEVEL:	EQU	3000H
FILE:	EQU	2700H
VANIAP:	EQU	FILE
STENAP:	EQU	FILE+60
BIDONP:	EQU	FILE+30
PEREGP:	EQU	FILE+90
VANIA2: EQU	FILE+120
VANIA3:	EQU	FILE+150
VANIA4:	EQU	FILE+180
VANIA5:	EQU	FILE+210
VANIA6:	EQU	FILE+240
FUNDP:	EQU	FILE+270
PSZP:	EQU	FILE+300
PARSHP:	EQU	FILE+330
PODSTP:	EQU	FILE+360
PARSHL:	EQU	FILE+390
CHERP:	EQU	FILE+420
DOORP:	EQU	FILE+450
STRR:	EQU	FILE+480
STRD:	EQU	FILE+510
PUSTP:	DW 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
TCNKL:	DW PSZP,STENAP,VANIAP,PEREGP
	DW BIDONP,PARSHP,CHERP,PODSTP
	DW DOORP,STRR,STRD
TCOD:	DB 0,2,3,4,5,6,7,8,9,14
