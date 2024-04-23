DOSSEG
.MODEL SMALL
.STACK 100H
.DATA
     OPTIONS  DB 0DH,0AH,"Calculator",0DH,0AH
              DB "Press 'A' For ADDITION",0DH,0AH
              DB "Press 'S' For SUBTRACTION",0DH,0AH
              DB "Press 'M' For MULTIPLICATION",0DH,0AH
              DB "Press 'D' For DIVISION",0DH,0AH
              DB "Press 'E' For EXIT",0DH,0AH
              DB "Press 'R' For RETURN to Main Menu",0DH,0AH
              DB "----------------------------------------------",0DH,0AH
              DB "Enter Your CHOICE",0DH,0AH,'$'
  
     A        DB "A:ADDITION",0DH,0AH,'$'
     S        DB "S:SUBTRACTION",0DH,0AH,'$'
     M        DB "M:MULTIPLICATION",0DH,0AH,'$'
     D        DB "D:DIVISION",0DH,0AH,'$'
     INPUT1     DB "Enter First Number",0DH,0AH,'$'
     INPUT2     DB "Enter SeCONTd Number",0DH,0AH,'$'
     EX       DB "GOOD BYE AND HAVE A NICE TIME :)",0DH,0AH,'$'
     ANS      DB "ANSWER ",0DH,0AH,'$'
     CONTINUE DB "DO YOU WANT TO CONTINUE",0DH,0AH,'$'
     OP1      DB ?
     OP2      DB ?
     Operand  DB ?
     CONT      DB ?
.CODE
MAIN PROC
.STARTUP
             jmp  START
     _ADD:                               ; PERFORMING ADDITION
             MOV  AH,09H
             MOV  DX,OFFSET A
             INT  21H
             CALL NEWLINE
             MOV  AH,09H                 ;FIRTS Operand
             MOV  DX,OFFSET INPUT1
             INT  21H
             MOV  AH,01H
             INT  21H
             MOV  OP1,AL
             CALL NEWLINE
             MOV  AH,09H                 ;SECONTD Operand
             MOV  DX,OFFSET INPUT2
             INT  21H
             MOV  AH,01H
             INT  21H
             MOV  OP2,AL
             CALL NEWLINE
             MOV  AH,09H                 ;PRINTS ANSWER
             MOV  DX, OFFSET ANS
             INT  21H
             CALL NEWLINE
             MOV  AL,OP1                 ;PERFORMING ADDITION
             MOV  BL,OP2
             ADD  AL,BL
             MOV  DL,AL
             SUB  DL,48
             Call RESULT

     ; AAS
     ; OR   AX, 3030H
     
             call CONT
             jmp  START

     _SUB:                               ; PERFORMING SUBTRACTION
             MOV  AH,09H
             MOV  DX, OFFSET S
             INT  21H
             CALL NEWLINE
             MOV  AH,09H                 ;FIRTS Operand
             MOV  DX,OFFSET INPUT1
             INT  21H
             MOV  AH,01H
             INT  21H
             MOV  OP1,AL
             CALL NEWLINE
             MOV  AH,09H                 ;SECONTD Operand
             MOV  DX,OFFSET INPUT2
             INT  21H
             MOV  AH,01H
             INT  21H
             MOV  OP2,AL
             CALL NEWLINE
             MOV  AH,09H                 ;PRINTS ANSWER
             MOV  DX, OFFSET ANS
             INT  21H
             CALL NEWLINE
             MOV  AL,OP1                 ;PERFORMING SUBTRACTION
             MOV  BL,OP2
             SUB  AL,BL
             MOV  DL,AL
             ADD  DL,48
     
             Call RESULT
  
     ; AAS
     ; OR   AX, 3030H
     
             call CONT
             jmp  START

     _MUL:                               ; PERFORMING MULTIPLICATION
             MOV  AH,09H
             MOV  DX,OFFSET M
             INT  21H
             CALL NEWLINE

             MOV  AH,09H                 ;FIRST Operand
             MOV  DX,OFFSET INPUT1
             INT  21H
             MOV  AH,01H
             INT  21H
             CALL NEWLINE
     ; SUB  AL,30H
             MOV  OP1,AL

             MOV  AH,09H                 ;SECONTD Operand
             MOV  DX,OFFSET INPUT2
             INT  21H
             CALL NEWLINE
             MOV  AH,01H
             INT  21H
     ; SUB  AL,30H
             MOV  OP2,AL
             MOV  AH,09H
             MOV  DX, OFFSET ANS
             INT  21H
             MOV  AL,OP1
             MOV  BL,OP2
             MUL  BL
     ; ADD  AL,30H
             AAM                         ;ASCII Adjust after multiplication
     ; MOV DL,AL
     ; ADD DL,48
             MOV  CH,AH
             MOV  CL,AL
             MOV  DL,CH
             ADD  DL,48
             MOV  AH,2
             INT  21H
             MOV  DL,CL
             ADD  DL,48
             MOV  AH,2
             INT  21H
             call RESULT
             call CONT
             jmp  START
     _DIV:                               ; PERFORMING DIVISION
             MOV  AH,09H
             MOV  DX,OFFSET D
             INT  21H
             CALL NEWLINE

             MOV  AH,09H                 ;FIRST Operand
             MOV  DX,OFFSET INPUT1
             INT  21H
             MOV  AH,01H
             INT  21H
     ; SUB  AL,30H
             MOV  OP1,AL
             CALL NEWLINE

             MOV  AH,09H                 ;SECONTD Operand
             MOV  DX,OFFSET INPUT2
             INT  21H
             MOV  AH,01H
             INT  21H
     ; SUB  AL,30H
             MOV  OP2,AL
             CALL NEWLINE

             MOV  AH,09H
             MOV  DX, OFFSET ANS
             INT  21H
             CALL NEWLINE

             MOV  AX,0000H
             MOV  AL,OP1
             MOV  BL,OP2
             DIV  BL
     ; ADD  AL,30H
             MOV  DL,BL
             ADD  DL,48
             call RESULT
     ;   MOV AH,4CH
     ; INT 21H
             call CONT
             jmp  START
RESULT PROC
             MOV  AH,2
             INT  21H
             RET
RESULT ENDP
CONT PROC
             MOV  AH,09H
             MOV  DX,OFFSET CONTINUE
             INT  21H
             MOV  AH,01H
             INT  21H
             MOV  CONT,AL
             MOV  AL,CONT
             CMP  AL,'Y'
             JE   START
             CMP  AL,'E'
             JE   EXIT
             RET
CONT ENDP
     START:  
             MOV  AH, 09H
             MOV  DX, OFFSET OPTIONS
             INT  21H
             MOV  AH, 01H
             INT  21H
             CMP  AL, 'A'
             JMP  _ADD
             CMP  AL, 'S'
             JMP  _SUB
             CMP  AL, 'M'
             JMP  _MUL
             CMP  AL, 'D'
             JMP  _DIV
             CMP  AL, 'E'
             JE   EXIT
             JMP  START                  ;If none of the above, go back to main menu

NEWLINE proc
             mov  dx,13
             mov  ah,2
             int  21h
             mov  dx,10
             mov  ah,2
             int  21h
             ret
NewLine endp

     EXIT:                               ; SAY GOOD BYE AND THEN EXIT
             MOV  AH,09H
             MOV  DX,OFFSET EX
             INT  21H

MAIN ENDP
END MAIN
