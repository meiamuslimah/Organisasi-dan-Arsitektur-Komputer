global main
extern scanf, fflush, printf
     
section .data
    inp     db '%d', 0 ; scan sebanyak 1
    outp    db '%d', 10, 0
     a      dd 5
       
section .bss
    w resd 4
      
section .text
    main:
            push w  ; untuk di eksekusi
            push inp
            call scanf  ; panggil fungsi scan
            add esp, 8
              
             
            mov ecx, [w]   
            mov ebx, 2
            mov eax, 1
              
 L1 :       mul ebx
            LOOP L1 
                 
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
            mov eax, 1  ; 1 output
            int 0x80
