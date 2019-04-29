global main
extern scanf, fflush, printf
    
section .data
    msg    db '%d %d %d %d', 0 ; scan sebanyak 4
    arg1    db '%d', 0
     a       dd 4 
    mutua  db 'A', 10, 0
    mutub  db 'B', 10, 0
    mutuc  db 'C', 10, 0
    mutud  db 'D', 10, 0
    mutue  db 'E', 10, 0
  
         
section .bss
    w resd 4
    x resd 4
    y resd 4
    z resd 4
        
    
section .text
    main:
            push w  ; untuk di eksekusi
            push x
            push y
            push z
            push msg
            call scanf  ; panggil fungsi scan
            add esp, 20 
                
            mov eax, [w]
            add eax, [x] ; fungsi pertambahan eax dan [x] disimpan di eax
            add eax, [y]
            add eax, [z]
                
            cdq
            div dword [a] 
            cmp eax, 80
            jae cetakA
            cmp eax, 40
            jb cetakE
            cmp eax, 80
            jb nilB
               
cetakA:     push mutua
            call printf
            add esp, 4
            jmp end
               
nilB:       cmp eax, 60
            jae cetakB
            jb nilC
               
cetakB:     push mutub
            call printf
            add esp, 4
            jmp end
               
nilC:       cmp eax, 50
            jae cetakC
            jb nilD
               
cetakC:     push mutuc
            call printf
            add esp, 4
            jmp end
               
nilD:       cmp eax, 40
            jae cetakD
               
cetakD:     push mutud
            call printf
            add esp, 4
            jmp end
               
cetakE:     push mutue
            call printf
            add esp, 4
            jmp end
               
end:
            push 0
            call fflush  
            add esp,4
            ; exit(0)
            mov eax, 1  
            int 0x80
