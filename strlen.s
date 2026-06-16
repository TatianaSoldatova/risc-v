# Écrivez un programme strlen.s qui lit des caractères jusqu’à '.' et affiche le nombre de caractères 
# qui ont été saisis (sans compter le . final). Exemple « Hello, World123. » doit donner 15.

constantes:
	.eqv ReadChar, 12
	.eqv PrintChar, 11
	.eqv PrintInt, 1
	.eqv Exit, 10
	
main:
	li t0, '.'
	li t1, 0 
	li s0, 0 # index d'incrementation
	
boucle:	beq t0, t1, fin # branch equal (if t0 == t1) arrête la boucle
	li a7, ReadChar
	ecall
	mv t1, a0
	addi s0, s0, 1
	j boucle
fin: 
	li a7, PrintChar
	li a0, '\n'
	ecall
	
	li a7 PrintInt
	addi s0, s0, -1
	mv a0, s0
	ecall
	
	li a7, Exit
	ecall
