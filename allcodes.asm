; pyramid
; DOSSEG
; .model SMALL
; .stack 100h 
; .data  ;variables are defined here
; .code 
; main proc    ;main proc starts
; mov bx,1          ;executable instructions
; mov cx,5
; L1:
; push cx
; mov cx,bx
; L2:
; mov dx, "*"
; mov ah,2
; int 21h
; loop L2
; ;next line feed
; mov dx,10
; mov ah,2
; int 21h
; ;carriage return
; mov dx,10
; mov ah,2 
; int 21h
; pop cx
; inc bx 
; push cx 
; pop cx 
; loop L1
; mov ah,4ch
; int 21h
; main endp 
; end main


; DOSSEG
; .model small 
; .stack 100h 
; .data 
; .code   
; main proc   
; mov bx,1 
; mov cx,5  
; l1:
; push cx 
; mov cx,bx 
; ; mov dx, 49            
; l2: 
; mov dx, 49 
; mov ah,2 
; int 21h 
; inc dx 
; loop l2 
; mov dx,10 
; mov ah,2 
; int 21h
; mov dx,13
; mov ah,2 
; int 21h
; pop cx 
; inc bx 
; push cx                  
; pop cx              
; mov ah,4ch
; int 21h         
; main endp          
; end main


; mov al,6
; mov bl,7 
; mul bl  
; AAM   
; mov ch,ah   
; mov cl,al        
; mov dl,ch  
; add dl,48   
; mov ah,2 
; int 21h 
; mov dl,cl            
; add dl,48   
; mov ah,2
; int 21h   




;program to reverse a string
; DOSSEG
; .model SMALL
; .stack 100h 
; .data  ;variables are defined here
; arr1 db 'Aliza Khan$'
; .code 
; main proc
; mov ax,@data 
; mov ds,ax           
; mov si,offset arr1 
; mov cx,10 
; l1:
; mov dx,[si]
; push dx 
; inc si    
; loop l1

; mov cx,10 
; l2:
; pop dx
; mov ah,2 
; int 21h
; loop l2
; mov ah,4ch       
; int 21h      
; main endp 
; end main





; DOSSEG
; .model SMALL
; .stack 100h 
; .data  ;variables are defined here
; .code 
; main proc
;program to swap 2 numbers
; mov ax,4               ;in stack, reg>=16 bits
; mov bx,2 
; push ax
; push bx  
; pop ax  
; pop bx 
; mov dx,ax
; add dx,48 
; mov ah,2  
; int 21h
; mov dx,bx
; add dx,48              
; mov ah,2  
; int 21h
; mov ah,4ch       
; int 21h      
; main endp 
; end main



; DOSSEG
; .model SMALL
; .stack 100h 
; .data  ;variables are defined here
; str1 db 100 dup ('$')
; .code 
; main proc
; mov ax,@data           
; mov ds,ax                  
; mov dx,offset str1    
; l1:
; mov ah,1  
; int 21h 
; cmp al,13 
; je printstring 
; mov [si],al
; inc si
; jmp l1
; printstring:
; mov dx,offset str1 
; mov ah,9 
; int 21h
; mov ah,4ch       
; int 21h      
; main endp 
; end main




;reverse a string uses an array
; DOSSEG
; .model SMALL
; .stack 100h 
; .data                      ;variables are defined here
;     arr1 db 'uok ubit$'    ;reverse a string uses an array
; .code
; main proc
;          mov  ax,@data
;          mov  ds,ax
;          mov  si, offset arr1
;          mov  cx,8
;     l1:  
;          mov  dx,[si]
;          push dx
;          inc  si
;          loop l1
;         ;  int 21h 
;          mov  cx,8
;     l2:  
;          pop  dx
;          mov  ah,2
;          int  21h
;          loop l2
;          mov  ah,4ch
;          int  21h
; main endp
; end main




; DOSSEG 
; .MODEL small 
; .STACK 100h   
; .DATA 
; str1 db 200 dup ('$')
; .CODE   
; MAIN PROC 
;     mov ax,@data 
;     mov ds,ax                              
;     mov dx,offset str1
;     l1:   
;     mov ah,1  
;     int 21h          
;     cmp al,13  
;     je programend 
;     mov [si],al
;     inc si 
;     jmp l1
;     programend:
;     mov dx,offset str1  
;     mov ah,9   
;     int 21h      
;     mov ah,4ch 
;     int 21h             
;     main endp 
;     end main





; DOSSEG 
; .MODEL small 
; .STACK 100h   
; .DATA 
; ARR1 db 'a','l','i','z','a'
; .CODE 
; MAIN PROC  
;     MOV AX,@DATA 
;     MOV DS,AX  
;     MOV SI,OFFSET ARR1
;     MOV CX,5
;     L1:    
;     MOV DX,[SI]
;     MOV AH,2  
;     INT 21H 
;     INC SI    
;     LOOP L1   
;     mov ah,4ch
;     INT 21H 
;     MAIN ENDP 
;     END MAIN




; DOSSEG  
; .MODEL SMALL   
; .STACK 100H              
; .DATA 
; MSG1 DB "NOT EQUAL$"          
; MSG2 DB "EQUAL$"          
; .CODE 
; MAIN PROC
; MOV AX,@DATA
; MOV DS,AX
; MOV BL,'3'
; MOV AH,1            
; INT 21H       
; CMP AL,BL           
; JE programend 
; MOV DX,OFFSET MSG1  
; MOV AH,9       
; INT 21H
; MOV AH,4CH   
; INT 21H 
; programend: 
; MOV DX,OFFSET MSG2
; MOV AH,9       
; INT 21H 
; MOV AH,4CH   
; INT 21H 
; MAIN ENDP 
; END MAIN




;A - Z 
; DOSSEG  
; .MODEL SMALL   
; .STACK 100H              
; .DATA
;     MSG1 DB "NOT EQUAL$"
;     MSG2 DB "EQUAL$"
; .CODE
; MAIN PROC
;     MOV CX, 26
;     MOV DX, 65
;     L1:
;     MOV AH,2 
;     INT 21H 
;     INC DX
;     LOOP L1
;     MOV AH,4CH
;     INT 21H
; MAIN ENDP
; END MAIN




; DOSSEG  
; .MODEL SMALL   
; .STACK 100H              
; .DATA
; .CODE
; MAIN PROC
;     MOV AH,1 
;     INT 21H 
;     MOV DL,AL
;     add DL,32 
;     MOV AH,2 
;     INT 21H
;     MOV AH,4CH
;     INT 21H
; MAIN ENDP
; END MAIN




; dosseg 
; .model small 
; .stack 100h  
; .data 
; .code  
; main proc 
; mov ah,1 
; int 21h 
; mov dl,al 
; mov ah,1 
; int 21h  
; add dl,al
; sub dl,48 
; mov ah,2 
; int 21h
;     MOV AH,4CH
;     INT 21H
; MAIN ENDP
; END MAIN




;even odd code
; dosseg 
; .model small 
; .stack 100h  
; .data
;     msgeven db "even number$"
;     msgodd  db "odd number$"
; .code
; main proc
;             mov ax,@data
;             mov ds,ax
;             mov ah,1                 ; dividend: al will take from user
;             int 21h
;             mov bl,2                 ; divisor 2
;             div bl
;             cmp ah,0                 ;
;             je  evenmsg

;             mov dx,offset msgodd
;             mov ah,9
;             int 21h
;             MOV AH,4CH
;             INT 21H
;     evenmsg:
;             mov dx,offset msgeven
;             mov ah,9
;             int 21h
;             MOV AH,4CH
;             INT 21H
; MAIN ENDP
; END MAIN
