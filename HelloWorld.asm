.data
	# dados da memória
	msg: .asciiz "Hello World" # mensagem exibida para o user

.text
	# instruções do programa
	li $v0, 4	# inpressão de string
	la $a0, msg # indicar endereço
	syscall 		# imprimir

	li $v0, 10 # encerra
	syscall