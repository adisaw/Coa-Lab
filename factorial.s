.data
disp: .asciiz "Enter a number :"
.text
.globl main
main:
	la $a0,disp
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	move $a0,$v0
	
	jal fact
	move $a0,$v0
	li $v0,1
	syscall
	
Exit:
	li $v0,10
	syscall
	
fact:
	bgt $a0,1,L1
	li $v0,1
	jr $ra
	
L1:
	addi $sp,$sp,-8
	sw $a0,4($sp)
	
	sw $ra,0($sp)
	addi $a0,$a0,-1
	jal fact
	lw $t0,4($sp)
	
	lw $ra,0($sp)
	addi $sp,$sp,8
	mul $v0,$v0,$t0
	jr $ra
	