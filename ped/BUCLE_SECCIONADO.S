;
; T�tulo:		BUCLE_ESCALAR.S
; Tarea:		Prueba de Evaluaci�n a Distancia - apartado a) 
; Asignatura:	Ingenier�a de Computadores II
; Curso:		2020-21
; Alumno:		Sergio Flor Garc�a
; E-mail:		sflor5@alumno.uned.es
;

; Asignaci�n de posiciones de memoria a los vectores 'X' e 'Y' y el escalar 'a':
           .data 0x1000
		   
X:         .double 0, 1, 2, 3, 4, 5, 6, 7		 
           .double 8, 9, 10, 11, 12, 13, 14, 15
           .double 16, 17, 18, 19, 20, 21, 22, 23
           .double 24, 25, 26, 27, 28, 29, 30, 31
           .double 32, 33, 34, 35, 36, 37, 38, 39
		   .double 40, 41, 42, 43, 44, 45, 46, 47
		   .double 48, 49, 50, 51, 52, 53, 54, 55, 
		   .double 56, 57, 58, 59, 60, 61, 62, 63
		   .double 64, 65, 66, 67, 68, 69, 70, 71
		   .double 72, 73, 74, 75, 76, 77, 78, 79
		   .double 80, 81, 82, 83, 84, 85, 86, 87
		   .double 88, 89, 90, 91, 92, 93, 94, 95
		   .double 96, 97, 98, 99, 100, 101, 102, 103
		   .double 104, 105, 106, 107, 108, 109, 110, 111
		   .double 112, 113, 114, 115, 116, 117, 118, 119
		   .double 120, 121, 122, 123, 124, 125, 126, 127
		   .double 128, 129, 130
		   

Y:         .double 0, 1, 2, 3, 4, 5, 6, 7		   
           .double 8, 9, 10, 11, 12, 13, 14, 15
           .double 16, 17, 18, 19, 20, 21, 22, 23
           .double 24, 25, 26, 27, 28, 29, 30, 31
           .double 32, 33, 34, 35, 36, 37, 38, 39
		   .double 40, 41, 42, 43, 44, 45, 46, 47
		   .double 48, 49, 50, 51, 52, 53, 54, 55, 
		   .double 56, 57, 58, 59, 60, 61, 62, 63
		   .double 64, 65, 66, 67, 68, 69, 70, 71
		   .double 72, 73, 74, 75, 76, 77, 78, 79
		   .double 80, 81, 82, 83, 84, 85, 86, 87
		   .double 88, 89, 90, 91, 92, 93, 94, 95
		   .double 96, 97, 98, 99, 100, 101, 102, 103
		   .double 104, 105, 106, 107, 108, 109, 110, 111
		   .double 112, 113, 114, 115, 116, 117, 118, 119
		   .double 120, 121, 122, 123, 124, 125, 126, 127
		   .double 128, 129, 130

a:         .double 2.0    

           .text
main:      ADDI  R1,R0,0x1000       ; Carga la direcci�n del primer elemento de X en R1.
           ADDI  R2,R0,0x1418       ; Carga la direcci�n del primer elemento de Y en R2.
           LD    F0,0x1830(R0)      ; Carga la direcci�n del escalar en F0.
           ADDI  R4,R2,0            ; C�lculo y carga en R4 del fin del vector X.
           ADDI  R5,R0,2            ; Resto del desenrrollamiento, en n�mero de elementos(n mod 3).
resto:     LD    F2,0(R1)           ; Carga X[i].
           MULTD F4,F2,F0           ; Multiplica a*X[i].
           LD    F6,0(R2)           ; Carga Y[i].
           ADDD  F6,F4,F6           ; Suma a*X[i]+Y[i].
           SD    0(R2),F6           ; Almacena Y[i].
           ADDI  R1,R1,8            ; Incrementa �ndice X.
           ADDI  R2,R2,8            ; Incrementa �ndice Y.
           SUBI  R5,R5,1            ; Comprueba si el �ndice del vector X ha llegado al final.
           BNEZ  R5,resto           ; Comprueba la condici�n de final del bucle.   
bucle:     LD    F2,0(R1)           ; Carga X[i].
           MULTD F4,F2,F0           ; Multiplica a*X[i].
           LD    F6,0(R2)           ; Carga Y[i].
           ADDD  F6,F4,F6           ; Suma a*X[i]+Y[i].
           SD    0(R2),F6           ; Almacena Y[i].
           LD    F8,8(R1)           ; Carga X[i].
           MULTD F10,F8,F0          ; Multiplica a*X[i].
           LD    F12,8(R2)          ; Carga Y[i].
           ADDD  F12,F10,F12        ; Suma a*X[i]+Y[i].
           SD    8(R2),F12          ; Almacena Y[i].
           LD    F14,0(R1)          ; Carga X[i].
           MULTD F16,F14,F0         ; Multiplica a*X[i].
           LD    F18,0(R2)          ; Carga Y[i].
           ADDD  F18,F16,F18        ; Suma a*X[i]+Y[i].
           SD    0(R2),F18          ; Almacena Y[i].
           ADDI  R1,R1,24           ; Incrementa �ndice X.
           ADDI  R2,R2,24           ; Incrementa �ndice Y.
           SGE   R3,R1,R4           ; Comprueba si el �ndice del vector X ha llegado al final.
           BEQZ  R3,bucle           ; Comprueba la condici�n de final del bucle.

fin:       trap 6                   ; Fin del programa.