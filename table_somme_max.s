# Calculer et afficher la somme des 10 éléments du tableau
# Modifier le programme pour afficher également l'élément le plus grand du tableau
.data
tableau: .word 10, 10, -6, 20, 1, 1, 8, 800, -800, -2	
	 .eqv taille, 10
	 .eqv PrintInt, 1
	 .eqv PrintChar, 11
	 .eqv Exit, 10

.text
	la s0, tableau  # l'adresse du début du tableau
	li s1, 0	# somme
	li t0, taille	# 10
	li t1, 0	# i indice de boucle
	lw t3, 0(s0)	# greatest (première valeur du tableau)
boucle: 
	bge t1, t0, fin
	lw t2, 0(s0)	# t2 = tableau[i]
	
	ble t2, t3, alors
	mv t3, t2
alors:	
	add s1, s1, t2					
	addi t1, t1, 1	# i++
	addi s0, s0, 4	# adresse + 4, on passe à l'élément suivant
	j boucle
	
fin:
	# Afficher la somme = 42
	li a7, PrintInt
	mv a0, s1
	ecall
	
	li a7, PrintChar
	li a0, '\n'
	ecall
	
	# Afficher greatest = 800
	li a7, PrintInt
	mv a0, t3
	ecall
	
	li a7, Exit
	ecall

	