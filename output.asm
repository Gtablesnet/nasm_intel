section .bss
;Program Input 
    buffer_var resb 1

    ;declearing datas and constants
section .data


    char db 'Enter a character: '
    char_len equ $ - char

    newline db 0xA
    newline_len equ $ - newline

    char_msg db 'Character entered: '
    char_msg_len equ $ - char_msg

    ;where exectution starts
section .text

    global _start
_start:
    ;write enter char
    mov rax, 1          ;sys write
    mov rdi, 1          ;file descriptor
    mov rsi, char       ;pointer to char
    mov rdx, char_len   ;length of char
    syscall

   ; Read input
    mov rax, 0         ; syscall: read
    mov rdi, 0         ; file descriptor: stdin
    mov rsi, buffer_var ; pointer to buffer
    mov rdx, 1        ; number of bytes to read
    syscall
    

    ;print newline
    mov rax, 1      ;syscall write
    mov rdi, 1      ;file descriptor
    mov rsi, newline    ;pointer to newline
    mov rdx, newline_len    ;length of newline
    syscall
    
    ;print output message
    mov rax, 1      ;syscall write
    mov rdi, 1      ;file descriptor stdout
    mov rsi, char_msg    ;pointer to msg
    mov rdx, char_msg_len;length of msg
    syscall


    ;print character
    mov rax, 1  ;sys write
    mov rdi, 1  ;file descriptor stdout
    mov rsi, buffer_var  ;pointer to buffer_var
    mov rdx, 1;  ;length of buffer_var
    syscall

    ;print newline
    mov rax, 1      ;syscall write
    mov rdi, 1      ;file descriptor
    mov rsi, newline    ;pointer to newline
    mov rdx, newline_len    ;length of newline
    syscall

    ;The operating system will reclaim all memory allocated to the process including buffer
   ; Exit
    mov rax, 60        ; syscall: exit
    xor rdi, rdi       ; status 0
    syscall
