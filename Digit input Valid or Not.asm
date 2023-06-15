.model small
.stack 100h
.data

A db ?
B db 'Valid$'
C db 'Invalid$'

.code
main proc
mov ax, @data
mov ds, ax



mov ah, 1
int 21h
mov bl, al
mov A, al
sub bl, 48

mov ah, 2
mov dl, 10
int 21h
mov dl, 13
int 21h

mov dl, A
int 21h

mov dl, 10
int 21h
mov dl, 13
int 21h



mov al, 0
mov cx, 10
lopp:
cmp al, bl
je validd
inc al
loop lopp


jmp invalidd



validd:
mov ah, 9
lea dx, B
int 21h
jmp exit

invalidd:
mov ah, 9
lea dx, C
int 21h
jmp exit  


exit:
mov ah, 4ch
int 21h
main endp
end main