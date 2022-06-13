/*NAME Timothy Driscoll
 COURSE ECE 273
 SECION 006
 DATE 4.10.19
 FILE tdrisco_273_006_6.s
 PURPOSE The purpose of this lab is to demonstrate how to call functions with argumnets and have specific return times. This is done through the implementation of a factorial function that recurisvely calls its self to calculate the factorial of a given number. The given number (n) is passed in as an integer argument. The answer is returned as an integer value in the %eax register.
*/

/* begin assembly stub */

/*FUNCTION Factorial
 ARGUMENTS Integer (n)
 RETURNS Integer (answer)
 PURPOSE This function is designed to recursively determine the factorial of a given number n.
*/

/* put assembler directives here */
.globl Factorial
.type Factorial,@function
Factorial:

/* prolog */

pushl %ebp
pushl %ebx
movl %esp, %ebp

/* put code here */

	movl 12(%ebp),%ebxpp	#Retrieve the argument to the function off the stack
	cmpl $0, %ebx		#Compare the argument to 0
	jne SecondIf
	movl $1, %eax		#If the argument equals zero return 1 as the answer and jump to return
	jmp return

SecondIf:			#Second part of the if statement (or)
	movl 12(%ebp),%ebx	#Retrieve the argument to the function off the stack
	cmpl $1, %ebx		#Compare the argument to 1
	jne Else
	movl $1, %eax		#If the argument equals zero return 1 as the answer and jump to return
	jmp return
Else:				#Else statement start
	movl 12(%ebp),%ecx	#Move value of n to c register and subtract 1
	subl $1, %ecx
	pushl %ecx		#push n-1 to stack as argument to the recursive call of factorial
	call Factorial
	addl $4, %esp		#Adjust value of esp register instead of popping c register of the stack
	mull 12(%ebp)		#Mulltiply n by the Factorial(n-1)

return:
/* epilog */
movl %ebp, %esp
popl %ebx
popl %ebp
ret
/* end assembly stub */
