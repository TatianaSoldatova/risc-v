# Écrivez un programme fib.s qui lit un nombre et affiche le terme correspondant de la suite de Fibonacci.
# F(0) = 0 ; F(1) = 1 ; et F(n) = F(n-1) + F(n-2) pour tout n > 1
# n = lireNombre();

# a = 0; // nombre courant
# b = 1; // nombre suivant
# i = 0; // compteur
# while(i<n) {
# 	t = a + b;
# 	a = b;
#	b = t;
#	i++;
# }
# afficherNombre(a);

constants:
	.eqv ReadInt, 5
	.eqv PrintInt, 1
	.eqv Exit, 10
	
main:
	li s0, 0 	# nombre courant a
	li s1, 1	# nombre suivant b
	li s2, 0	# compteur i

	li a7, ReadInt
	ecall
	mv s3, a0	# nombre lu n	
loop:
	bge s2, s3, finFib 
	add t0, s0, s1
	mv s0, s1
	mv s1, t0
	addi s2, s2, 1
	
	j loop
		
finFib:
	mv a0, s0
	li a7, PrintInt
	ecall
	
