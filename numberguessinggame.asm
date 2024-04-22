dosseg
.model small
.stack 100h

.data
    msg db "( You have only 3 lives to guess the number )$"
    mainMsg db "Enter a number between 0 and 10: $"
    lessMsg db  " Oh! The number is less than your guess$"
    equalMsg db " HURRAYY! Your guess is correct the number is: $"
    greaterMsg db " Oh! The number is greater than your guess$"
    random db ?
    life db 3 ; Initialize lives to 3

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ax, 10
    mov random, al ; Store random number between 0 and 10

    mov dx, offset msg
    call writestring
    call crlf
    call crlf

L1:
    mov dx, offset mainMsg
    call writestring

    call readInput

    cmp al, random
    jl less
    je equal
    jg greater

Loop L1

less:
    mov dx, offset lessMsg
    call writestring
    call crlf
    call crlf
    dec life
    cmp life, 0 ; Check if lives are zero
    jz quit
    jmp L1

equal:
      mov dx, offset equalMsg
    call writestring

    mov al, random ; Display the correct number
    call writechar

    call crlf
    call crlf

    jmp L1 ; Jump back to the loop to continue playing

greater:
    mov dx, offset greaterMsg
    call writestring
    call crlf
    call crlf
    dec life
    cmp life, 0 ; Check if lives are zero
    jz quit
    jmp L1

quit:
    mov ax, 4C00h ; Exit with code 0
    int 21h

main endp

readInput proc
    mov ah, 01h ; Function to read character from standard input
    int 21h
    sub al, 30h ; Convert ASCII to binary
    ret
readInput endp

writestring proc
    mov ah, 09h ; Function to print string
    int 21h
    ret
writestring endp

writechar proc
    mov ah, 02h ; Function to print character
    int 21h
    ret
writechar endp

crlf proc
    mov dl, 13 ; Move cursor to next line
    mov ah, 02h
    int 21h 
    mov dl, 10
    int 21h
    ret
crlf endp

end main
