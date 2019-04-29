global main
extern printf, scanf, fflush
     
segment .data
    scan db "%f", 0
    prt db "%.2lf",10,0
    kons dd 1.8
    tam  dd 32.0
         
segment .bss
    fahren resd 1 
    celcius resd 1 
     
segment .text
     
main:
    push celcius
    push scan
    call scanf
    add esp,8
     
     
    fld dword [celcius]
    fmul dword[kons]
    fadd dword[tam]
    fstp qword[fahren]
       
print:    
    push dword [fahren+4]
    push dword [fahren]
    push prt
    call printf
    add esp,12
       
    push 0
    call fflush
    add esp,4
         
exit:
    mov eax,1
    mov ebx,0
    int 0x80
