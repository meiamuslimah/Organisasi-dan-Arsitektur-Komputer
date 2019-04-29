global main
extern scanf, fflush, printf
      
section .data
    inp     db '%d', 0 
    outp    db '%d', 10, 0
    Matriks     dd 7, 11, 10, 6,
                dd 5,  8,  9, 2,
                dd 1,  3, 12, 4 
            ;    0,  4,  8, 12
            ;   16, 20, 24, 28
            ;   32, 36, 40, 44
    nkol dd 4
                   
section .bss
    w resd 1
       
section .text
    main:
            push w ;bareis
            push inp
            call scanf
            add esp,8
             
            mov eax,[w] ;pindah nilai baris
            mov ebx, 0 ;buat nyimpen hasil darijumlahnya nanti
            mov ecx, 4 ;counter
            mul dword[nkol] ;buat ngitung indeksnya 
            add eax, ebx
            mov esi, eax
             
L1 :        mov eax, [Matriks + esi * 4] ;mengakses posisi ke-n
            add esi,1 ;jumlahin kolom berikutnya di baris yang sama
            add ebx,eax
            loop L1
            mov eax, ebx 
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
