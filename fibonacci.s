

  .data
msg_input: .asciiz "Enter a number"
msg_result: .asciiz "Fibonacci number is :"

.text 
.globl main
main:
	li $v0,4
	la $a0,msg_input
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	
	li $v0,4
	la $a0,msg_result
	syscall
	
	move $a0,$t0
	
	jal fib
	move $a0,$v0
	li $v0,1
	syscall
	
	Exit:
	 li $v0,10
	 syscall
	

fib:
	
	bgt $a0,1,L1
	move $v0,$a0
	jr  $ra
	
L1: 
	addi $sp,$sp,-4
	sw $ra ,0($sp)
	
	
	addi $a0,$a0,-1
	jal fib
	
	
	lw $ra,0($sp)
	add $sp,$sp,4
	
	addi $sp,$sp,-4
	sw $v0,0($sp)
	addi $sp,$sp,-4
	sw $ra,0($sp)
	
	addi $a0,$a0,-1
	jal fib
	addi $a0,$a0,2
	
	lw $ra,0($sp)
	add $sp,$sp,4
	lw $s0,0($sp)
	add $sp,$sp,4
	add $v0,$s0,$v0
	jr $ra
	
	
	
	
	
	
