dosseg
.model small
.stack 100h
.data 
msgEVEN db 'EVEN$'
msgODD db 'ODD$'
.code
main proc

mov ah,6h      ;to print shape
mov al,8       ;length
mov bh, 01111000b
mov ch,0       ;top row
mov cl,0       ;left col
mov dh,24      ;bottom row
mov dl,24      ;right col  (complete rectangle widht)
int 10h        ;interrupt command in graphics

;row 1 boxes------------------
;row 1 black box 1
mov ah,6h      ;to print shape
mov al,4       ;length
mov bh, 00000000b   
mov ch,17      ;top row  isko change nh krna
mov cl,0       ;left col  
mov dh,20      ;bottom row  niche se length kam hogayi
mov dl,24      ;right col widht barhti hai col ki
int 10h        ;interrupt command in graphics


;row 1 black box2
mov ah,6h      ;to print shape
mov al,4       ;length
mov bh, 00000000b   ;black
mov ch,17      ;top row  isko change nh krna
mov cl,0       ;left col  
mov dh,20      ;bottom row  niche se length kam hogayi
mov dl,12      ;right col widht barhti hai col ki
int 10h        ;interrupt command in graphics

;row1---------------------


;row 2 boxes-------------------------------  
;first black box row
mov ah,6h      ;to print shape
mov al,4       ;length
mov bh, 00000000b  ;black color
mov ch,10      ;top row
mov cl,0       ;left col
mov dh,26      ;bottom row  niche se length kam hogayi
mov dl,6       ;right col widht barhti hai col ki
int 10h        ;interrupt command in graphics
;second black box row
mov ah,6h      ;to print shape
mov al,4       ;length
mov bh, 00000000b  ;black color
mov ch,6      ;top row
mov cl,12      ;left col
mov dh,26      ;bottom row  niche se length kam hogayi
mov dl,18      ;right col widht barhti hai col ki
int 10h        ;interrupt command in graphics
           

mov ah,4ch
int 21h
main ENDP
end main











