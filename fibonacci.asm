global main
extern scanf, fflush, printf
      
section .data
    inp     db '%d', 0 
    outp    db '%d', 10, 0
    
section .bss
    w resd 1
       
section .text
    main:
            push w ;bareis
            push inp
            call scanf
            add esp,8
             
            mov ebx, 1 
            mov edx, 0 
            mov ecx, [w] 
            loop fibonaci
             
fibonaci :  mov eax, 0
            add eax, ebx
            add eax, edx
            mov edx, ebx
            mov ebx, eax
            loop fibonaci
     
print :
            push eax
            push outp
            call printf
            add esp, 8
                 
end:
            push 0
            call fflush  
            add esp,4
            ; exit(0)
            mov eax, 1  
            mov ebx, 0
            int 0x80
