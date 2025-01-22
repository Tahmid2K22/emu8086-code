org 100h         

mov ah,09h
lea dx,msg1
int 21h

call input_num
mov range1,dx 

call input_num
mov range2,dx  

mov ah,02h
mov dl,13
int 21h        

mov ah,02h
mov dl,10
int 21h 


        
mov cx,range1

entry:
    cmp cx,range2
    jg end
    call palindrome_check
    inc cx
    jmp entry
    
    
end: 
    
        
int 20h


palindrome_check proc near 
    pushf
    push ax
    push dx
    push bx
    push si
    
    mov ax,cx
    mov dx,0
    mov si,0
    mov di,10
    
l21:
      cmp ax,0
      je end21_loop 
      mov dx,0
      div di
      push dx
      add dl,48
      mov number1[si],dl
      inc si 
      jmp l21

end21_loop:
      mov ax,0
      mov dx,0 
      mov size,si 
      mov si,0
l22:
      cmp si,size
      je end22_loop 
      pop dx      
      inc si
      jmp l22 

end22_loop:
            
    mov ax,0 
    mov dx,0
    lea si,number1
    
l23:
    cmp [si],'$'
    je end23_loop
    
    mov bx,[si] 
    mov bh,0
    sub bx,'0'
    mul di
    add ax,bx
    inc si
     
    jmp l23
    
    
    end23_loop:
     
    cmp ax,cx
    je print
    jne skip
    
    
print: 
    
    mov ah,09h
    lea dx,number1
    int 21h 
    
    mov ah,02h
    mov dl,' '
    int 21h
    
    
    
skip:      
     
    pop si
    pop bx
    pop dx
    pop ax
    popf 
    ret  
palindrome_check endp 

input_num proc near
    pushf
    push si
    push ax
    push cx
        mov dx,0
        mov si,10
        l31:
            mov ah,01h
            int 21h
            
            cmp al,32
            je exit2
            cmp al,13
            je exit2
            sub al,48
            mov cl,al
            mov ax,dx
            mul si
            add ax,cx
            mov dx,ax
            jmp l31
            
           
    exit2:
    pop cx
    pop ax
    pop si
    popf
    ret
input_num endp

ret

range1 dw 1
range2 dw 100
size dw ? 
msg1 db 'Range : $'
msg2 db 'Output : $'

number1 db 20 dup('$')




