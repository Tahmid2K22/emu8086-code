org 100h   

call input_arr
call b_sort
call print_arr
int 20h

b_sort proc near
    pushf
    push ax
    push bx
    push cx
    push si
    push di

    mov ax,size
    mov si,2     
    mul si
    mov si,0
    mov di,0
    mov dx,0

    l1:
        mov di,0
        dec ax
        dec ax
    l2:
       mov cx,arr[di]
       mov bx,arr[di+2]
       cmp cx,bx
       jng no_swap
          
          mov arr[di],bx
          mov arr[di+2],cx
       
       
       no_swap:
       inc di
       inc di
       cmp di,ax
       jb l2
               
    inc si
    cmp si,5
    jb l1
    
    pop di
    pop si
    pop cx
    pop bx
    pop ax
    popf  
    
    ret
b_sort endp 

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


input_arr proc near
    pushf
    call input_num
    mov size,dx  
    mov cx,dx
    lea bx,arr
    lop1:
       call input_num
       mov si,dx
       mov [bx],si
       inc bx
       inc bx
    loop lop1
    
       
    
    popf    
    ret
input_arr endp  

print_num proc near
    pushf 
    push cx
    mov ax,dx 
    mov cx,10  
    mov si,0
    l41:
    xor dx,dx
    div cx  
    add dx,'0'
    push dx    
    inc si
    cmp ax,0
    jne l41 
    mov cx,si
    l42:
    pop dx
    mov ah,02h
    int 21h 
    loop l42 
    mov dx,' '
    mov ah,02h
    int 21h
    pop cx
    popf  
    ret
print_num endp 


print_arr proc near
    pushf  
    push cx
        lea   di,arr 
        mov cx,size
    lop21:
       mov dx,[di]
       call print_num
       inc di
       inc di
    loop lop21 
    pop cx
    popf  
    ret
print_arr endp

ret   

size dw 1
arr dw 10 dup(0)
 


i dw 0
j dw 0

