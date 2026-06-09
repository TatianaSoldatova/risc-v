# Écrivez un programme qui lit trois nombres et affiche le plus grand des 3.
constants:
	.eqv PrintInt 1
	.eqv ReadInt 5
	.eqv Exit 10

main:	
	# Lire 1er nombre
	li a7, ReadInt
	ecall
	mv s0, a0

	# Lire 2e nombre
	ecall
	mv s1, a0

	#Lire 3e nombre
	ecall
	mv s2, a0

	# Comparer les nombres (bge = branch greater or equal) 
if_1:	
	bge s0, s1, alors_1 	# si s0 > s1, aller dans le label 'alors_1'
else_1:	
	mv t1, s1		# si s1 > s0, on garde la valeur de s1 dans t1
	b nextStep		# on quitte le branchement
alors_1: 
	mv t1, s0		# parce que s0 > s1, on garde la valeur de s0 dans t1

	nextStep: 
if_2:	
	bge s2, t1, alors_2 	# si s2 > t1, aller dans le label 'alors_2'
else_2:	
	mv a0, t1		# on place la valeur du plus grand nombre dans a0 pour l'affichage 
	b fin
alors_2:
	mv a0, s2		# on place la valeur du plus grand nombre dans a0 pour l'affichage 
fin:
	# On affiche le plus grand des 3
	li a7, PrintInt
	ecall
	
	li a7 Exit
	ecall

