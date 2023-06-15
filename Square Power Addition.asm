.model small
.stack 100h
.data
A db ?
B dw ?
 
.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,1
    int 21h
    mov bl,al
    sub bl,48

    ;mov dx,bx
    ;mov ah,2
    ;int 21h
    
    mov cx,bx
    mov bl,1
    lopp:
    mov al,bl
    mul bl
    add A, al
    inc bl
    
    loop lopp
    
    mov dl,A
    mov ah,2
    int 21h
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main