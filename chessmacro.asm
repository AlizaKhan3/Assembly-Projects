blackSquare macro row,column,erow,ecol
mov ah,6h      ;to print shape
mov al,4     ;length
mov bh, 00000000b
mov ch,row    ;top row
mov cl,column      ;left col
mov dh,erow     ;bottom row  niche se length kam hogayi
mov dl,ecol  ;right col widht barhti hai col ki
int 10h 
endm
.model small
.stack 100h
.data 
.code
main proc

mov ah,6h           ;to print shape
mov al,8            ;length (no. of lines)
mov bh, 01111000b
mov ch,0            ;top row
mov cl,0            ;left col
mov dh,24           ;bottom row
mov dl,24           ;right col (width right se barhti hai)
int 10h             ;interrupt command in graphics

blackSquare 17,0,20,24
blackSquare 6,12,24,18
blackSquare 17,0,20,12
blackSquare 10,0,24,6   ;2nd point niche se gap hai 0 rakha hai chipak jaye
 

mov ah,4ch
int 21h
main ENDP


end main
