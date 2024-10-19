section .text
    global binary_search

binary_search:
    enter 0, 0
    push ebx
    push ecx
    push edx
    push esi
    push edi
    
    ; Arguments are:
    ; ecx = buff
    ; edx = needle
    ; [ebp+8] = start
    ; [ebp+12] = end

    ; Load start and end
    mov eax, [ebp + 8]    ; eax = start
    mov ebx, [ebp + 12]   ; ebx = end

    cmp eax, ebx
    jg not_found

    ; mid = (start + end) / 2
    add eax, ebx
    shr eax, 1            ; eax = mid

    mov esi, ecx          ; esi = buff
    mov edi, [esi + eax*4] ; edi = buff[mid]

    cmp edx, edi
    je found             ; if needle == buff[mid]
    jl search_left       ; if needle < buff[mid]

    ; binary_search(buff, needle, mid + 1, end)
    push ebx              ; end
    inc eax               ; mid + 1
    push eax              ; start = mid + 1
    call binary_search
    add esp, 8          
    jmp found

search_left:
    ; binary_search(buff, needle, start, mid - 1)
    dec eax               ; mid - 1
    push eax              ; end = mid - 1
    push dword [ebp + 8]        ; start
    call binary_search
    add esp, 8    
    jmp found       

not_found:
    mov eax, -1           ; return -1
    jmp found

found:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    leave
    ret
