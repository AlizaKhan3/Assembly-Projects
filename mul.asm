; Program to take input of two numbers and multiply them

.model small
.stack 100h

.data
    msg1 db 10, 13, "Enter first number: $"
    msg2 db 10, 13, "Enter second number: $"
    result_msg db 10, 13, "Result: $"
    newline db 10, 13, "$"
    num1 db ?
    num2 db ?
    result dw ?

.code
MAIN PROC 
    mov ax, @data
    mov ds, ax

    ; Display message to enter first number
    mov ah, 09h
    lea dx, msg1
    int 21h

    ; Input first number
    mov ah, 01h
    int 21h
    sub al, '0'  ; Convert ASCII to numeric value
    mov num1, al

    ; Display message to enter second number
    mov ah, 09h
    lea dx, msg2
    int 21h

    ; Input second number
    mov ah, 01h
    int 21h
    sub al, '0'  ; Convert ASCII to numeric value
    mov num2, al

     MOV DX,13
     MOV AH,2
     INT 21H
     MOV DX,10
     MOV AH,2
     INT 21H

    ; Multiply the numbers
    mov al, num1
    mov bl, num2
    mul bl

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
    

    ; Terminate program
    mov ah, 4ch
    int 21h

MAIN ENDP
      
END MAIN