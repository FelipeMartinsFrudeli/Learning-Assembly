.text
	li $t0, 12
	addi $t1,  $zero, 10
	
	sll $s1,  $t1, 10  # multiplica por 2 ^ 10 = 1024
	
	#$s0 terá o resultado da multiplicação
	mul $s0,  $t0,  $t1
	
	li $v0, 1
	move $a0,  $s0  # para imprimir inteiros o numero precisa estar no registrador $a0
	syscall