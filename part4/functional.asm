; Interpret as 64 bits code
[bits 64]

; nu uitati sa scrieti in feedback ca voiati
; assembly pe 64 de biti

section .text
global map
global reduce
;void map(int64_t *destination_array, int64_t *source_array, int64_t array_size, int64_t(*f)(int64_t));

map:
    push rbp
    mov rbp, rsp
    push rbx        
    push rax
    push rsi
    push rdi

    ; rdi = destination_array
    ; rsi = source_array
    ; rdx = array_size
    ; rcx = function pointer (f)

    xor rbx, rbx    
loop_start:
    cmp rbx, rdx    
    jge loop_end 

    mov rax, [rsi + rbx * 8] ;source_array[i]

    ; Call the function pointer with this element
    push rdi
    mov rdi, rax            
    call rcx
    pop rdi
    mov [rdi + rbx * 8], rax 
    inc rbx                
    jmp loop_start        

loop_end:
    pop rdi
    pop rsi
    pop rax
    pop rbx
    leave
    ret

; int reduce(int *dst, int *src, int n, int acc_init, int(*f)(int, int));
; int f(int acc, int curr_elem);
reduce:
     ; Setup the function frame
    push rbp
    mov rbp, rsp

    push rdi          
    push rsi
    push rdx
    push rcx
    push r8
    push r9          

    here:
    mov rax, rcx       
    ; rdi = dst
    ; rsi = source_array
    ; rdx = array_size
    ; rcx = acc init
    ; r8 = pointer to the reduce function

    xor rcx, rcx       
reduce_loop:
    cmp rcx, rdx       
    jge reduce_end      ; If rcx >= rdx, jump to end

 

    push rdi
    push rsi
    push rdx

    mov rdi, rax       
    mov rsi, [rsi + rcx*8]  
    call r8         
    
    pop rdx
    pop rsi
    pop rdi
    inc rcx
    jmp reduce_loop     

reduce_end:
    pop r9
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    leave
    ret