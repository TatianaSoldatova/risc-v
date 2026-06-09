# Lire trois nombres et affiche leur somme
constants:
	.eqv PrintInt, 1
	.eqv ReadInt, 5
	.eqv Exit, 10
	
main:	
	# Lire 1er nombre
	li a7 ReadInt	# on n'est pas obligé de répéter cette ligne si on utilise le même syscall plus loin
	ecall 		# syscall 5 est mis dans le registre a7, la valeur de input sera mise dans le registre a0 (toujours)
	mv s0, a0	# on déplace input value de a0 dans un autre registre pour la garder, sinon le prochain ecall va l'ecraser dans a0.

	# Lire 2e nombre
	ecall
	mv s1, a0

	# Lire 3e nombre
	ecall
	mv s2, a0

	#Calculer la somme
	add s0, s0, s1
	add s0, s0, s2
	mv a0, s0	# on doit deplacer la somme dans le registre a0 pour l'affichage

	# Affichage 
	li a7 PrintInt
	ecall

fin:
	li a7 Exit
	ecall
