DOSSEG
.MODEL SMALL
.STACK 100H
.DATA
     OPTIONS  DB 13,10,"CALCULATOR --> ADD,SUB,MUL,DIV------",13,10
              DB "Press '1' FOR ADDITION",13,10
              DB "Press '2' FOR SUBTRACTION",13,10
              DB "Press '3' FOR MULTIPLICATION",13,10
              DB "Press '4' FOR DIVISION",13,10
              DB "Press '5' FOR EXIT",13,10
              DB "Press '6' FOR RETURN TO OPTIONS",13,10
              DB "----------------------------------------------",13,10
              DB "Enter Your CHOICE: ",13,10,'$'
     INPUT1   DB "Enter First Number: ",13,10,'$'
     INPUT2   DB "Enter Second Number: ",13,10,'$'
     ADD1     DB " --> For Addition",13,10,'$'
     SUB2     DB " --> For Subtraction",13,10,'$'
     MUL3     DB " --> For Multiplication",13,10,'$'
     DIV4     DB " --> For Division",13,10,'$'
     EX       DB " THANKYOU FOR YOUR TIME! :) ",13,10,'$'
     ANS      DB "ANSWER: ",13,10,'$'
     CONTINUE DB " DO YOU WANT TO CONTINUE? ",13,10,'$'
     OP1      DB ?
     OP2      DB ?
     CON      DB ?
     ;----------------------------------------------------------------------------------------------
.CODE
MAIN PROC          ;Main Procedure Starts here
.STARTUP
     jmp  START

     ;----------------------Addition ------------------------------------------------------------------------
     _ADD:                                       ;PERFORMING ADDITION
                     MOV  AH,09H
                     MOV  DX,OFFSET ADD1
                     INT  21H
                     CALL NEWLINE
                     MOV  AH,09H                 ;FIRTS OPERAND
                     MOV  DX,OFFSET INPUT1
                     INT  21H
                     MOV  AH,01H
                     INT  21H
                     MOV  OP1,AL
                     CALL NEWLINE
                     MOV  AH,09H                 ;SECOND OPERAND
                     MOV  DX,OFFSET INPUT2
                     INT  21H
                     MOV  AH,01H
                     INT  21H
                     MOV  OP2,AL
                     CALL NEWLINE
                     MOV  AH,09H                 ;PRINTS ANSWER
                     MOV  DX, OFFSET ANS
                     INT  21H
                     MOV  AL,OP1                 ;PERFORMING ADDITION
                     MOV  BL,OP2
                     ADD  AL,BL
                     MOV  DL,AL
                     SUB  DL,48
                     CALL RESULT
                     CALL NEWLINE
                     CALL CONT
                     JMP  START
     ;  -------------------------------------------------------------------------------------------------------

     ; --------------------------Subtraction--------------------------------------------------------------------
     _SUB:                                       ; PERFORMING SUBTRACTION
                     MOV  AH,09H
                     MOV  DX, OFFSET SUB2
                     INT  21H
                     CALL NEWLINE
     
                     MOV  AH,09H                 ;FIRTS OPERAND
                     MOV  DX,OFFSET INPUT1
                     INT  21H
                     MOV  AH,01H
                     INT  21H
                     MOV  OP1,AL
                     CALL NEWLINE
     
                     MOV  AH,09H                 ;SECOND OPERAND
                     MOV  DX,OFFSET INPUT2
                     INT  21H
                     MOV  AH,01H
                     INT  21H
                     MOV  OP2,AL
                     CALL NEWLINE
     
                     MOV  AH,09H                 ;PRINTS ANSWER
                     MOV  DX, OFFSET ANS
                     INT  21H
     
                     MOV  AL,OP1                 ;PERFORMING SUBTRACTION
                     MOV  BL,OP2
                     SUB  AL,BL
                     MOV  DL,AL
                     ADD  DL,48
                     CALL RESULT
                     CALL NEWLINE
                     CALL CONT
                     JMP  START
     ; -----------------------------------------------------------------------------------------------

     ; ----------------------------Multiplication-----------------------------------------------------
     _MUL:                                       ; PERFORMING MULTIPLICATION
                     MOV  AH,09H
                     MOV  DX,OFFSET MUL3
                     INT  21H
                     CALL NEWLINE

                     MOV  AH,09H                 ;FIRST OPERAND
                     MOV  DX,OFFSET INPUT1
                     INT  21H
                     MOV  AH,01H
                     INT  21H
                     SUB  AL,48
                     MOV  OP1,AL
                     CALL NEWLINE
     
                     MOV  AH,09H                 ;Second Operand
                     MOV  DX,OFFSET INPUT2
                     INT  21H
                     MOV  AH,01H
                     INT  21H
                     SUB  AL,48
                     MOV  OP2,AL
                     CALL NEWLINE

                     MOV  AH,09H
                     MOV  DX, OFFSET ANS         ;PRINT ANSWER
                     INT  21H

                     MOV  AL,OP1                 ;PERFORMING MULTIPLICATION
                     MOV  BL,OP2
                     MUL  BL
                     CMP  AH, 0                  ;Checking if the result is more than one digit (ans>9)
                     JNZ  MULTIPLE_DIGITS

                     MOV  DL, AL                 ;If the result is single digit, convert it to ASCII and print
                     ADD  DL, 48                 ;Convert to ASCII
                     MOV  AH, 02H                ;Prints Single character
                     INT  21H
                     CALL NEWLINE
                     JMP  START                  ;Jump to Main Menu

     MULTIPLE_DIGITS:                            ;If the result is multiple digits
                     MOV  CX, 10                 ;Set CX to 10 for decimal conversion
                     MOV  SI, OFFSET RESULT      ;Set SI to point to RESULT
                     MOV  DX, OFFSET RESULT      ;Set DX to point to RESULT
                     MOV  AH, 09H                ;Print string function
                     INT  21H
                     CALL NEWLINE
                     CALL CONT
                     JMP  START
     ; ---------------------------------------------------------------------------------

     ; -------------------------------------Division------------------------------------------
     _DIV:                                       ; PERFORMING DIVISION
                     MOV  AH,09H
                     MOV  DX,OFFSET DIV4
                     INT  21H
                     CALL NEWLINE

                     MOV  AH,09H                 ; FIRST Operand
                     MOV  DX,OFFSET INPUT1
                     INT  21H
                     MOV  AH,01H
                     INT  21H
                     SUB  AL,48
                     MOV  OP1,AL
                     CALL NEWLINE

                     MOV  AH,09H                 ; SECOND Operand
                     MOV  DX,OFFSET INPUT2
                     INT  21H
                     MOV  AH,01H
                     INT  21H
                     SUB  AL,48
                     MOV  OP2,AL
                     CALL NEWLINE

                     MOV  AH,09H
                     MOV  DX, OFFSET ANS         ;PRINT ANSWER
                     INT  21H
                     MOV  AX,0000H               ;Clear AX register
                     MOV  AL,OP1                 ;Load dividend (numerator)
                     MOV  BL,OP2                 ;Load divisor  (denominator)
                     DIV  BL                     ;Perform division (AX = AX / BL, quotient in AL, remainder in AH)
     ;Print quotient
                     MOV  DL, AL                 ;Move quotient to DL
                     ADD  DL, 48                 ;Convert quotient to ASCII
                     MOV  AH, 02H                ;Print Single character
                     INT  21H
     ; Print remainder
     ;     MOV  DL, AH                 ;Move remainder to DL
     ;     ADD  DL, 48                 ;Convert remainder to ASCII
     ;     MOV  AH, 02H                ;Print Single character
     ;     INT  21H
                     CALL NEWLINE
                     CALL CONT
                     JMP  START
     ; ---------------------------------------------------------------------------------
   
     ;---------------------------------Procedures---------------------------------------
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
                     MOV  DX,13
                     MOV  AH,2
                     INT  21H
                     MOV  DX,10
                     MOV  AH,2
                     INT  21H
                     RET
NEWLINE ENDP
     ;----------------------All Procedures End-----------------
     ;----------------------------Label--------------------------
     START:          
                     MOV  AH, 09H
                     MOV  DX, OFFSET OPTIONS
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
                     JE   OPT4
                     CMP  AL, '5'
                     JE   OPT5
                     JE   OPT6                   ;If none of the above, go back to main menu

     OPT1:           
                     CMP  AL,'1'
                     JMP  _ADD
                     JMP  OPT2

     OPT2:           
                     CMP  AL,'2'
                     JMP  _SUB
                     JMP  OPT3

     OPT3:           
                     CMP  AL,'3'
                     JMP  _MUL
                     JMP  OPT4

     OPT4:           
                     CMP  AL,'4'
                     JMP  _DIV
                     JMP  OPT5

     OPT5:           
                     CMP  AL,'5'
                     JMP  EXIT
                     JMP  OPT6

     OPT6:           
                     CMP  AL,'6'
                     JMP  START

     EXIT:                                       ; SAY GOOD BYE AND THEN EXIT
                     MOV  AH,09H
                     MOV  DX,OFFSET EX
                     INT  21H
     ;------------------All Labels ended here-------------------------
MAIN ENDP
END MAIN