org 100h

call input_arr
call arr_prime 
mov dx,cx
call print_num
int 20h  

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

is_prime proc near
    pushf
    push di
    push ax
    mov ax,2 
    mov si,1
    mov di,2
  l3: 
    mov ax,di
    mul ax
    cmp ax,n
    jg l1
    mov ax,n
    div di
    cmp dx,0
    je l2
    inc di
    jmp l3
  l2:
    mov si,0 
  l1:      
   pop ax
    pop di
    popf
    ret
    
is_prime endp

arr_prime proc near
    pushf
    mov di,size
    add di,size 
    mov size,di
    mov di,-2
    mov cx,0
    ll1:
        inc di
        inc di 
        mov bx,arr[di]
        mov n,bx
        call is_prime
        cmp si,1
        jne ll2
            add cx,arr[di]
        ll2:
        
        cmp di,size
        jne ll1 
        
    popf
    ret
arr_prime endp

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




ret
n dw 19 
size dw 5
arr dw 10 dup(?) 
sum dw 0



