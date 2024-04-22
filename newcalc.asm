
DOSSEG
.model SMALL 
.stack 100h 
.data
    num1      db 0
    num2      db 0
    ChooseOpr db 0
    rem       db 0
    input1    db "Enter first number within (0-9): $"
    input2    db "Enter second number within (0-9): $"
    opr db "Which Operation do you want to perform? $"
    add1      db '1'          ;"1 $"
    sub1      db '2'          ;"2.Subtraction$"
    mul1      db '3'           ;"3.Multiplication$"
    div1      db '4'       ;"4.Division$"

    RESULT1 db "The Addition of two numbers is: $"
    RESULT2 db "The Subtraction of two numbers is: $"
    RESULT3 db "The Multiplication of two numbers is: $"
    RESULT4 db "The Division of two numbers is: $"

.code
main proc
                   mov  ax,@data
                   mov  ds,ax

    ;taking first input from the user
                   mov  dx,offset input1
                   mov  ah,9
                   int  21h
                   call NewLine
                   mov  ah,1
                   mov dl,al
                   int  21h
                   sub  al,48                   ;Converts from ASCII to decimal number
                   mov  num1,al
                   mov  ah,2
                   int  21h
    ;taking second input from the user
                   mov  dx,offset input2
                   mov  ah,9
                   int  21h
                   mov  ah,1
                   int  21h
                   sub  al,48                   ;Converts from ASCII to decimal number
                   mov  num2,al
                   mov  ah,2
                   int  21h

                   call NewLine

                   mov  dx, offset chooseopr
                   mov  ah,9
                   int  21h

                   call NewLine
                mov dx,offset opr
                mov ah,1
                int 21h 

                   sub  al,48
                   mov  opr,al
                   mov  ah,2
                   int  21h
call NewLine
                   cmp  opr,2
                   jl   Addition
                   jg   Multiplication

    Subtraction:   
                   mov  al,num1
                   sub  al, num2
                   add  dl,48
                   mov  dx,offset RESULT2
                   mov  ah,9
                   int  21h
                   mov  dl,al
                   mov  ah,2
                   int  21h
                

                   jmp  clear

    Addition:      
                   mov  al,num1
                   add  al, num2
                   sub dl,48
                   mov  dx,offset RESULT1
                   mov  ah,9
                   int  21h

                ;    mov ah,0 
                ;    mov bl,10 
                ;    div bl
                ;    mov rem,ah
                   
                ;    mov dl,al
                ;    mov dl,48
                ;    mov  ah,2
                ;    int  21h
                   call NewLine

                   jmp  clear

    Multiplication:
                   cmp  ChooseOpr,4
                   je   Division

                   mov  al,num1
                   mul  num2
                   mov  dx,offset RESULT3
                   mov  ah,9
                   int  21h
                   mov  ah,0
                   mov  bl,10
                   div  bl
                   mov  rem,ah

                   mov  dl,al
                   add  dl,48
                   mov  ah,2
                   int  21h

                   mov  dl,rem
                   mov  dl,48
                   mov  ah,2
                   int  21h
                   call NewLine

                   jmp  clear

    Division:      
                   mov  ah,0
                   mov  al,num1
                   div  num2
                   add  al,48
                   mov  dx,offset RESULT4
                   mov  ah,9
                   int  21h
                   mov  dl,al
                   mov  ah,2
                   int  21h
                   call NewLine

    clear:         
main endp


NewLine proc
                   mov  dx,13
                   mov  ah,2
                   int  21h
                   mov  dx,10
                   mov  ah,2
                   int  21h
                   ret
NewLine endp
end main