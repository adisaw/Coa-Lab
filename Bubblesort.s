#assignment no 2
#problem no 2
#semester Autumn 
#group no 19, 
#Aditya Sawant 17CS10060
#Yash Butala 17CS30038
####################### Data segment ######################################
 .data
msg_input:   .asciiz "Enter 8 integers  "
msg_input1:   .asciiz "Enter number to be searched "
msg_result:   .asciiz "Elements in sorted order:\n "
msg_space:   .asciiz " "
errormsg:  .asciiz "Not in ascending"
newline:   .asciiz "\n"

####################### Data segment ######################################

####################### Text segment ######################################
.text
.globl main
array: .space 32
     main:
          la $a0, msg_input		# message string in $a0, pseudoinstruction
          li $v0, 4 			# Prepare to print the message
          syscall  				# print the message
		  la $t3, array			# load address of array in $t3
          move $t0 ,$zero		# $t0<-0
		  move $t2 ,$zero		# $t2<-0
		enter:
		  li $v0, 5 			# for read_int
          syscall 				# argument in $v0
		  sw $v0, 0($t3) 		# saving input into array
		  add $t3 ,$t3,4		# incrementing array position
          add $t0,$t0,1			#incrementing counter
		  blt $t0, 8, enter		#$t0<8 then goto enter
		  
		sort:
			la $s0,array					#load address of array in $s0
			move $t0, $zero					#$t0<-0 say i variable
		
			loop1: 
				move $t1, $zero				#$t1<-0 j variable
				loop2:
					mul $t5,$t1,4			
					add $t2,$t5,$s0			#$t2 will have address of array elements
					lw $t3,0($t2)			#$t3<-arr[j]
					add $t1,$t1,1			# j=j+1
					mul $t5,$t1,4			
					add $t2,$t5,$s0			#adress of next element of array
					lw $t4,0($t2)			#$t4<-arr[j+1]
					blt $t4,$t3 ,swap		#if arr[j+1]<arr[j] the swap
					jloop:
					blt $t1,7,loop2			#if j<7 goto loop2
				add $t0,$t0,1				#increment i by one  here i is $t0
				blt $t0,8,loop1				#i<8 goto loop1
			j Print_no						#jump to Print_no
		swap:
			sw $t3,0($t2)					
			sub $t2,$t2,4
			sw $t4,0($t2)
			j jloop
			
		Print_no:
			la $a0, msg_result 				# message string in $a0, pseudoinstruction
			li $v0, 4 						# Prepare to print the message
			syscall  						# print the message
			la $s0,array					#load address of array in $s0
			move $t0,$zero					#$t0<-0
			print:
				
				mul $t1,$t0,4				# $t1=$t0*4
				add $t2,$s0,$t1				# t2 stores address of array element
				lw $t3,0($t2)				# load element in array
				move $a0,$t3 				# get element in $a0
				li  $v0, 1 					# for print_int
				syscall  					# print the result	
				la $a0, msg_space 			# message string in $a0, pseudoinstruction
				li $v0, 4 					# Prepare to print the message
				syscall  					# print the message
				add $t0,$t0,1				# increment loop variable
				blt $t0,8,print				# if $t0<8 goto print
     Exit:

          li $v0, 10						#for exiting
          syscall 							# exit				
		  
		  
		  ####################### Text segment ######################################