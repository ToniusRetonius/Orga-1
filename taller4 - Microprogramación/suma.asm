; guardo el n en R0 
; suma = 0
MOV R1, 0x00 
; i = 1
MOV R2, 0x01 
CMP R0, 0x00
JZ fin

ciclo:
ADD R1, R2
ADD R2, 0x01
CMP R2, R0
JN ciclo

fin:
JMP fin

; psudocódigo
; sumador_n (n : nat)
; suma = 0
; i = 1 
; while (i <= n) do 
;     suma = suma + i
;     i ++ 
; endwhile
; ret suma