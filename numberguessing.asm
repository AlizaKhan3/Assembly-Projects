dosseg
.model small     ;define the model of the programe to small
.stack 100h      ;specified the storage of stack to 100h

.data
    ;variables are defined here
	msg db "( You have only 3 lifes to guess the number )"
	mainMsg db "Enter a number b/w 0 and 10: "
	lessMsg db  "Oh! The number is less then your guess"
	equalMsg db "HURRAYY! Your guess is correct the number is: "
	greaterMsg db "Oh! The number is greater then your guess"

	random db ?
	life db 0

.code
main proc
	; call 

	mov ax, 10        ;Extended to 32bits register

	; call RandomRange
	mov random, al

	; call writedec

	call crlf

	mov dx, offset msg
	call writestring

	call crlf
	call crlf

	L1:
		inc life

		mov dx, offset mainMsg
		call writestring

		; call readdec
		call crlf

		cmp al, random
		jl less
		je equal
		jg greater

	Loop L1

	less:
		mov dx, offset greaterMsg
		call writestring

		call crlf
		call crlf
		call crlf

		; mov eax, life

		cmp ax, 3
		je quit
		jl L1

	equal:
		mov dx, offset equalMsg
		call writestring

		mov al, random
		; call writedec

		call crlf
		call crlf

		jmp quit

	greater:
		mov dx, offset lessMsg
        call writestring
		call crlf
		call crlf
		call crlf

		mov al, life

		cmp ax, 3
		je quit
		jl L1

	quit:
		
	
; exit
main endp

writestring proc       ;Procedure of writestring 
mov ah,9
int 21h
ret
writestring endp

crlf proc              ;Procedure of crlf
mov ax,13
mov ah,2
int 21h 
mov ax,10
mov ah,2
int 21h
ret
crlf endp

end main