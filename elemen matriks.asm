global main
extern scanf, fflush, printf
      
section .data
    inp     db '%d %d', 0 
    outp    db '%d', 10, 0
    Matriks     dd 7, 11, 10, 6,
                dd 5,  8,  9, 2,
                dd 1,  3, 12, 4
                 
            ;    0,  4,  8, 12
            ;   16, 20, 24, 28
            ;   32, 36, 40, 44
                   
section .bss
    w resd 1
    x resd 1
       
section .text
    main:
            push w ;bareis
            push x ;kolom
            push inp
            call scanf
            add esp,12
             
            mov ebx,[x] ;pindah nilai kolom
            mov ecx,[w] ;pindah nilai baris
            mov eax,4 ;jumlah kolom matriks, matriks disini ukyurannya 4x4
            mul ebx  ; baris * nkolom
            add eax, ecx ;(baris*nkolom) + kolom = index
     
            mov esi, eax ;pindah hasil pengoperasian sebelumnya ke esi
            mov eax, [Matriks + esi * 4] ;mengakses posisi ke-n
                
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
