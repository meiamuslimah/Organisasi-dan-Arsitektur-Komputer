global main
extern scanf, fflush, printf
    
section .data
    inp     db '%d %d %d', 0 ; scan sebanyak 3
    outp    db '%d', 10, 0
     
         
section .bss
    w resd 4
    x resd 4
    y resd 4
     
        
    
section .text
    main:
            push y  
            push x 
            push w  
            push inp
            call scanf  ; panggil fungsi scan
            add esp, 16
             
            mov eax, [w]   
            cmp eax, [x]
            jg a1
            jmp fail
             
a1  :       cmp eax, [y]
            jg a2
            jbe fail
 
a2  :       mov eax, 3
            jmp print
             
fail:       mov eax, 1
            jmp print           
             
                
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
            mov eax, 1  ; 1
