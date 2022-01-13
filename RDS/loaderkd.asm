	.ORG    00100h
INITCN:	.EQU	0CA00H
L_0100: LXI  SP,00080h
        DI
        MVI  A, 020h
        OUT     010h
        CALL    INITCN
        EI
        LXI  D, L_0160	; надпись
        MVI  C, 009h
        CALL    00005h
        MVI  C, 00Dh
        CALL    00005h
        LXI  H, 0E4F2h	; ='РД'
        SHLD    0000Bh
        LXI  H, 030F3h	; ='С3'
        SHLD    0000Dh
        JMP     00000h
;
	.ORG    00160h
L_0160:	.DB 00Ch, 01Bh, 02Fh, 01Bh
	.DB 062h  ; <b> - | ■■   ■ | (offset 0064h)
	.DB 099h  ; <Щ> - |■  ■■  ■| (offset 0065h)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 0066h)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 0067h)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 0068h)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 0069h)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 006Ah)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 006Bh)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 006Ch)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 006Dh)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 006Eh)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 006Fh)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 0070h)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 0071h)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 0072h)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 0073h)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 0074h)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 0075h)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 0076h)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 0077h)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 0078h)
	.DB 08Bh  ; <Л> - |■   ■ ■■| (offset 0079h)
	.DB 00Ah  ; <_> - |    ■ ■ | (offset 007Ah)
	.DB 08Ah  ; <К> - |■   ■ ■ | (offset 007Bh)
	.DB "     "
	.DB 0F2h  ; <Є> - |■■■■  ■ | (offset 0081h)
	.DB 0E4h  ; <ф> - |■■■  ■  | (offset 0082h)
	.DB 0F3h  ; <є> - |■■■■  ■■| (offset 0083h)
	.DB " V3.05     "
	.DB 08Ah  ; <К> - |■   ■ ■ | (offset 008Fh)
	.DB 00Ah  ; <_> - |    ■ ■ | (offset 0090h)
	.DB 08Ah  ; <К> - |■   ■ ■ | (offset 0091h)
	.DB "    "
	.DB 0F7h  ; <ў> - |■■■■ ■■■| (offset 0096h)
	.DB 0C5h  ; <┼> - |■■   ■ ■| (offset 0097h)
	.DB 0CBh  ; <╦> - |■■  ■ ■■| (offset 0098h)
	.DB 0D4h  ; <╘> - |■■ ■ ■  | (offset 0099h)
	.DB 0CFh  ; <╧> - |■■  ■■■■| (offset 009Ah)
	.DB 0D2h  ; <╥> - |■■ ■  ■ | (offset 009Bh)
	.DB " 06"
	.DB 0E3h  ; <у> - |■■■   ■■| (offset 009Fh)
	.DB "+    "
	.DB 08Ah  ; <К> - |■   ■ ■ | (offset 00A5h)
	.DB 00Ah  ; <_> - |    ■ ■ | (offset 00A6h)
	.DB 08Ah  ; <К> - |■   ■ ■ | (offset 00A7h)
	.DB "  CP/M BDOS V2.2+  "
	.DB 08Ah  ; <К> - |■   ■ ■ | (offset 00BBh)
	.DB 00Ah  ; <_> - |    ■ ■ | (offset 00BCh)
	.DB 08Ah  ; <К> - |■   ■ ■ | (offset 00BDh)
	.DB "  ABC-disk drive.  "
	.DB 08Ah  ; <К> - |■   ■ ■ | (offset 00D1h)
	.DB 00Ah  ; <_> - |    ■ ■ | (offset 00D2h)
	.DB 098h  ; <Ш> - |■  ■■   | (offset 00D3h)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 00D4h)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 00D5h)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 00D6h)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 00D7h)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 00D8h)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 00D9h)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 00DAh)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 00DBh)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 00DCh)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 00DDh)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 00DEh)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 00DFh)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 00E0h)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 00E1h)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 00E2h)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 00E3h)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 00E4h)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 00E5h)
	.DB 09Dh  ; <Э> - |■  ■■■ ■| (offset 00E6h)
	.DB 08Ch  ; <М> - |■   ■■  | (offset 00E7h)
	.DB 00Ah, 01Bh, 061h
	.DB " 62,5Kb free.", 00Ah,'$'
	.DB 000h
	.DB 000h
	.DB 000h
	.DB 000h
	.DB 000h
	.DB 000h
	.END
