.386
.model flat, stdcall
option casemap :none

include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib

.data
  val1str db 20 dup(0)
  val2str db 22 dup(0)
  inMsg1 db "Digite o primeiro valor: ", 0
  inMsg2 db "Digite o segundo valor: ", 0
  strbuffer db 26 dup(0)

.code
; ponteiro para incio da string em eax
; resultado armazenado em eax
_toint proc uses ebx ecx edx esi edi  ; uses = call convention
  mov esi, eax                        ; salva ponteiro da string
  xor eax, eax                        ; zera eax com xor
  mov ecx, 10                         ; base

  next:                               ; label para loop
    xor edx, edx                      ; zera edx
    mov dl, byte ptr [esi]            ; pega um byte (char)
    inc esi                           ; move ponteiro para o próximo byte

    cmp dl, '0'                       ; menor que zero? (compare)
    jl done                           ; return
    cmp dl, '9'                       ; maior que nove?
    jg done                           ; return

    imul eax, ecx                     ; valor atual x 10

    sub dl, '0'                       ; subtrai caractere '0', transformando o caractere em decimal
    add eax, edx                      ; adciona tal valor ao eax
    jmp next                          ; próxima iteração

    done:                             ; label para término
    ret                               ; return
_toint endp

_tostr proc uses ecx edx edi        ; uses: preservar valores do registrador para que o programa nao seja impactado
; valor armazenado em eax
; ponteiro apontando para resultado em eax
  mov ecx, 10                       ; divisor
  mov edi, offset strbuffer + 14    ; ponteiro para buffer

  next:                             ; label para loop
    dec edi                         ; move ponteiro para o próximo byte
    xor edx, edx                    ; zera edx
    div ecx                         ; divide eax por 10, resto é armazenado em edx
    add dl, '0'                     ; adiciona caractere '0' ao resto da divisão, transformando o valor decimal em caractere ASCII 
    mov byte ptr [edi], dl          ; move caractere para o buffer
    cmp eax, 0                      ; eax é diferente de 0?
    jne next                        ; próxima iteração

  mov eax, edi                      ; move o ponteiro do buffer para eax
  ret                               ; return
_tostr endp

main:
  invoke StdOut, offset inMsg1
  invoke StdIn, offset val1str, 10

  invoke StdOut, offset inMsg2
  invoke StdIn, offset val2str, 12

  mov eax, offset val1str
  call _toint
  push eax

  mov eax, offset val2str
  call _toint

  pop edx
  add eax, edx

  invoke _tostr
  invoke StdOut, eax

  invoke ExitProcess, 0
end main