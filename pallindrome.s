.data
num : .asciiz "Enter a number" 
yes : .asciiz "Yes"
no : .asciiz "No"
.text
.globl main
main:
	la $a0,num
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	
	move $t0,$v0
	move $a0,$t0
	jal function1
	
	beq $v0,1,YES
	j NO
	
	YES:
		la $a0,yes
		li $v0,4
		syscall
		j Exit
		
	NO:
	   la $a0,no
	   li $v0,4
	   syscall
	 
	Exit:
		li $v0,10
		syscall
	
	


function1:
	move $t1,$a0
	move $t2,$t1
	li $t3,0
	
	loop:
		li $t7,10
		div $t2,$t7
		mflo $t2
		mfhi $t4
		mul $t3,$t3,10
		add $t3,$t3,$t4
		bgt $t2,0,loop
		
		
	beq $t3,$t1,ret1
	
	li $v0,0
	jr $ra
	
	
	ret1:   
		li $v0,1
		jr $ra
		
		
		
		
