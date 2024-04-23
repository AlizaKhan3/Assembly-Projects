DOSSEG
.MODEL SMALL
.STACK 100H
.DATA
     MAIN_MENU DB 0DH,0AH,"Calculator",0DH,0AH
               DB "Press '1' For ADDITION",0DH,0AH
               DB "Press '2' For SUBTRACTION",0DH,0AH
               DB "Press '3' For MULTIPLICATION",0DH,0AH
               DB "Press '4' For DIVISION",0DH,0AH
               DB "Press '5' For EXIT",0DH,0AH
               DB "Press '6' For RETURN to Main Menu",0DH,0AH
               DB "----------------------------------------------",0DH,0AH
               DB "Enter Your CHOICE",0DH,0AH,'$'
     NUM1      DB "Enter First Number",0DH,0AH,'$'
     NUM2      DB "Enter Second Number",0DH,0AH,'$'
     ADD1      DB "FOR ADDITION",0DH,0AH,'$'
     SUB1      DB "FOR SUBTRACTION",0DH,0AH,'$'
     MUL1      DB "FOR MULTIPLICATION",0DH,0AH,'$'
     DIV1      DB "FOR DIVISION",0DH,0AH,'$'
     EX        DB "GOOD BYE AND HAVE A NICE TIME :)",0DH,0AH,'$'
     ANS       DB "ANSWER ",0DH,0AH,'$'
     CONTINUE  DB "DO YOU WANT TO CONTINUE",0DH,0AH,'$'
     OP1       DB ?
     OP2       DB ?
     Operand   DB ?
     CON       DB ?
.CODE
MAIN PROC
.STARTUP
     jmp START
_ADD:              ; PERFORMING ADDITION
      MOV  AH,09H
     MOV  DX,OFFSET ADD1
     INT  21H
     CALL NEWLINE
     MOV  AH,09H    ;FIRTS OPERAND
     MOV  DX,OFFSET NUM1
     INT  21H
     MOV  AH,01H
     INT  21H
     MOV  OP1,AL
CALL NEWLINE
     MOV  AH,09H   ;SECOND OPERAND
     MOV  DX,OFFSET NUM2
     INT  21H
     MOV  AH,01H
     INT  21H
     MOV  OP2,AL
CALL NEWLINE
     MOV  AH,09H   ;PRINTS ANSWER 
     MOV  DX, OFFSET ANS
     INT  21H
CALL NEWLINE
     MOV  AL,OP1    ;PERFORMING ADDITION
     MOV  BL,OP2
     ADD  AL,BL
     MOV DL,AL
     SUB DL,48
    Call RESULT
     ;  MOV AH,4CH 
     ; INT 21H
     AAS
     OR   AX, 3030H
     
     call CONT
     jmp  START


_SUB:                                   ; PERFORMING SUBTRACTION
   MOV  AH,09H
     MOV  DX, OFFSET SUB1
     INT  21H
CALL NEWLINE
     MOV  AH,09H   ;FIRTS OPERAND
     MOV  DX,OFFSET NUM1
     INT  21H
     MOV  AH,01H
     INT  21H
     MOV  OP1,AL
CALL NEWLINE
     MOV  AH,09H   ;SECOND OPERAND
     MOV  DX,OFFSET NUM2
     INT  21H
     MOV  AH,01H
     INT  21H
     MOV  OP2,AL
CALL NEWLINE
     MOV  AH,09H   ;PRINTS ANSWER 
     MOV  DX, OFFSET ANS
     INT  21H 
CALL NEWLINE
     MOV  AL,OP1   ;PERFORMING SUBTRACTION
     MOV  BL,OP2
     SUB  AL,BL
     MOV DL,AL
     ADD DL,48
     
     Call RESULT
     ;   MOV AH,4CH 
     ; INT 21H
     AAS
     OR   AX, 3030H
     
     call CONT
     jmp  START

_MUL:                                   ; PERFORMING MULTIPLICATION
   MOV  AH,09H
     MOV  DX,OFFSET MUL1
     INT  21H
     CALL NEWLINE

     MOV  AH,09H         ;FIRST OPERAND
     MOV  DX,OFFSET NUM1
     INT  21H
     MOV  AH,01H
     INT  21H
     CALL NEWLINE
     ; SUB  AL,30H
     MOV  OP1,AL

     MOV  AH,09H         ;SECOND OPERAND
     MOV  DX,OFFSET NUM2
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
     AAM                      ;ASCII Adjust after multiplication 
          ; MOV DL,AL
          ; ADD DL,48
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
     ; MOV AH,4CH 
     ; INT 21H
     call RESULT
     call CONT
     jmp  START
_DIV:                                   ; PERFORMING DIVISION
     MOV  AH,09H
     MOV  DX,OFFSET DIV1
     INT  21H
     CALL NEWLINE

     MOV  AH,09H         ;FIRST OPERAND
     MOV  DX,OFFSET NUM1
     INT  21H
     MOV  AH,01H
     INT  21H
     ; SUB  AL,30H
     MOV  OP1,AL
     CALL NEWLINE

     MOV  AH,09H          ;SECOND OPERAND
     MOV  DX,OFFSET NUM2
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
          MOV DL,BL
          ADD DL,48
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
     MOV  CON,AL
     MOV  AL,CON
     CMP  AL,'Y'
     JE   START
     CMP  AL,'E'
     JE   EXIT
     RET
CONT ENDP

NEWLINE PROC
     MOV DX,13
     MOV AH,2
     INT 21H
     MOV DX,10
     MOV AH,2
     INT 21H
     RET
NEWLINE ENDP


START:
     MOV  AH, 09H
     MOV  DX, OFFSET MAIN_MENU
     INT  21H
     MOV  AH, 01H
     INT  21H
     CMP  AL, '1'
     JE   OPT1
     CMP  AL, '2'
     JE   OPT2
     CMP  AL, '3'
     JE   OPT3
     CMP  AL, '4'
     JE  OPT4
     CMP  AL, '5'
     JE  OPT5
     JE OPT6                        ;If none of the above, go back to main menu



OPT1:
     CMP AL,'1'
     JMP _ADD
     JMP OPT2

OPT2:
     CMP AL,'2'
     JMP _SUB
     JMP OPT3

OPT3:
     CMP AL,'3'
     JMP _MUL 
     JMP OPT4

OPT4:
     CMP AL,'4'
     JMP _DIV 
     JMP OPT5 



OPT5:
     CMP AL,'5'
     JMP EXIT
     JMP OPT6

OPT6:
     CMP AL,'6'
     JMP START

EXIT:                                  ; SAY GOOD BYE AND THEN EXIT
     MOV  AH,09H
     MOV  DX,OFFSET EX
     INT  21H



MAIN ENDP
END MAIN