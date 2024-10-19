; Interpret as 32 bits code
[bits 32]

%include "../include/io.mac"

section .data
formats db "str = %s", 10, 0
formatc db "char = %c", 10, 0

section .text
extern printf
; int check_parantheses(char *str)
global check_parantheses


check_parantheses:

    push ebp 
    mov ebp, esp
    pusha
    ; sa-nceapa concursul
    mov ebx, [ebp + 8]

    mov edi, esp

    xor ecx, ecx
    xor edx, edx

    loop:

        mov dl, [ebx + ecx]
        inc ecx
        cmp dl, 0
        je out

        cmp dl, '('
        je ps

        cmp dl, '['
        je ps

        cmp dl, '{'
        je ps

        jmp pl

        ps:
            push edx
            jmp loop

        pl:
            pop esi
            sub edx, esi
            cmp edx, 3
            jb loop
            zero:
            mov esp, edi
            popa
            mov eax, 1
            leave 
            ret

    out:
        cmp edi, esp
        jne zero
        popa
        mov eax, 0
        leave
        ret


    
    popa
    mov eax, 0
    leave
    ret
