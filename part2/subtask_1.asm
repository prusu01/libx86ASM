; subtask 1 - qsort

section .text
    global quick_sort
 
    ;; no extern functions allowed

swap:
    enter 0, 0
    pusha

    mov edi, [ebp + 8]
    mov esi, dword [edi]; t = *a
    mov edx, [ebp + 12]
    mov eax, dword [edx]
    mov [edi], eax ;*a = *b
    mov [edx], esi ;*b = t

    popa
    leave
    ret

; int partition(int arr[], int low, int high) {  
;     int i = (low - 1);  
  
;     for (int j = low; j < high; j++) {  
;         if (arr[j] < arr[high]) {  
;             i++;  
;             swap(&arr[i], &arr[j]);  
;         }  
;     }  
;     swap(&arr[i + 1], &arr[high]);  
;     return (i + 1);  
; } 

partition:
    push ebp
    mov ebp, esp
    sub  esp, 24
    mov  eax, dword  [ebp+12]
    dec  eax
    mov   dword  [ebp-12], eax
    mov  eax, dword  [ebp+12]
    mov   dword  [ebp-16], eax

    loop4:
        mov  eax, dword  [ebp-16]
        cmp  eax, dword [ebp+16]
        jge  f2

        mov  eax, dword  [ebp-16]
        lea edx, [eax*4]
        mov eax, dword  [ebp+8]
        add eax, edx
        mov edx, dword  [eax]
        mov eax, dword [ebp+16]
        lea ecx, [eax*4]
        mov  eax, dword  [ebp+8]
        add eax, ecx
        mov eax, dword  [eax]
        cmp edx, eax
        jge loop3

        inc  dword  [ebp-12]
        mov  eax, dword  [ebp-16]
        lea edx, [eax*4]
        mov  eax, dword  [ebp+8]
        add  edx, eax
        mov eax, dword  [ebp-12]
        lea ecx, [eax*4]
        mov eax, dword  [ebp+8]
        add eax, ecx
        sub esp, 8
        push edx
        push eax
        call swap
        add esp, 16



    loop3:
        inc dword [ebp-16]
        jmp loop4


    f2:
        mov eax, dword [ebp+16]
        lea edx, [eax*4]
        mov eax, dword  [ebp+8]
        add edx, eax
        mov eax, dword [ebp-12]
        inc eax

        lea ecx, [eax*4]
        mov eax, dword  [ebp+8]
        add eax, ecx
        
        push edx
        push eax
        call swap
        add esp, 8

        mov eax, dword [ebp-12]
        inc eax
        
    leave
    ret

; void quick_sort(int arr[], int low, int high) {  
;     if (low < high) {  
;         int pi = partition(arr, low, high);  
;         quick_sort(arr, low, pi - 1);  
;         quick_sort(arr, pi + 1, high);  
;     }  
; }  

quick_sort:
    push ebp
    mov ebp, esp
    sub esp, 24
    mov eax, dword  [ebp+12]
    cmp eax, dword  [ebp+16]
    jge f3

    
    push dword  [ebp+16]
    push dword  [ebp+12]
    push dword  [ebp+8]
    call partition
    add esp, 12

    mov dword  [ebp-12], eax
    dec eax

    
    push eax
    push dword  [ebp+12]
    push dword  [ebp+8]
    call quick_sort
    add esp, 12

    mov eax, dword  [ebp-12]
    inc eax
  
    push dword  [ebp+16]
    push eax
    push dword [ebp+8]
    call quick_sort
    add esp, 12

f3:

        leave
        ret

; void swap(int* a, int* b) {  
;     int t = *a;  
;     *a = *b;  
;     *b = t;  
; }  
; 


