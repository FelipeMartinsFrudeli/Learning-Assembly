.data
	# dados da mem�ria
	msg: .asciiz "Hello World" # mensagem exibida para o user

.text
	# instru��es do programa
	li $v0, 4	# inpress�o de string
	la $a0, msg # indicar endere�o
	syscall 		# imprimir

	li $v0, 10 # encerra
	syscall