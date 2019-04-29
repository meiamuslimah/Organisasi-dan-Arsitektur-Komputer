global main
extern printf, fflush
 
section .data
    msg db  'Hello world!', 10, 0
     
section .text
 
main:
    push msg        ; printf(msg)
    call printf
    add esp, 4
     
    ;fflush(NULL)
    push 0
    call fflush
    add esp, 4
exit:
    mov eax, 1      ; exit(0)
    mov ebx, 0
    int 0x80
