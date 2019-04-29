global main
extern printf, fflush, scanf ;MANGGIL FUNGSI CETAK, SCAN, SAMA MENGNOLKAN
  
section .data
    msg db  '%d %d', 0  ;BUAT INPUTAN, KALO INPUTNYA 1 %D NYA 1 JUGA
    nilai db '%d', 10, 0;UNTUK OUTPUTNYA, 10 ITU UNTUK NEWLINE 
      
section .bss
    x resd 4    ;DECLARE VARIABEL X
    y resd 4    ;DECLARE VARIABEL Y
      
section .text
main:           ;FUNGSI MAIN
    push x  ;SAMA KAYAK scanf("%d %d", &X, &Y)
    push y  ; IDEM
    push msg; %d %d
    call scanf  ; PANGGIL SCANF
    add esp, 12 ;4 dikali dengan banyaknya push(ada 3) ;reason dikali 4? karena untuk bytes
 
      
    mov eax, [x]    ;eax = nilai variabel X
    mov ebx, [y]    ;eax = nilai variabel Y
    add eax, ebx    ;eax=eax+ebx
 
 ;output
 ;printf("%d", eax)     
    push eax
    push nilai
    call printf
    add esp, 8  ;4 dikali dengan banyaknya push(ada 2) ;reason dikali 4? karena untuk bytes
      
    push 0
    call fflush
    add esp, 4
      
exit:
    mov eax, 1      ; exit(0)
    mov ebx, 0
    int 0x80
