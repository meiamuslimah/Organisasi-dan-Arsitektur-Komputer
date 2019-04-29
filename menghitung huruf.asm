extern scanf, printf, fflush
 
section .data
    scan db "%s %s", 0
    prt1 db "%d", 10, 0
     
section .bss
    str1 resb 41 ;index berkurang terus menerus pas ngebaca satu-satu
    char resb 2
     
section .text
    global main
 
main :
        push char
        push str1
        push scan
        call scanf
        add esp, 12
        
        mov ebx, 0	;buat inisiasi awal kalo yang mau dicari itu 0
        mov ecx, 40	;40 itu untuk maks panjang string
        mov edi, str1	; string dipndahin ke counter edi
        mov al, [char]	; al buat nyimpen yang dicari
        
search	:
        repne scasb	;buat repeat not equal
        add ebx, 1	; kalo yang dicari itu sama, maka ebx nambah 1
        cmp ecx, 0	; dibandingin, kalo dia = 0 maka dia nyari lagi terus sampe dia nol
        ja search	
         
        sub ebx, 1
         
        push ebx
        push prt1
        call printf
        add esp, 8
        jmp exit
 
         
exit :
        push 0
        call fflush
        mov eax, 1
        mov ebx, 0
        int 0x80
