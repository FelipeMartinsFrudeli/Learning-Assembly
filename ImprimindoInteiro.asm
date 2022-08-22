.data
	idade: .word 56 # int value na memória ram
.text
	li $v0, 1
	lw $a0, idade
	syscall