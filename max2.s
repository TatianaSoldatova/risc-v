# Lire deux nombres et afficher le plus grand des deux 
constants:
	.eqv PrintInt, 1
	.eqv ReadInt, 5
	.eqv Exit, 10
	
main:
	#Lire le premier nombre
	li a7, ReadInt
	ecall
	mv s0, a0
	
	#Lire le 2e nombre
	ecall
	mv s1, a0

	# Afficher le plus grand des eux nombres
	li a7, PrintInt	
if:	blt s0, s1, alors  # s0 < s1
else:	mv a0, s0
	ecall
	j fin
alors:  mv a0, s1
	ecall
	
fin:
	li a7 Exit
	ecall
