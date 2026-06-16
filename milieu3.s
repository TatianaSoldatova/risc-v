# Lire trois nombres et afficher celui qui est compris entre les deux autres.
constants:
	.eqv PrintInt, 1
	.eqv ReadInt, 5
	.eqv Exit, 10

main:	
	# Lire 1er nombre
	li a7 ReadInt
	ecall
	mv s0, a0

	# Lire 2e nombre
	ecall
	mv s1, a0

	# Ordonner les deux premiers nombre par ordre croissant s0 <= s1
if:
	ble s0, s1, alors 	# (ble = branch less or equal, if s0 < s1, on va dans 'alors')
else:
	mv s1, s0 		# on met la valeur (plus grande) de s0 dans s1
	mv s0, a0 		# on place la valeur du a0 (ancienne valeur de s1) dans s0). On fait une permutation
alors:
	# Lire 3e nombre
	ecall
	mv s2, a0

	# Comparer avec le 3e nombre
	ble s2, s0, get_s0 		# si s2 < s0, on a s2 < s0 < s1
	ble s2, s1, get_s2 		# si s2 < s1, on a s0 < s2 < s1
	mv s3, s1	   		# sinon on a s0 < s1 < s2
	b afficher

get_s0:
	mv s3, s0
	b afficher
	
get_s2:
	mv s3, s2
	b afficher
	
afficher:
	mv a0, s3
	li a7 PrintInt
	ecall
fin:
	li a7 Exit
	ecall
