segment .data
    msg     db 'Hello '
    psn 
     
segment .text
global main
main:
    ; read (stdin, msg, len)
    mov eax, 3      ; read
    mov ebx, 0      ; stdin
    mov ecx, psn
    mov edx, 10     ; len
    int 0x80
 
 
    ; write (stdout, msg, len)
    mov eax, 4      ; write
    mov ebx, 1      ; stdout
    mov ecx, msg    
    mov edx, 10     ; len
    int 0x80
     
 
    ; exit(0)
    mov eax, 1      ; exit
    mov ebx, 0
    int 0x80
    int 0x80
