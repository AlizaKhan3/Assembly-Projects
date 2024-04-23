DOSSEG
.MODEL SMALL
.STACK 100H
.DATA
	NUM1 DB ?
	NUM2 DB ?
	OPT DB ?
      	RESULT DB ?
      	M1 DB 'ENTER 1ST NUMBER: $'
      	M2 DB 'ENTER 2ND NUMBER: $'
      	M3 DB 'ENTER OPERATOR (+,-,*,/): $'
      	M4 DB 'RESULT: $'
.CODE
MAIN PROC
      	MOV AX,@DATA
      	MOV DS,AX

      	MOV AH,9
      	LEA DX,M1      ;
      	INT 21H

      	MOV AH,1
      	INT 21H
      	SUB AL,48
      	MOV NUM1,AL

	MOV DX,10
	MOV AH,2
	INT 21H
	MOV DX,13
	MOV AH,2
	INT 21H

      	MOV AH,9
      	LEA DX,M2      ;
      	INT 21H

      	MOV AH,1
      	INT 21H
      	SUB AL,48
      	MOV NUM2,AL

	MOV DX,10
	MOV AH,2
	INT 21H
	MOV DX,13
	MOV AH,2
	INT 21H

      	MOV AH,9
      	LEA DX,M3      ;
      	INT 21H

      	MOV AH,1
      	INT 21H
       	MOV OPT,AL

	MOV DX,10
	MOV AH,2
	INT 21H
	MOV DX,13
	MOV AH,2
	INT 21H

	MOV AH,9
      	LEA DX,M4      ;
      	INT 21H

      	MOV AL,OPT
      	CMP AL,'+'
      	JE ADDITION
      	CMP AL,'-'
      	JE SUBTRACT
      	CMP AL,'*'
      	JE MULTIPLY
      	CMP AL,'/'
      	JE DIVIDE

ADDITION:
      	MOV AL,NUM1
      	ADD AL,NUM2
      	MOV RESULT,AL
      	JMP RESULTS

SUBTRACT:
      	MOV AL,NUM1
      	SUB AL,NUM2
      	MOV RESULT,AL
      	JMP RESULTS

MULTIPLY:
      	MOV AL,NUM1
      	MUL NUM2
      	MOV RESULT,AL
      	JMP RESULTS

DIVIDE:
      	MOV AL,NUM1
      	MOV AH,0
      	MOV BL,NUM2
      	DIV BL
      	MOV RESULT,AL
      	JMP RESULTS

RESULTS:
      	AAM
      	MOV CH,AH
      	MOV CL,AL
      	MOV DL,CH
      	ADD DL,48
      	MOV AH,2
      	INT 21H
      	MOV DL,CL
      	ADD DL,48
      	MOV AH,2
      	INT 21H

MOV AH,4CH
INT 21H

MAIN ENDP
END MAIN
