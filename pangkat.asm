global main
extern printf, fflush, scanf
        
section .data
    scn db "%d", 0
    prt db "%d", 10, 0
        
section .bss
    a resd 1
    b resd 1
       
section .text
    global main
            
main:
  
apa:
    push a
    push scn
    call scanf
    add esp, 8
      
    mov eax, [a]
    cmp eax, 0
    je exit
      
      
    mov eax, [a]
    mov ebx, [a]
    push b
    push scn
    call scanf
    add esp, 8
    mov ecx, [b]
      
kuadrat: 
    cmp ecx, 0
    JA isi
    JBE cetak
       
isi:
    mul ebx
    dec ecx
    JMP kuadrat
      
cetak:       
    push eax
    push prt
    call printf
    add esp, 8
    jmp apa
      
exit:           
    push 0
    call fflush
    add esp, 4
    mov eax, 1
    mov ebx, 0
    int 0x80
