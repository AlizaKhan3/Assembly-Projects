DOSSEG
.MODEL SMALL
.STACK 100H
.DATA
     MAIN_MENU DB 0DH,0AH,"Calculator",0DH,0AH
               DB "Press 'A' For ADDITION",0DH,0AH
               DB "Press 'S' For SUBTRACTION",0DH,0AH
               DB "Press 'M' For MULTIPLICATION",0DH,0AH
               DB "Press 'D' For DIVISION",0DH,0AH
               DB "Press 'E' For EXIT",0DH,0AH
               DB "Press 'R' For RETURN to Main Menu",0DH,0AH
               DB "----------------------------------------------",0DH,0AH
               DB "Enter Your CHOICE",0DH,0AH,'$'
  
     A   DB "A:ADDITION",0DH,0AH,'$'
     S   DB "S:SUBTRACTION",0DH,0AH,'$'
     M   DB "M:MULTIPLICATION",0DH,0AH,'$'
     D   DB "D:DIVISION",0DH,0AH,'$'
     NUM1      DB "Enter First Number",0DH,0AH,'$'
     NUM2      DB "Enter Second Number",0DH,0AH,'$'
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
     JMP START
_ADD:              ; PERFORMING ADDITION
     MOV  AH,09H
     MOV  DX,OFFSET A
     INT  21H
     MOV  AH,09H    ;FIRST OPERAND
     MOV  DX,OFFSET NUM1
     INT  21H
     MOV  AH,01H
     INT  21H
     MOV  OP1,AL
     MOV  AH,09H   ;SECOND OPERAND
     MOV  DX,OFFSET NUM2
     INT  21H
     MOV  AH,01H
     INT  21H
     MOV  OP2,AL
     MOV  AH,09H
     MOV  DX, OFFSET ANS
     INT  21H
     MOV  AL,OP1
     MOV  BL,OP2
     ADD  AL,BL
     Call RESULT
     AAS
     OR   AX, 3030H
     
     call CONT
     jmp  START

_SUB:                                   ; PERFORMING SUBTRACTION
     MOV  AH,09H
     MOV  DX,OFFSET S
     INT  21H
     MOV  AH,09H   ;FIRST OPERAND
     MOV  DX,OFFSET NUM1
     INT  21H
     MOV  AH,01H
     INT  21H
     MOV  OP1,AL
     MOV  AH,09H   ;SECOND OPERAND
     MOV  DX,OFFSET NUM2
     INT  21H
     MOV  AH,01H
     INT  21H
     MOV  OP2,AL
     MOV  AH,09H
     MOV  DX, OFFSET ANS
     INT  21H
     MOV  AL,OP1
     MOV  BL,OP2
     SUB  AL,BL
     Call RESULT
     AAS
     OR   AX, 3030H
     
     call CONT
     jmp  START

_MUL:                                   ; PERFORMING MULTIPLICATION
     MOV  AH,09H
     MOV  DX,OFFSET M
     INT  21H
     MOV  AH,09H  ;FIRST OPERAND
     MOV  DX,OFFSET NUM1
     INT  21H
     MOV  AH,01H
     INT  21H
     SUB  AL,30H
     MOV  OP1,AL
     MOV  AH,09H    ;SECOND OPERAND
     MOV  DX,OFFSET NUM2
     INT  21H
     MOV  AH,01H
     INT  21H
     SUB  AL,30H
     MOV  OP2,AL
     MOV  AH,09H
     MOV  DX, OFFSET ANS
     INT  21H
     MOV  AL,OP1
     MOV  BL,OP2
     MUL  BL
     ADD  AL,30H
     call RESULT
     call CONT
     jmp  START
_DIV:                                   ; PERFORMING DIVISION
     MOV  AH,09H
     MOV  DX,OFFSET D
     INT  21H
     MOV  AH,09H    ;FIRST OPERAND
     MOV  DX,OFFSET NUM1
     INT  21H
     MOV  AH,01H
     INT  21H
     SUB  AL,30H
     MOV  OP1,AL
     MOV  AH,09H   ;SECOND OPERAND
     MOV  DX,OFFSET NUM2
     INT  21H
     MOV  AH,01H
     INT  21H
     SUB  AL,30H
     MOV  OP2,AL
     MOV  AH,09H
     MOV  DX, OFFSET ANS
     INT  21H
     MOV  AX,0000H
     MOV  AL,OP1
     MOV  BL,OP2
     DIV  BL
     ADD  AL,30H
     call RESULT
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

START:
     MOV  AH, 09H
     MOV  DX, OFFSET MAIN_MENU
     INT  21H
     MOV  AH, 01H
     INT  21H
     CMP  AL, 'A'
     JNE   NOT_ADD
     JMP   _ADD
NOT_ADD:
     CMP  AL, 'S'
     JNE   NOT_SUB
     JMP   _SUB
NOT_SUB:
     CMP  AL, 'M'
     JNE   NOT_MUL
     JMP   _MUL
NOT_MUL:
     CMP  AL, 'D'
    

 JNE   NOT_DIV
     JMP   _DIV
NOT_DIV:
     CMP  AL, 'E'
     JE   EXIT
     JMP  START                        ;If none of the above, go back to main menu

EXIT:                                  ; SAY GOOD BYE AND THEN EXIT
     MOV  AH,09H
     MOV  DX,OFFSET EX
     INT  21H

MAIN ENDP
END MAIN