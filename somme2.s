# Lire 2 nombres au clavier et afficher leur somme
constants:
	.eqv ReadInt, 5 		# met le résultat dans a0
	.eqv PrintInt, 1		# a besoin de valeur dans a0
	.eqv Exit, 10

main:
	# lecture premier nombre
	li a7, ReadInt
	ecall 			
	mv s0, a0		# s0 contient la première valeur lue
		
	# lecture deuxième nombre
	ecall			 
	mv s1, a0		# s1 contient la deuxième valeur lue
	
	add s0, s0, s1		# calculer la somme
	
	# affichage de la somme
	li a7, PrintInt
	mv a0, s0
	ecall

fin:
	li a7, Exit
	ecall
