# Lire un nombre et afficher ses facteurs premiers
# facteurs(n) {
# 	f = 2;
# 	while (n > 1) {
# 	  if (n % f == 0) {
# 	  print(f);
# 	  n = n / f;
# 	} else {
# 	  f++;
# }

.data
	.eqv ReadInt,5
	.eqv PrintInt,1
	.eqv PrintChar, 11
	.eqv Exit, 10
	
.text
	li s0, 2 # f
	li s1, 1
	
	# Lire le nombre à factoriser
	li a7, ReadInt
	ecall
	mv s2, a0 # s2 = n
	
loop:	ble s2, s1, fin # while s2 > 1
	rem s3, s2, s0  # s3 = s2 % s0
	
	beqz s3, print
	addi s0, s0, 1
	j loop 
	
print:
	#Print f
	li a7, PrintInt
	mv a0, s0
	ecall
	
	li a7, PrintChar
	li a0, ' '
	ecall
	
	div s2, s2, s0
	j loop

fin:
	li a7, Exit
	ecall
	