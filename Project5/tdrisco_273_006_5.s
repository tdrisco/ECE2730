/*NAME Timothy Driscoll
 COURSE ECE 273
 SECION 006
 DATE 3.27.19
 FILE tdrisco_273_006_5.s
 PURPOSE The purpose of this lab is to demonstrate the how to use the stack to create the correct prolog and epilog aswell as perform tasks such as creating local varibales to be used within a function. The is all demostrated by creating a recursive function that determines the Fibonacci sequence of the lenght n+1
*/

/* begin assembly stub */

/*FUNCTION Fib
 ARGUMENTS The parameters of this function are a global_var that contains the number n specifing the lenght of the Fibonacci sequence to be returned.
 RETURNS The function has no real return varibales but edits the global variable global_var which displays the sequence.
 PURPOSE This function is designed to recursively determine what the Fibonacci sequence is to a lenght that is specified by the user. The user specifies the number n and the given Fibonacci sequnece is returned with a lenght of n+1.
*/
.globl Fib
.type Fib,@function
Fib:
/* prolog */
pushl %ebp
pushl %ebx
movl %esp, %ebp
subl $8, %esp	#Intiailize two local variables


/* put code here */
	movl global_var, %ebx
	movl %ebx, -4(%ebp)	#Assign global var to local_var
	cmpl $0, -4(%ebp)	#compare local_var to 0, jump to return if it does equal 0
	jne elseIf		#If not 0 jump to elseIf
	jmp return

elseIf:
	cmpl $1, -4(%ebp)	#compare local variable to 1, jump to return if it does equal one
	jne more		#If not equal to one jump to more
	jmp return
more:
	movl -4(%ebp), %ebx	#move local_var to %ebx and then subtract 1 from %ebx
	subl $1, %ebx
	movl %ebx, global_var	#move local_var -1 into global var

	call Fib		#Recursively call the function Fib
	movl global_var, %ebx	#Move global_var into temp_var using %ebx
	movl %ebx, -8(%ebp) 
	movl -4(%ebp), %ebx	#Subtract two from from temp_var and move it into global_var
	subl $2, %ebx
	movl %ebx, global_var

	call Fib		#Recursively call the function Fib again
	movl global_var, %ebx
	addl %ebx, -8(%ebp)	#Add temp_var to global_var and reassign it to temp_var
	movl -8(%ebp), %ebx	#Set global_var to temp_var
	movl %ebx, global_var

return:
/* epilog */
movl %ebp, %esp
popl %ebx
popl %ebp
ret
/* end assembly stub */

