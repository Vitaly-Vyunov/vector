	ORG	0A000H
XAE00:	EQU	0AE00H
XAE06:	EQU	0AE06H
XAE09:	EQU	0AE09H
XAE0C:	EQU	0AE0CH
XAE0F:	EQU	0AE0FH
XAE12:	EQU	0AE12H
XAE15:	EQU	0AE15H
XAE18:	EQU	0AE18H
XAE1B:	EQU	0AE1BH
XAE1E:	EQU	0AE1EH
XAE21:	EQU	0AE21H
XAE24:	EQU	0AE24H
XAE27:	EQU	0AE27H
XAE2A:	EQU	0AE2AH
XAE30:	EQU	0AE30H
FONT:	EQU	0C000H
DISP:	EQU	0CA00H
VRTMOV:	EQU	0DD00H
	DW	XAE00
	DW	DISP
	DW	FONT
	JMP	AA011
TA009:	DW	AA099
TA00B:	DW	AA0A5
TA00D:	DW	AA0AB
TA00F:	DW	AA0B1
AA011:	XCHG
	SHLD	DA343
	XCHG
	MOV	A,E
	STA	DADD6
	LXI	H,00000H
	SHLD	DA345
	DAD	SP
	SHLD	DA30F
	LXI	SP,DA341
	XRA	A
	STA	DADE0
	STA	DADDE
	LXI	H,TAD74
	PUSH	H
	MOV	A,C
	CPI	029H
	RNC
	MOV	C,E
	LXI	H,TA047
	MOV	E,A
	MVI	D,000H
	DAD	D
	DAD	D
	MOV	E,M
	INX	H
	MOV	D,M
	LHLD	DA343
	XCHG
	PCHL
TA047:	DW	XAE00
	DW	AA2C8
	DW	AA190
	DW	AA2CE
	DW	XAE12
	DW	XAE0F
	DW	AA2D4
	DW	AA2ED
	DW	AA2F3
	DW	AA2F8
	DW	AA1E1
	DW	AA2FE
	DW	AAC7E
	DW	AAC83
	DW	AAC45
	DW	AAC9C
	DW	AACA5
	DW	AACAB
	DW	AACC8
	DW	AACD7
	DW	AACE0
	DW	AACE6
	DW	AACEC
	DW	AACF5
	DW	AACFE
	DW	AAD04
	DW	AAD0A
	DW	AAD11
	DW	AA52C
	DW	AAD17
	DW	AAD1D
	DW	AAD26
	DW	AAD2D
	DW	AAD41
	DW	AAD47
	DW	AAD4D
	DW	AAC0E
	DW	AAD53
	DW	AA304
	DW	AA304
	DW	AAD9B
AA099:	LXI	H,TA0CA
	CALL	AA0E5
	CPI	003H
	JZ	0
	RET
;
AA0A5:	LXI	H,TA0D5
	JMP	AA0B4
;
AA0AB:	LXI	H,TA0E1
	JMP	AA0B4
;
AA0B1:	LXI	H,TA0DC
AA0B4:	CALL	AA0E5
	JMP	0
TA0BA:	DB	042H
	DB	064H
	DB	06FH
	DB	073H
	DB	020H
	DB	045H
	DB	072H
	DB	072H
	DB	020H
	DB	04FH
	DB	06EH
	DB	020H
DA0C6:	DB	020H
	DB	03AH
	DB	020H
	DB	024H
TA0CA:	DB	042H
	DB	061H
	DB	064H
	DB	020H
	DB	053H
	DB	065H
	DB	063H
	DB	074H
	DB	06FH
	DB	072H
	DB	024H
TA0D5:	DB	053H
	DB	065H
	DB	06CH
	DB	065H
	DB	063H
	DB	074H
	DB	024H
TA0DC:	DB	046H
	DB	069H
	DB	06CH
	DB	065H
	DB	020H
TA0E1:	DB	052H
	DB	02FH
	DB	04FH
	DB	024H
AA0E5:	PUSH	H
	CALL	AA1C9
	LDA	DA342
	ADI	041H
	STA	DA0C6
	LXI	B,TA0BA
	CALL	AA1D3
	POP	B
	CALL	AA1D3
AA0FB:	LXI	H,DA30E
	MOV	A,M
	MVI	M,000H
	ORA	A
	RNZ
	JMP	XAE09
;
AA106:	CALL	AA0FB
	CALL	AA114
	RC
	PUSH	PSW
	MOV	C,A
	CALL	AA190
	POP	PSW
	RET
;
AA114:	CPI	00DH
	RZ
	CPI	00AH
	RZ
	CPI	009H
	RZ
	CPI	008H
	RZ
	CPI	020H
	RET
;
AA123:	LDA	DA30E
	ORA	A
	JNZ	AA145
	CALL	XAE06
	ANI	001H
	RZ
	CALL	XAE09
	CPI	013H
	JNZ	AA142
	CALL	XAE09
	CPI	003H
	JZ	0
	XRA	A
	RET
;
AA142:	STA	DA30E
AA145:	MVI	A,001H
	RET
;
AA148:	LDA	DA30A
	ORA	A
	JNZ	AA162
	PUSH	B
	CALL	AA123
	POP	B
	PUSH	B
	CALL	XAE0C
	POP	B
	PUSH	B
	LDA	DA30D
	ORA	A
	CNZ	XAE0F
	POP	B
AA162:	MOV	A,C
	LXI	H,DA30C
	CPI	07FH
	RZ
	INR	M
	CPI	020H
	RNC
	DCR	M
	MOV	A,M
	ORA	A
	RZ
	MOV	A,C
	CPI	008H
	JNZ	AA179
	DCR	M
	RET
;
AA179:	CPI	00AH
	RNZ
	MVI	M,000H
	RET
;
AA17F:	MOV	A,C
	CALL	AA114
	JNC	AA190
	PUSH	PSW
	MVI	C,05EH
	CALL	AA148
	POP	PSW
	ORI	040H
	MOV	C,A
AA190:	MOV	A,C
	CPI	009H
	JNZ	AA148
AA196:	MVI	C,020H
	CALL	AA148
	LDA	DA30C
	ANI	007H
	JNZ	AA196
	RET
;
AA1A4:	CALL	AA1AC
	MVI	C,020H
	CALL	XAE0C
AA1AC:	MVI	C,008H
	JMP	XAE0C
;
AA1B1:	MVI	C,023H
	CALL	AA148
	CALL	AA1C9
AA1B9:	LDA	DA30C
	LXI	H,DA30B
	CMP	M
	RNC
	MVI	C,020H
	CALL	AA148
	JMP	AA1B9
;
AA1C9:	MVI	C,00DH
	CALL	AA148
	MVI	C,00AH
	JMP	AA148
;
AA1D3:	LDAX	B
	CPI	024H
	RZ
	INX	B
	PUSH	B
	MOV	C,A
	CALL	AA190
	POP	B
	JMP	AA1D3
;
AA1E1:	LDA	DA30C
	STA	DA30B
	LHLD	DA343
	MOV	C,M
	INX	H
	PUSH	H
	MVI	B,000H
AA1EF:	PUSH	B
	PUSH	H
AA1F1:	CALL	AA0FB
	ANI	0FFH
	POP	H
	POP	B
	CPI	00DH
	JZ	AA2C1
	CPI	00AH
	JZ	AA2C1
	CPI	008H
	JNZ	AA216
	MOV	A,B
	ORA	A
	JZ	AA1EF
	DCR	B
	LDA	DA30C
	STA	DA30A
	JMP	AA270
;
AA216:	CPI	07FH
	JNZ	AA226
	MOV	A,B
	ORA	A
	JZ	AA1EF
	MOV	A,M
	DCR	B
	DCX	H
	JMP	AA2A9
;
AA226:	CPI	005H
	JNZ	AA237
	PUSH	B
	PUSH	H
	CALL	AA1C9
	XRA	A
	STA	DA30B
	JMP	AA1F1
;
AA237:	CPI	010H
	JNZ	AA248
	PUSH	H
	LXI	H,DA30D
	MVI	A,001H
	SUB	M
	MOV	M,A
	POP	H
	JMP	AA1EF
;
AA248:	CPI	018H
	JNZ	AA25F
	POP	H
AA24E:	LDA	DA30B
	LXI	H,DA30C
	CMP	M
	JNC	AA1E1
	DCR	M
	CALL	AA1A4
	JMP	AA24E
;
AA25F:	CPI	015H
	JNZ	AA26B
	CALL	AA1B1
	POP	H
	JMP	AA1E1
;
AA26B:	CPI	012H
	JNZ	AA2A6
AA270:	PUSH	B
	CALL	AA1B1
	POP	B
	POP	H
	PUSH	H
	PUSH	B
AA278:	MOV	A,B
	ORA	A
	JZ	AA28A
	INX	H
	MOV	C,M
	DCR	B
	PUSH	B
	PUSH	H
	CALL	AA17F
	POP	H
	POP	B
	JMP	AA278
;
AA28A:	PUSH	H
	LDA	DA30A
	ORA	A
	JZ	AA1F1
	LXI	H,DA30C
	SUB	M
	STA	DA30A
AA299:	CALL	AA1A4
	LXI	H,DA30A
	DCR	M
	JNZ	AA299
	JMP	AA1F1
;
AA2A6:	INX	H
	MOV	M,A
	INR	B
AA2A9:	PUSH	B
	PUSH	H
	MOV	C,A
	CALL	AA17F
	POP	H
	POP	B
	MOV	A,M
	CPI	003H
	MOV	A,B
	JNZ	AA2BD
	CPI	001H
	JZ	0
AA2BD:	CMP	C
	JC	AA1EF
AA2C1:	POP	H
	MOV	M,B
	MVI	C,00DH
	JMP	AA148
;
AA2C8:	CALL	AA106
	JMP	AA301
;
AA2CE:	CALL	XAE15
	JMP	AA301
;
AA2D4:	MOV	A,C
	INR	A
	JZ	AA2E0
	INR	A
	JZ	XAE06
	JMP	XAE0C
;
AA2E0:	CALL	XAE06
	ORA	A
	JZ	AAD91
	CALL	XAE09
	JMP	AA301
;
AA2ED:	LDA	3
	JMP	AA301
;
AA2F3:	LXI	H,00003H
	MOV	M,C
	RET
;
AA2F8:	XCHG
	MOV	C,L
	MOV	B,H
	JMP	AA1D3
;
AA2FE:	CALL	AA123
AA301:	STA	DA345
AA304:	RET
;
AA305:	MVI	A,001H
	JMP	AA301
DA30A:	DB	000H
DA30B:	DB	000H
DA30C:	DB	000H
DA30D:	DB	000H
DA30E:	DB	000H
DA30F:	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
DA341:	DB	000H
DA342:	DB	000H
DA343:	DB	000H
	DB	000H
DA345:	DB	000H
	DB	000H
AA347:	LXI	H,TA00B
AA34A:	MOV	E,M
	INX	H
	MOV	D,M
	XCHG
	PCHL
;
AA34F:	INR	C
AA350:	DCR	C
	RZ
	LDAX	D
	MOV	M,A
	INX	D
	INX	H
	JMP	AA350
;
AA359:	LDA	DA342
	MOV	C,A
	CALL	XAE1B
	MOV	A,H
	ORA	L
	RZ
	MOV	E,M
	INX	H
	MOV	D,M
	INX	H
	SHLD	DADB3
	INX	H
	INX	H
	SHLD	DADB5
	INX	H
	INX	H
	SHLD	DADB7
	INX	H
	INX	H
	XCHG
	SHLD	DADD0
	LXI	H,DADB9
	MVI	C,008H
	CALL	AA34F
	LHLD	DADBB
	XCHG
	LXI	H,DADC1
	MVI	C,00FH
	CALL	AA34F
	LHLD	DADC6
	MOV	A,H
	LXI	H,DADDD
	MVI	M,0FFH
	ORA	A
	JZ	AA39D
	MVI	M,000H
AA39D:	MVI	A,0FFH
	ORA	A
	RET
;
AA3A1:	CALL	XAE18
	XRA	A
	LHLD	DADB5
	MOV	M,A
	INX	H
	MOV	M,A
	LHLD	DADB7
	MOV	M,A
	INX	H
	MOV	M,A
	RET
;
AA3B2:	CALL	XAE27
	JMP	AA3BB
;
AA3B8:	CALL	XAE2A
AA3BB:	ORA	A
	RZ
	LXI	H,TA009
	JMP	AA34A
;
AA3C3:	LHLD	DADEA
	MVI	C,002H
	CALL	AA4EA
	SHLD	DADE5
	SHLD	DADEC
AA3D1:	LXI	H,DADE5
	MOV	C,M
	INX	H
	MOV	B,M
	LHLD	DADB7
	MOV	E,M
	INX	H
	MOV	D,M
	LHLD	DADB5
	MOV	A,M
	INX	H
	MOV	H,M
	MOV	L,A
AA3E4:	MOV	A,C
	SUB	E
	MOV	A,B
	SBB	D
	JNC	AA3FA
	PUSH	H
	LHLD	DADC1
	MOV	A,E
	SUB	L
	MOV	E,A
	MOV	A,D
	SBB	H
	MOV	D,A
	POP	H
	DCX	H
	JMP	AA3E4
;
AA3FA:	PUSH	H
	LHLD	DADC1
	DAD	D
	JC	AA40F
	MOV	A,C
	SUB	L
	MOV	A,B
	SBB	H
	JC	AA40F
	XCHG
	POP	H
	INX	H
	JMP	AA3FA
;
AA40F:	POP	H
	PUSH	B
	PUSH	D
	PUSH	H
	XCHG
	LHLD	DADCE
	DAD	D
	MOV	B,H
	MOV	C,L
	CALL	XAE1E
	POP	D
	LHLD	DADB5
	MOV	M,E
	INX	H
	MOV	M,D
	POP	D
	LHLD	DADB7
	MOV	M,E
	INX	H
	MOV	M,D
	POP	B
	MOV	A,C
	SUB	E
	MOV	C,A
	MOV	A,B
	SBB	D
	MOV	B,A
	LHLD	DADD0
	XCHG
	CALL	XAE30
	MOV	C,L
	MOV	B,H
	JMP	XAE21
;
AA43E:	LXI	H,DADC3
	MOV	C,M
	LDA	DADE3
AA445:	ORA	A
	RAR
	DCR	C
	JNZ	AA445
	MOV	B,A
	MVI	A,008H
	SUB	M
	MOV	C,A
	LDA	DADE2
AA453:	DCR	C
	JZ	AA45C
	ORA	A
	RAL
	JMP	AA453
;
AA45C:	ADD	B
	RET
;
AA45E:	LHLD	DA343
	LXI	D,00010H
	DAD	D
	DAD	B
	LDA	DADDD
	ORA	A
	JZ	AA471
	MOV	L,M
	MVI	H,000H
	RET
;
AA471:	DAD	B
	MOV	E,M
	INX	H
	MOV	D,M
	XCHG
	RET
;
AA477:	CALL	AA43E
	MOV	C,A
	MVI	B,000H
	CALL	AA45E
	SHLD	DADE5
	RET
;
AA484:	LHLD	DADE5
	MOV	A,L
	ORA	H
	RET
;
AA48A:	LDA	DADC3
	LHLD	DADE5
AA490:	DAD	H
	DCR	A
	JNZ	AA490
	SHLD	DADE7
	LDA	DADC4
	MOV	C,A
	LDA	DADE3
	ANA	C
	ORA	L
	MOV	L,A
	SHLD	DADE5
	RET
;
AA4A6:	LHLD	DA343
	LXI	D,0000CH
	DAD	D
	RET
;
AA4AE:	LHLD	DA343
	LXI	D,0000FH
	DAD	D
	XCHG
	LXI	H,00011H
	DAD	D
	RET
;
AA4BB:	CALL	AA4AE
	MOV	A,M
	STA	DADE3
	XCHG
	MOV	A,M
	STA	DADE1
	CALL	AA4A6
	LDA	DADC5
	ANA	M
	STA	DADE2
	RET
;
AA4D2:	CALL	AA4AE
	LDA	DADD5
	CPI	002H
	JNZ	AA4DE
	XRA	A
AA4DE:	MOV	C,A
	LDA	DADE3
	ADD	C
	MOV	M,A
	XCHG
	LDA	DADE1
	MOV	M,A
	RET
;
AA4EA:	INR	C
AA4EB:	DCR	C
	RZ
	MOV	A,H
	ORA	A
	RAR
	MOV	H,A
	MOV	A,L
	RAR
	MOV	L,A
	JMP	AA4EB
;
AA4F7:	MVI	C,080H
	LHLD	DADB9
	XRA	A
AA4FD:	ADD	M
	INX	H
	DCR	C
	JNZ	AA4FD
	RET
;
AA504:	INR	C
AA505:	DCR	C
	RZ
	DAD	H
	JMP	AA505
;
AA50B:	PUSH	B
	LDA	DA342
	MOV	C,A
	LXI	H,00001H
	CALL	AA504
	POP	B
	MOV	A,C
	ORA	L
	MOV	L,A
	MOV	A,B
	ORA	H
	MOV	H,A
	RET
;
AA51E:	LHLD	DADAD
	LDA	DA342
	MOV	C,A
	CALL	AA4EA
	MOV	A,L
	ANI	001H
	RET
;
AA52C:	LXI	H,DADAD
	MOV	C,M
	INX	H
	MOV	B,M
	CALL	AA50B
	SHLD	DADAD
	LHLD	DADC8
	INX	H
	XCHG
	LHLD	DADB3
	MOV	M,E
	INX	H
	MOV	M,D
	RET
;
AA544:	CALL	AA55E
AA547:	LXI	D,00009H
	DAD	D
	MOV	A,M
	RAL
	RNC
	LXI	H,TA00F
	JMP	AA34A
;
AA554:	CALL	AA51E
	RZ
	LXI	H,TA00D
	JMP	AA34A
;
AA55E:	LHLD	DADB9
	LDA	DADE9
AA564:	ADD	L
	MOV	L,A
	RNC
	INR	H
	RET
;
AA569:	LHLD	DA343
	LXI	D,0000EH
	DAD	D
	MOV	A,M
	RET
;
AA572:	CALL	AA569
	MVI	M,000H
	RET
;
AA578:	CALL	AA569
	ORI	080H
	MOV	M,A
	RET
;
AA57F:	LHLD	DADEA
	XCHG
	LHLD	DADB3
	MOV	A,E
	SUB	M
	INX	H
	MOV	A,D
	SBB	M
	RET
;
AA58C:	CALL	AA57F
	RC
	INX	D
	MOV	M,D
	DCX	H
	MOV	M,E
	RET
;
AA595:	MOV	A,E
	SUB	L
	MOV	L,A
	MOV	A,D
	SBB	H
	MOV	H,A
	RET
;
AA59C:	MVI	C,0FFH
AA59E:	LHLD	DADEC
	XCHG
	LHLD	DADCC
	CALL	AA595
	RNC
	PUSH	B
	CALL	AA4F7
	LHLD	DADBD
	XCHG
	LHLD	DADEC
	DAD	D
	POP	B
	INR	C
	JZ	AA5C4
	CMP	M
	RZ
	CALL	AA57F
	RNC
	CALL	AA52C
	RET
;
AA5C4:	MOV	M,A
	RET
;
AA5C6:	CALL	AA59C
	CALL	AA5E0
	MVI	C,001H
	CALL	AA3B8
	JMP	AA5DA
;
AA5D4:	CALL	AA5E0
	CALL	AA3B2
AA5DA:	LXI	H,DADB1
	JMP	AA5E3
;
AA5E0:	LXI	H,DADB9
AA5E3:	MOV	C,M
	INX	H
	MOV	B,M
	JMP	XAE24
;
AA5E9:	LHLD	DADB9
	XCHG
	LHLD	DADB1
	MVI	C,080H
	JMP	VRTMOV
;
AA5F5:	LXI	H,DADEA
	MOV	A,M
	INX	H
	CMP	M
	RNZ
	INR	A
	RET
;
AA5FE:	LXI	H,0FFFFH
	SHLD	DADEA
	RET
;
AA605:	LHLD	DADC8
	XCHG
	LHLD	DADEA
	INX	H
	SHLD	DADEA
	CALL	AA595
	JNC	AA619
	JMP	AA5FE
;
AA619:	LDA	DADEA
	ANI	003H
	MVI	B,005H
AA620:	ADD	A
	DCR	B
	JNZ	AA620
	STA	DADE9
	ORA	A
	RNZ
	PUSH	B
	CALL	AA3C3
	CALL	AA5D4
	POP	B
	JMP	AA59E
;
AA635:	MOV	A,C
	ANI	007H
	INR	A
	MOV	E,A
	MOV	D,A
	MOV	A,C
	RRC
	RRC
	RRC
	ANI	01FH
	MOV	C,A
	MOV	A,B
	ADD	A
	ADD	A
	ADD	A
	ADD	A
	ADD	A
	ORA	C
	MOV	C,A
	MOV	A,B
	RRC
	RRC
	RRC
	ANI	01FH
	MOV	B,A
	LHLD	DADBF
	DAD	B
	MOV	A,M
AA656:	RLC
	DCR	E
	JNZ	AA656
	RET
;
AA65C:	PUSH	D
	CALL	AA635
	ANI	0FEH
	POP	B
	ORA	C
AA664:	RRC
	DCR	D
	JNZ	AA664
	MOV	M,A
	RET
;
AA66B:	CALL	AA55E
	LXI	D,00010H
	DAD	D
	PUSH	B
	MVI	C,011H
AA675:	POP	D
	DCR	C
	RZ
	PUSH	D
	LDA	DADDD
	ORA	A
	JZ	AA688
	PUSH	B
	PUSH	H
	MOV	C,M
	MVI	B,000H
	JMP	AA68E
;
AA688:	DCR	C
	PUSH	B
	MOV	C,M
	INX	H
	MOV	B,M
	PUSH	H
AA68E:	MOV	A,C
	ORA	B
	JZ	AA69D
	LHLD	DADC6
	MOV	A,L
	SUB	C
	MOV	A,H
	SBB	B
	CNC	AA65C
AA69D:	POP	H
	INX	H
	POP	B
	JMP	AA675
;
AA6A3:	LHLD	DADC6
	MVI	C,003H
	CALL	AA4EA
	INX	H
	MOV	B,H
	MOV	C,L
	LHLD	DADBF
AA6B1:	MVI	M,000H
	INX	H
	DCX	B
	MOV	A,B
	ORA	C
	JNZ	AA6B1
	LHLD	DADCA
	XCHG
	LHLD	DADBF
	MOV	M,E
	INX	H
	MOV	M,D
	CALL	AA3A1
	LHLD	DADB3
	MVI	M,003H
	INX	H
	MVI	M,000H
	CALL	AA5FE
AA6D2:	MVI	C,0FFH
	CALL	AA605
	CALL	AA5F5
	RZ
	CALL	AA55E
	MVI	A,0E5H
	CMP	M
	JZ	AA6D2
	LDA	DA341
	CMP	M
	JNZ	AA6F6
	INX	H
	MOV	A,M
	SUI	024H
	JNZ	AA6F6
	DCR	A
	STA	DA345
AA6F6:	MVI	C,001H
	CALL	AA66B
	CALL	AA58C
	JMP	AA6D2
;
AA701:	LDA	DADD4
	JMP	AA301
;
AA707:	PUSH	B
	PUSH	PSW
	LDA	DADC5
	CMA
	MOV	B,A
	MOV	A,C
	ANA	B
	MOV	C,A
	POP	PSW
	ANA	B
	SUB	C
	ANI	01FH
	POP	B
	RET
;
AA718:	MVI	A,0FFH
	STA	DADD4
	LXI	H,DADD8
	MOV	M,C
	LHLD	DA343
	SHLD	DADD9
	CALL	AA5FE
	CALL	AA3A1
AA72D:	MVI	C,000H
	CALL	AA605
	CALL	AA5F5
	JZ	AA794
	LHLD	DADD9
	XCHG
	LDAX	D
	CPI	0E5H
	JZ	AA74A
	PUSH	D
	CALL	AA57F
	POP	D
	JNC	AA794
AA74A:	CALL	AA55E
	LDA	DADD8
	MOV	C,A
	MVI	B,000H
AA753:	MOV	A,C
	ORA	A
	JZ	AA783
	LDAX	D
	CPI	03FH
	JZ	AA77C
	MOV	A,B
	CPI	00DH
	JZ	AA77C
	CPI	00CH
	LDAX	D
	JZ	AA773
	SUB	M
	ANI	07FH
	JNZ	AA72D
	JMP	AA77C
;
AA773:	PUSH	B
	MOV	C,M
	CALL	AA707
	POP	B
	JNZ	AA72D
AA77C:	INX	D
	INX	H
	INR	B
	DCR	C
	JMP	AA753
;
AA783:	LDA	DADEA
	ANI	003H
	STA	DA345
	LXI	H,DADD4
	MOV	A,M
	RAL
	RNC
	XRA	A
	MOV	M,A
	RET
;
AA794:	CALL	AA5FE
	MVI	A,0FFH
	JMP	AA301
;
AA79C:	CALL	AA554
	MVI	C,00CH
	CALL	AA718
AA7A4:	CALL	AA5F5
	RZ
	CALL	AA544
	CALL	AA55E
	MVI	M,0E5H
	MVI	C,000H
	CALL	AA66B
	CALL	AA5C6
	CALL	AA72D
	JMP	AA7A4
;
AA7BE:	MOV	D,B
	MOV	E,C
AA7C0:	MOV	A,C
	ORA	B
	JZ	AA7D1
	DCX	B
	PUSH	D
	PUSH	B
	CALL	AA635
	RAR
	JNC	AA7EC
	POP	B
	POP	D
AA7D1:	LHLD	DADC6
	MOV	A,E
	SUB	L
	MOV	A,D
	SBB	H
	JNC	AA7F4
	INX	D
	PUSH	B
	PUSH	D
	MOV	B,D
	MOV	C,E
	CALL	AA635
	RAR
	JNC	AA7EC
	POP	D
	POP	B
	JMP	AA7C0
;
AA7EC:	RAL
	INR	A
	CALL	AA664
	POP	H
	POP	D
	RET
;
AA7F4:	MOV	A,C
	ORA	B
	JNZ	AA7C0
	LXI	H,00000H
	RET
;
AA7FD:	MVI	C,000H
	MVI	E,020H
AA801:	PUSH	D
	MVI	B,000H
	LHLD	DA343
	DAD	B
	XCHG
	CALL	AA55E
	POP	B
	CALL	AA34F
AA810:	CALL	AA3C3
	JMP	AA5C6
;
AA816:	CALL	AA554
	MVI	C,00CH
	CALL	AA718
	LHLD	DA343
	MOV	A,M
	LXI	D,00010H
	DAD	D
	MOV	M,A
AA827:	CALL	AA5F5
	RZ
	CALL	AA544
	MVI	C,010H
	MVI	E,00CH
	CALL	AA801
	CALL	AA72D
	JMP	AA827
;
AA83B:	MVI	C,00CH
	CALL	AA718
AA840:	CALL	AA5F5
	RZ
	MVI	C,000H
	MVI	E,00CH
	CALL	AA801
	CALL	AA72D
	JMP	AA840
;
AA851:	MVI	C,00FH
	CALL	AA718
	CALL	AA5F5
	RZ
AA85A:	CALL	AA4A6
	MOV	A,M
	PUSH	PSW
	PUSH	H
	CALL	AA55E
	XCHG
	LHLD	DA343
	MVI	C,020H
	PUSH	D
	CALL	AA34F
	CALL	AA578
	POP	D
	LXI	H,0000CH
	DAD	D
	MOV	C,M
	LXI	H,0000FH
	DAD	D
	MOV	B,M
	POP	H
	POP	PSW
	MOV	M,A
	MOV	A,C
	CMP	M
	MOV	A,B
	JZ	AA88B
	MVI	A,000H
	JC	AA88B
	MVI	A,080H
AA88B:	LHLD	DA343
	LXI	D,0000FH
	DAD	D
	MOV	M,A
	RET
;
AA894:	MOV	A,M
	INX	H
	ORA	M
	DCX	H
	RNZ
	LDAX	D
	MOV	M,A
	INX	D
	INX	H
	LDAX	D
	MOV	M,A
	DCX	D
	DCX	H
	RET
;
AA8A2:	XRA	A
	STA	DA345
	STA	DADEA
	STA	DADEB
	CALL	AA51E
	RNZ
	CALL	AA569
	ANI	080H
	RNZ
	MVI	C,00FH
	CALL	AA718
	CALL	AA5F5
	RZ
	LXI	B,00010H
	CALL	AA55E
	DAD	B
	XCHG
	LHLD	DA343
	DAD	B
	MVI	C,010H
AA8CD:	LDA	DADDD
	ORA	A
	JZ	AA8E8
	MOV	A,M
	ORA	A
	LDAX	D
	JNZ	AA8DB
	MOV	M,A
AA8DB:	ORA	A
	JNZ	AA8E1
	MOV	A,M
	STAX	D
AA8E1:	CMP	M
	JNZ	AA91F
	JMP	AA8FD
;
AA8E8:	CALL	AA894
	XCHG
	CALL	AA894
	XCHG
	LDAX	D
	CMP	M
	JNZ	AA91F
	INX	D
	INX	H
	LDAX	D
	CMP	M
	JNZ	AA91F
	DCR	C
AA8FD:	INX	D
	INX	H
	DCR	C
	JNZ	AA8CD
	LXI	B,0FFECH
	DAD	B
	XCHG
	DAD	B
	LDAX	D
	CMP	M
	JC	AA917
	MOV	M,A
	LXI	B,00003H
	DAD	B
	XCHG
	DAD	B
	MOV	A,M
	STAX	D
AA917:	MVI	A,0FFH
	STA	DADD2
	JMP	AA810
;
AA91F:	LXI	H,DA345
	DCR	M
	RET
;
AA924:	CALL	AA554
	LHLD	DA343
	PUSH	H
	LXI	H,TADAC
	SHLD	DA343
	MVI	C,001H
	CALL	AA718
	CALL	AA5F5
	POP	H
	SHLD	DA343
	RZ
	XCHG
	LXI	H,0000FH
	DAD	D
	MVI	C,011H
	XRA	A
AA946:	MOV	M,A
	INX	H
	DCR	C
	JNZ	AA946
	LXI	H,0000DH
	DAD	D
	MOV	M,A
	CALL	AA58C
	CALL	AA7FD
	JMP	AA578
;
AA95A:	XRA	A
	STA	DADD2
	CALL	AA8A2
	CALL	AA5F5
	RZ
	LHLD	DA343
	LXI	B,0000CH
	DAD	B
	MOV	A,M
	INR	A
	ANI	01FH
	MOV	M,A
	JZ	AA983
	MOV	B,A
	LDA	DADC5
	ANA	B
	LXI	H,DADD2
	ANA	M
	JZ	AA98E
	JMP	AA9AC
;
AA983:	LXI	B,00002H
	DAD	B
	INR	M
	MOV	A,M
	ANI	00FH
	JZ	AA9B6
AA98E:	MVI	C,00FH
	CALL	AA718
	CALL	AA5F5
	JNZ	AA9AC
	LDA	DADD3
	INR	A
	JZ	AA9B6
	CALL	AA924
	CALL	AA5F5
	JZ	AA9B6
	JMP	AA9AF
;
AA9AC:	CALL	AA85A
AA9AF:	CALL	AA4BB
	XRA	A
	JMP	AA301
;
AA9B6:	CALL	AA305
	JMP	AA578
;
AA9BC:	MVI	A,001H
	STA	DADD5
AA9C1:	MVI	A,0FFH
	STA	DADD3
	CALL	AA4BB
	LDA	DADE3
	LXI	H,DADE1
	CMP	M
	JC	AA9E6
	CPI	080H
	JNZ	AA9FB
	CALL	AA95A
	XRA	A
	STA	DADE3
	LDA	DA345
	ORA	A
	JNZ	AA9FB
AA9E6:	CALL	AA477
	CALL	AA484
	JZ	AA9FB
	CALL	AA48A
	CALL	AA3D1
	CALL	AA3B2
	JMP	AA4D2
;
AA9FB:	JMP	AA305
;
AA9FE:	MVI	A,001H
	STA	DADD5
AAA03:	MVI	A,000H
	STA	DADD3
	CALL	AA554
	LHLD	DA343
	CALL	AA547
	CALL	AA4BB
	LDA	DADE3
	CPI	080H
	JNC	AA305
	CALL	AA477
	CALL	AA484
	MVI	C,000H
	JNZ	AAA6E
	CALL	AA43E
	STA	DADD7
	LXI	B,00000H
	ORA	A
	JZ	AAA3B
	MOV	C,A
	DCX	B
	CALL	AA45E
	MOV	B,H
	MOV	C,L
AAA3B:	CALL	AA7BE
	MOV	A,L
	ORA	H
	JNZ	AAA48
	MVI	A,002H
	JMP	AA301
;
AAA48:	SHLD	DADE5
	XCHG
	LHLD	DA343
	LXI	B,00010H
	DAD	B
	LDA	DADDD
	ORA	A
	LDA	DADD7
	JZ	AAA64
	CALL	AA564
	MOV	M,E
	JMP	AAA6C
;
AAA64:	MOV	C,A
	MVI	B,000H
	DAD	B
	DAD	B
	MOV	M,E
	INX	H
	MOV	M,D
AAA6C:	MVI	C,002H
AAA6E:	LDA	DA345
	ORA	A
	RNZ
	PUSH	B
	CALL	AA48A
	LDA	DADD5
	DCR	A
	DCR	A
	JNZ	AAABB
	POP	B
	PUSH	B
	MOV	A,C
	DCR	A
	DCR	A
	JNZ	AAABB
	PUSH	H
	LHLD	DADB9
	MOV	D,A
AAA8C:	MOV	M,A
	INX	H
	INR	D
	JP	AAA8C
	CALL	AA5E0
	LHLD	DADE7
	MVI	C,002H
AAA9A:	SHLD	DADE5
	PUSH	B
	CALL	AA3D1
	POP	B
	CALL	AA3B8
	LHLD	DADE5
	MVI	C,000H
	LDA	DADC4
	MOV	B,A
	ANA	L
	CMP	B
	INX	H
	JNZ	AAA9A
	POP	H
	SHLD	DADE5
	CALL	AA5DA
AAABB:	CALL	AA3D1
	POP	B
	PUSH	B
	CALL	AA3B8
	POP	B
	LDA	DADE3
	LXI	H,DADE1
	CMP	M
	JC	AAAD2
	MOV	M,A
	INR	M
	MVI	C,002H
AAAD2:	DCR	C
	DCR	C
	JNZ	AAADF
	PUSH	PSW
	CALL	AA569
	ANI	07FH
	MOV	M,A
	POP	PSW
AAADF:	CPI	07FH
	JNZ	AAB00
	LDA	DADD5
	CPI	001H
	JNZ	AAB00
	CALL	AA4D2
	CALL	AA95A
	LXI	H,DA345
	MOV	A,M
	ORA	A
	JNZ	AAAFE
	DCR	A
	STA	DADE3
AAAFE:	MVI	M,000H
AAB00:	JMP	AA4D2
;
AAB03:	XRA	A
	STA	DADD5
AAB07:	PUSH	B
	LHLD	DA343
	XCHG
	LXI	H,00021H
	DAD	D
	MOV	A,M
	ANI	07FH
	PUSH	PSW
	MOV	A,M
	RAL
	INX	H
	MOV	A,M
	RAL
	ANI	01FH
	MOV	C,A
	MOV	A,M
	RAR
	RAR
	RAR
	RAR
	ANI	00FH
	MOV	B,A
	POP	PSW
	INX	H
	MOV	L,M
	INR	L
	DCR	L
	MVI	L,006H
	JNZ	AAB8B
	LXI	H,00020H
	DAD	D
	MOV	M,A
	LXI	H,0000CH
	DAD	D
	MOV	A,C
	SUB	M
	JNZ	AAB47
	LXI	H,0000EH
	DAD	D
	MOV	A,B
	SUB	M
	ANI	07FH
	JZ	AAB7F
AAB47:	PUSH	B
	PUSH	D
	CALL	AA8A2
	POP	D
	POP	B
	MVI	L,003H
	LDA	DA345
	INR	A
	JZ	AAB84
	LXI	H,0000CH
	DAD	D
	MOV	M,C
	LXI	H,0000EH
	DAD	D
	MOV	M,B
	CALL	AA851
	LDA	DA345
	INR	A
	JNZ	AAB7F
	POP	B
	PUSH	B
	MVI	L,004H
	INR	C
	JZ	AAB84
	CALL	AA924
	MVI	L,005H
	LDA	DA345
	INR	A
	JZ	AAB84
AAB7F:	POP	B
	XRA	A
	JMP	AA301
;
AAB84:	PUSH	H
	CALL	AA569
	MVI	M,0C0H
	POP	H
AAB8B:	POP	B
	MOV	A,L
	STA	DA345
	JMP	AA578
;
AAB93:	MVI	C,0FFH
	CALL	AAB03
	CZ	AA9C1
	RET
;
AAB9C:	MVI	C,000H
	CALL	AAB03
	CZ	AAA03
	RET
;
AABA5:	XCHG
	DAD	D
	MOV	C,M
	MVI	B,000H
	LXI	H,0000CH
	DAD	D
	MOV	A,M
	RRC
	ANI	080H
	ADD	C
	MOV	C,A
	MVI	A,000H
	ADC	B
	MOV	B,A
	MOV	A,M
	RRC
	ANI	00FH
	ADD	B
	MOV	B,A
	LXI	H,0000EH
	DAD	D
	MOV	A,M
	ADD	A
	ADD	A
	ADD	A
	ADD	A
	PUSH	PSW
	ADD	B
	MOV	B,A
	PUSH	PSW
	POP	H
	MOV	A,L
	POP	H
	ORA	L
	ANI	001H
	RET
;
AABD2:	MVI	C,00CH
	CALL	AA718
	LHLD	DA343
	LXI	D,00021H
	DAD	D
	PUSH	H
	MOV	M,D
	INX	H
	MOV	M,D
	INX	H
	MOV	M,D
AABE4:	CALL	AA5F5
	JZ	AAC0C
	CALL	AA55E
	LXI	D,0000FH
	CALL	AABA5
	POP	H
	PUSH	H
	MOV	E,A
	MOV	A,C
	SUB	M
	INX	H
	MOV	A,B
	SBB	M
	INX	H
	MOV	A,E
	SBB	M
	JC	AAC06
	MOV	M,E
	DCX	H
	MOV	M,B
	DCX	H
	MOV	M,C
AAC06:	CALL	AA72D
	JMP	AABE4
;
AAC0C:	POP	H
	RET
;
AAC0E:	LHLD	DA343
	LXI	D,00020H
	CALL	AABA5
	LXI	H,00021H
	DAD	D
	MOV	M,C
	INX	H
	MOV	M,B
	INX	H
	MOV	M,A
	RET
;
AAC21:	LHLD	DADAF
	LDA	DA342
	MOV	C,A
	CALL	AA4EA
	PUSH	H
	XCHG
	CALL	AA359
	POP	H
	CZ	AA347
	MOV	A,L
	RAR
	RC
	LHLD	DADAF
	MOV	C,L
	MOV	B,H
	CALL	AA50B
	SHLD	DADAF
	JMP	AA6A3
;
AAC45:	LDA	DADD6
	LXI	H,DA342
	CMP	M
	RZ
	MOV	M,A
	JMP	AAC21
;
AAC51:	MVI	A,0FFH
	STA	DADDE
	LHLD	DA343
	MOV	A,M
	ANI	01FH
	DCR	A
	STA	DADD6
	CPI	01EH
	JNC	AAC75
	LDA	DA342
	STA	DADDF
	MOV	A,M
	STA	DADE0
	ANI	0E0H
	MOV	M,A
	CALL	AAC45
AAC75:	LDA	DA341
	LHLD	DA343
	ORA	M
	MOV	M,A
	RET
;
AAC7E:	MVI	A,022H
	JMP	AA301
;
AAC83:	LXI	H,00000H
	SHLD	DADAD
	SHLD	DADAF
	XRA	A
	STA	DA342
	LXI	H,00080H
	SHLD	DADB1
	CALL	AA5DA
	JMP	AAC21
;
AAC9C:	CALL	AA572
	CALL	AAC51
	JMP	AA851
;
AACA5:	CALL	AAC51
	JMP	AA8A2
;
AACAB:	MVI	C,000H
	XCHG
	MOV	A,M
	CPI	03FH
	JZ	AACC2
	CALL	AA4A6
	MOV	A,M
	CPI	03FH
	CNZ	AA572
	CALL	AAC51
	MVI	C,00FH
AACC2:	CALL	AA718
	JMP	AA5E9
;
AACC8:	LHLD	DADD9
	SHLD	DA343
	CALL	AAC51
	CALL	AA72D
	JMP	AA5E9
;
AACD7:	CALL	AAC51
	CALL	AA79C
	JMP	AA701
;
AACE0:	CALL	AAC51
	JMP	AA9BC
;
AACE6:	CALL	AAC51
	JMP	AA9FE
;
AACEC:	CALL	AA572
	CALL	AAC51
	JMP	AA924
;
AACF5:	CALL	AAC51
	CALL	AA816
	JMP	AA701
;
AACFE:	LHLD	DADAF
	JMP	AAD29
;
AAD04:	LDA	DA342
	JMP	AA301
;
AAD0A:	XCHG
	SHLD	DADB1
	JMP	AA5DA
;
AAD11:	LHLD	DADBF
	JMP	AAD29
;
AAD17:	LHLD	DADAD
	JMP	AAD29
;
AAD1D:	CALL	AAC51
	CALL	AA83B
	JMP	AA701
;
AAD26:	LHLD	DADBB
AAD29:	SHLD	DA345
	RET
;
AAD2D:	LDA	DADD6
	CPI	0FFH
	JNZ	AAD3B
	LDA	DA341
	JMP	AA301
;
AAD3B:	ANI	01FH
	STA	DA341
	RET
;
AAD41:	CALL	AAC51
	JMP	AAB93
;
AAD47:	CALL	AAC51
	JMP	AAB9C
;
AAD4D:	CALL	AAC51
	JMP	AABD2
;
AAD53:	LHLD	DA343
	MOV	A,L
	CMA
	MOV	E,A
	MOV	A,H
	CMA
	LHLD	DADAF
	ANA	H
	MOV	D,A
	MOV	A,L
	ANA	E
	MOV	E,A
	LHLD	DADAD
	XCHG
	SHLD	DADAF
	MOV	A,L
	ANA	E
	MOV	L,A
	MOV	A,H
	ANA	D
	MOV	H,A
	SHLD	DADAD
	RET
TAD74:	LDA	DADDE
	ORA	A
	JZ	AAD91
	LHLD	DA343
	MVI	M,000H
	LDA	DADE0
	ORA	A
	JZ	AAD91
	MOV	M,A
	LDA	DADDF
	STA	DADD6
	CALL	AAC45
AAD91:	LHLD	DA30F
	SPHL
	LHLD	DA345
	MOV	A,L
	MOV	B,H
	RET
;
AAD9B:	CALL	AAC51
	MVI	A,002H
	STA	DADD5
	MVI	C,000H
	CALL	AAB07
	CZ	AAA03
	RET
TADAC:	DB	0E5H
DADAD:	DB	000H
	DB	000H
DADAF:	DB	000H
	DB	000H
DADB1:	DB	080H
	DB	000H
DADB3:	DB	000H
	DB	000H
DADB5:	DB	000H
	DB	000H
DADB7:	DB	000H
	DB	000H
DADB9:	DB	000H
	DB	000H
DADBB:	DB	000H
	DB	000H
DADBD:	DB	000H
	DB	000H
DADBF:	DB	000H
	DB	000H
DADC1:	DB	000H
	DB	000H
DADC3:	DB	000H
DADC4:	DB	000H
DADC5:	DB	000H
DADC6:	DB	000H
	DB	000H
DADC8:	DB	000H
	DB	000H
DADCA:	DB	000H
	DB	000H
DADCC:	DB	000H
	DB	000H
DADCE:	DB	000H
	DB	000H
DADD0:	DB	000H
	DB	000H
DADD2:	DB	000H
DADD3:	DB	000H
DADD4:	DB	000H
DADD5:	DB	000H
DADD6:	DB	000H
DADD7:	DB	000H
DADD8:	DB	000H
DADD9:	DB	000H
	DB	000H
	DB	000H
	DB	000H
DADDD:	DB	000H
DADDE:	DB	000H
DADDF:	DB	000H
DADE0:	DB	000H
DADE1:	DB	000H
DADE2:	DB	000H
DADE3:	DB	000H
	DB	000H
DADE5:	DB	000H
	DB	000H
DADE7:	DB	000H
	DB	000H
DADE9:	DB	000H
DADEA:	DB	000H
DADEB:	DB	000H
DADEC:	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	DB	000H
	END
