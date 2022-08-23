.data
	msg: .asciiz "Forneça um número decimal: "
	zero: .float 0.0
	
.text
	li $v0, 4 	# preparar para imprimir string
	la $a0, msg 	
	syscall

	li $v0, 6 	# preparar para ler float, valor lido estará em $f0
	syscall
	
	lwc1 $f1, zero		# colocando o float na memória para impressão no $f12
	add.s $f12, $f1, $f0
	
	li $v0, 2 	# preparar para imprimir float
	syscall
	
	# os numeros float são armazenados nos registradores do co-processador 1 (cp1)
	# Sempre devemos colocar o valor do float em $f12, ou o valor correto não é impresso