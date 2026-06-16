# Une valeur aléatoire est fourni dans s0
# Coder la logique du jeu pour permettre à l'utilisateur de deviner la valeur
# La valeur écrite est la bonne : afficher '=' et quitter
# la valeur écrite est inférieure : afficher '+'
# la valeur écrite est supérieure : afficher '-'
	.data
constants:
	.eqv Random, 41 
	.eqv PrintInt, 1
	.eqv ReadInt, 5 
	.eqv PrintChar, 11
	.eqv PrintString, 4
	.eqv Exit, 10

bienvenu:	.string "Bienvenu! Devinez le nombre entre 0 et 100: \n"
victoire:	.string "\nVous avez trouvé! Félicitations!"
	
	.text
main:
	# On veut un nombre aléatoire entre 0 et 100
	li a7, Random	# syscall random int
	li a0, 0	# seed
	ecall		# a0 =  random int 32 bits
	
	li t1, 101
	rem s0, a0, t1	# rem = reste de la division entière
	
if:	bge s0, zero, alors
else:	neg s0, s0	# on rend s0 positif
alors:
	# Debug: afficher le nombre aléatoire 
	# mv a0, s0	# s0 = nombre aléatoire
	# li a7, PrintInt
	# ecall
	nop

	# Afficher le bienvenu
	li a7, PrintString
	la a0, bienvenu
	ecall
			
boucle: 
	li a7, PrintChar
	li a0, '>'
	ecall
	
	li a7, ReadInt
	ecall
	mv s1, a0
	
	beq s0, s1, success
	blt s1, s0, more
	bgt s1, s0, less
	
more:
	li a7, PrintChar
	li a0, '+'
	ecall
	j boucle
	
less:
	li a7, PrintChar
	li a0, '-'
	ecall
	j boucle
	
success: 
	li a7, PrintChar
	li a0, '='
	ecall
	
	li a7, PrintString
	la a0, victoire
	ecall
	j fin
	
fin:
	li a7, Exit
	ecall
