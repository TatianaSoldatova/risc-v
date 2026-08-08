# 
# INF2171 - Organisation des ordinateurs et assembleur
#   Session : Été 2026
# 
#   TP1 - Tous les chemins mènent à un 
#	Objectif : Arithmétique, boucles, branchements et appels système
#   
#   Auteur(s):
# 	    - Nom : Tatiana Soldatova
#

.text
	# Appels systèmes utilisés
	.eqv PrintChar, 11
	.eqv ReadInt, 5
	.eqv PrintInt, 1
	.eqv Exit, 10
	
	# Caractères
	.eqv invite, '>'
	.eqv dash, '-'
	
main:
	# Enregistrer dans s0 la valeur de comparaison avec n: 'n != 1'
	li s0, 1
	# Enregistrer dans s1 la valeur du facteur 3
	li s1, 3
	
	# Afficher '>'
	li a0, invite
	li a7, PrintChar
	ecall			
	
	# Lire un entier n
	li a7, ReadInt
	ecall			
	
	# Afficher n à l'écran
	li a7, PrintInt
	ecall
	addi t0, a0, 0		# On met la valeur de n initiale dans un registre temporaire t0

boucle: beq t0, s0, fin 	# Si n == 1 on quitte la boucle et on finit le programme 

	# Afficher '-' entre chaque itération de n			
	li a0, dash
	li a7, PrintChar
	ecall

	# Représenter: n % 2 	
	# On utilise le masque binaire ANDi avec 1 afin de connaitre la valeur du bit le plus faible de n
	# Si le dernier bit de n == 0, n est pair, sinon il est impair
	andi t1, t0, 1	
si:	beq t1, zero, diviser
sinon:	
	# Calculer: n = n * 3 + 1
	mul t0, t0, s1
	addi t0, t0, 1
	j afficher	
diviser:
	# Calculer: n = n/2
	# On va utiliser le bit shift de 1 à droite, qui représente la division par 2
	srli t0, t0, 1
	j afficher		
				
afficher:
	# On affiche le résultat d'une itération avec le registre a0
	li a0, 0
	add a0, a0, t0
	li a7, PrintInt
	ecall
	j boucle	
fin:
	li a7, Exit
	ecall

