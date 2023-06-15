.model small
.stack 100h
.data

A db ?
B db ?
C db ?
D db 10,13,'Odd$'
E db 10,13,'Even$'

.code
main proc
mov ax, @data
mov ds, ax

mov ah,1
int 21h
mov A,al
sub A,48

mov B,1
mov C,0

lopp:
mov bl,B
cmp bl,A
je odd
mov bl,C
cmp bl,A
je even

sub A,2
jmp lopp

odd:
mov ah,9
lea dx,D
int 21h
jmp exit

even:
mov ah,9
lea dx,E
int 21h
jmp exit

exit:
mov ah, 4ch
int 21h
main endp
end main