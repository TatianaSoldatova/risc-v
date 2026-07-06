# Lire un nombre m
# Pour chaque nombre n de 1 à m (inclus)
# Affiche Fizz si n est divisible par 3
# Affiche Buzz si n est divisible par 5
# Affiche FizzBuzz si n est divisible par 3 et 5
# Autrement affiche le nombre n
.data
fizzVar:	.string "Fizz"
buzzVar:	.string "Buzz"
	
	.eqv ReadInt, 5
	.eqv PrintInt, 1
	.eqv PrintString, 4
	.eqv PrintChar, 11
	.eqv Exit, 10

.text
	li s1, 1 # n
	li s3, 3
	li s5, 5
	
	# Lire le nombre m
	li a7, ReadInt
	ecall
	mv s0, a0
	
loop:	bgt s1, s0, fin
	rem t0, s1, s3
	rem t1, s1, s5
	
	bnez t0, next # 1/3 != 0
	bnez t1, next # 1/5 != 0
	
	li a7, PrintString
	la a0, fizzVar
	ecall
	
	li a7, PrintString
	la a0, buzzVar
	ecall
	
	li a7, PrintChar
	li a0, ' '
	ecall
	
	addi s1, s1, 1
	j loop	
next:
	beqz t0, fizz
	beqz t1, buzz
	
	li a7, PrintInt
	mv a0, s1
	ecall
	
	li a7, PrintChar
	li a0, ' '
	ecall
	
	addi s1, s1, 1
	j loop
	
fizz:	li a7, PrintString
	la a0, fizzVar
	ecall
	
	li a7, PrintChar
	li a0, ' '
	ecall
	addi s1, s1, 1
	j loop
	
buzz:	li a7, PrintString
	la a0, buzzVar
	ecall	
	
	li a7, PrintChar
	li a0, ' '
	ecall
	addi s1, s1, 1
	j loop
	
fin:
	li a7, Exit
	ecall
	
	