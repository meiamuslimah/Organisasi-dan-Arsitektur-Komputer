extern scanf, printf, fflush
 
section .data
    scan db "%s", 0
    printday db "weekday", 10, 0
    printend db "weekend", 10, 0
    sun db "Sun", 10 
    sat db "Sat", 10
     
section .bss
    s1 resb 10
    s2 resb 10
     
section .text
    global main
 
main :
        push s1
        push scan
        call scanf
        add esp, 8
         
        mov esi, s1
        mov edi, sun
         
        cmpsb
        je benar
         
        mov edi, sat
        cmpsb
        je benar
         
        push printday
        call printf
        add esp, 4
        jmp exit
         
benar :
        push printend
        call printf
        add esp, 4
        jmp exit
         
exit :
        push 0
        call fflush
        mov eax, 1
        mov ebx, 0
        int 0x80
