global main
extern printf, fflush, scanf
   
section .data
    msg db  '%d %d %d %d', 0
    nilai db '%d', 10, 0
    a db 4
       
section .bss
    w resd 1
    x resd 1
    y resd 1
    z resd 1
       
section .text
main:
    push w
    push x
    push y
    push z  
    push msg
    call scanf
    add esp, 20
      
    mov eax, [w] 
    add eax, [x]
    add eax, [y]
    add eax, [z]
    cdq
    div dword [a]
       
    push eax
    push nilai
    call printf
    add esp, 8
       
    push 0
    call fflush
    add esp, 4
       
exit:
    mov eax, 1      ; exit(0)
    mov ebx, 0
    int 0x80
