extern printf, scanf, fflush
   
section .data
inp db "%d", 0
prtpake db "%d", 10,0 ;untuk print yang pakek new line
prtgapake db "%d ", 0 ;untuk print yang pga akek new line
   
 M:
    dd 7,11,10,6
    dd 5, 8, 9, 12
    dd 11, 13, 12, 15
       
    ; 0 4 8 12
    ; 16 20 24 28
    ; 32 36 40 44
  n dd 4  
      
section .bss
w resd 4
   
section .text
global main
main:
    push w
    push inp
    call scanf
    add esp, 8
    mov esi,0
  
apa:
    CMP esi, 44
    ja exit
  
dikali:
    mov eax, [M+esi]
    mul dword[w]
  
    cmp esi,12
    je print
    cmp esi,28
    je print
    cmp esi, 44
    je print
  
    push eax
    push prtgapake
    call printf
    add esp, 8
  
    push 0
    call fflush
    add esp,4
  
    add esi,4
    jmp apa
  
print:
    push eax
    push prtpake
    call printf
    add esp, 8
  
    push 0
    call fflush
    add esp,4
     
    add esi,4
    jmp apa   
  
exit:
    mov eax,1
    mov ebx,0
    int 80H
           
    
