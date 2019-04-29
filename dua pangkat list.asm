global main
extern printf, fflush, scanf
        
section .data
    scn db "%d", 0
    prt db "%d", 10, 0
        
section .bss
    a resd 1
       
section .text
    global main
            
main:
  
apa:         ;scan a
    push a
    push scn
    call scanf
    add esp, 8
      
    mov ecx, [a]   ;nilai ecx adalah input, eax=2, ebx=2
    mov eax, 2      ;kalau 0 exit kalau ga ke kuadrat   
    mov ebx, 2
    cmp ecx, 0   
    je exit
    jne kuadrat
      
kuadrat:       
    cmp ecx, 1    ;berhenti kalo udah 1 karena dua pangkat tiga = 2x2x2, jadi cuma dua kali mul
    JA isi
    JBE cetak
       
isi:          ;kalo belom satu, dua kali dua   
    mul ebx
    dec ecx       ;nilai ecx nya di kurangin 
    JMP kuadrat     
      
cetak:       ;print hasilnya, scanf lagi
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
    int 0x8
    
