.data
disp1: .asciiz "Enter 8 elements :"
msg: .asciiz "Elements in sorted order: "
space: .asciiz " "


.text
.globl main
array: .space 32
main:
	la $a0,disp1
	li $v0,4
	syscall
	
	la $t0,array

	li $t3,0
	
	getinput:
		li $v0,5
		syscall
		sw $v0,0($t0)
		addi $t0,$t0,4
		addi $t3,$t3,1
		blt $t3,8,getinput
		
		
	la $t0,array
	li $t1,0 #i=0
	li $t2,0 #j=0
	
	loop1:
		
		lw $t3,0($t0)
		move $t6,$t3 #min
		move $t7,$t0 #location
		add $t4,$t0,4
		addi $t2,$t1,1 #j=i+1
		loop2:
			
			 
			lw $t5,0($t4) #array[j] in $t5
			bgt $t5,$t6,increment
			
			move $t6,$t5
			move $t7,$t4
			increment:
			addi $t2,$t2,1
			addi $t4,$t4,4
			
			blt $t2,8,loop2
			
		
	    
		move $t8,$t3
		sw $t6,0($t0)
		sw $t8,0($t7)
		addi $t1,$t1,1
		addi $t0,$t0,4
		
		blt $t1,7,loop1
		

	la $t0,array
	li $t1,0
	li $v0,4
	la $a0,msg
	syscall
	printing:
	
		lw $t3,0($t0)
		move $a0,$t3
		li $v0,1
		syscall
		la $a0,space
		li $v0,4
		syscall
		add $t0,$t0,4
		add $t1,$t1,1
		blt $t1,8,printing
		

	exit: li $v0,10
		  syscall
		  
		  
		  
		
		
		
		
			
			
			
	
		
	