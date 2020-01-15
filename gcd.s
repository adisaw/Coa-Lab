#Aditya Sawant 17CS10060


##########Data Segment########################
.data
prompt:
       .asciiz  "Enter two numbers: "
sum_msg:
       .asciiz "The gcd is: "
newline:
       .asciiz "\n"
invalid:
		.asciiz "invalid input-non positive integer\n"
###########Code Segment#####################
       .text
       .globl main
main:

		la $a0,prompt # message string in $a0, pseudoinstruction
		li $v0,4  # Prepare to print the message
		syscall  # print the message

		li $v0,5  	  #reads first integer
		syscall 	#argument in $v0
		move $t0, $v0 #argument in $t0


		li $v0, 5 #reads second integer
		syscall		#argument in $v0
		move $t1, $v0 #argument in $t1
		
		move $a0,$t0
		move $a1,$t1
		
		jal gcd
		move $a0,$v0
		li $v0,1
		syscall
		
	   

Exit: 

		li $v0,10  #exit
		syscall
		  
gcd:
	bne $a1,0,L1 #if b not equal to 0
	move $v0,$a0 # return a 
	jr $ra
	
	
L1: 
	addi $sp,$sp,-4
	sw $ra, 0($sp)
	div $a0,$a1
	mfhi $t0     #a%b
	move $a0,$a1
	move $a1,$t0
	jal gcd
	lw $ra ,0($sp)
	addi $sp,$sp,4
	jr $ra