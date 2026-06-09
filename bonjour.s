# Lire deux caractères (les initiales, ex.: TS) et afficher Bonjour TS
constants:
	.eqv ReadChar, 12
	.eqv PrintChar, 11
	.eqv Exit, 10
	
main:
	li a7, ReadChar
	ecall
	mv s0, a0
	
	ecall
	mv s1, a0
	
	li a7 PrintChar		# cette directive dit qu'on doit interpreter ce qui suit comme des chars
	li a0, '\n'
	ecall
	
	li a7 PrintChar		
	li a0, 'B'
	ecall
	
	li a0, 'o'
	ecall
	
	li a0, 'n'
	ecall
	
	li a0, 'j'
	ecall
	
	li a0, 'o'
	ecall
	
	li a0, 'u'
	ecall
	
	li a0, 'r'
	ecall
	
	li a0, ' '
	ecall
	
	mv a0, s0
	ecall
	mv a0, s1
	ecall
	
fin:
	li a7, Exit
	ecall
	
