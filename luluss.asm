global main
extern printf, scanf, fflush
   
section .data
    msg db '%d %d %d %d', 0
    prt db '%d', 10, 0
    a   dd  4
    lulus db "lulus",10,0
    tidak db "tidak",10,0
       
section .bss
    w resd 4
    x resd 4
    y resd 4
    z resd 4
       
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
        mov ebx, [x]
        mov ecx, [y]
        mov edx, [z]
        add eax, ebx
        add eax, ecx
        add eax, edx
         
        mov edx, 0
          
        cdq
        div dword [a]
          
        mov ebx, 40
        cmp eax, ebx
        JAE M
        JB N
     
M :     push lulus
        call printf
        add esp, 4
        JMP exit
       
N :     push tidak
        call printf
        add esp, 4
   
exit:
        push 0
        call fflush
        add esp, 4
        mov eax, 1      ; exit(0)
        mov ebx, 0
