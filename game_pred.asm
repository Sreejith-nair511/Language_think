section .data
    prompt db "Guess a number (1-9): ", 0
    correct_msg db "Correct! You win!", 10, 0
    wrong_msg db "Wrong! Try again.", 10, 0
    secret_number db '5'  ; The number to guess

section .bss
    user_input resb 2     ; Reserve space for user input

section .text
    global _start

_start:
    ; Print prompt
    mov eax, 4            ; sys_write
    mov ebx, 1            ; stdout
    mov ecx, prompt       ; Message
    mov edx, 23           ; Length
    int 0x80

    ; Read user input
    mov eax, 3            ; sys_read
    mov ebx, 0            ; stdin
    mov ecx, user_input   ; Store input here
    mov edx, 2            ; Read 1 character + newline
    int 0x80

    ; Compare user input with secret number
    mov al, [user_input]  ; Load first character of input
    cmp al, [secret_number]
    je correct_guess      ; If equal, jump to win message

wrong_guess:
    ; Print wrong message
    mov eax, 4
    mov ebx, 1
    mov ecx, wrong_msg
    mov edx, 19
    int 0x80
    jmp exit

correct_guess:
    ; Print correct message
    mov eax, 4
    mov ebx, 1
    mov ecx, correct_msg
    mov edx, 18
    int 0x80

exit:
    mov eax, 1    ; sys_exit
    xor ebx, ebx  ; Exit code 0
    int 0x80
