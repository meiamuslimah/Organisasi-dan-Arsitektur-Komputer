extern printf, fflush, scanf
global main
 
         
section .data
    msg db "%d %d", 0
    print db "%d", 10, 0
         
section .bss
    a resd 1
    b resd 1
            
section .text
  
kuadrat:
      
    push    ebp                     ; save old ebp
    mov     ebp, esp                ; this new ebp (as reference to parameter and local variable)
                  
    mov     eax, [ebp+8]            ; eax = a
    mov     ebx, [ebp+12]
    add     eax, ebx            ; eax = eax * a
                  
    push    eax                     ; printf("%d\n", eax)
    push    print
    call    printf
    add     esp, 8
                  
    mov     esp, ebp                ; deallocate local variables
    pop     ebp                     ; restore old ebp
    ret
  
main:
            push b
            push a
            push msg
            call scanf
            add esp, 12
              
            push dword [a]
            push dword [b]
            call kuadrat
            add esp, 8
              
exit:           
            push 0
            call fflush
            add esp, 4
            mov eax, 1
            mov ebx, 0
            int 0x80
