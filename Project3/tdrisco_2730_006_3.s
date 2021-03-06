/*NAME Timothy Driscoll
 COURSE ECE 273
 SECION 006
 DATE 2.20.19
 FILE tdrisco_2730_006_3.s
 PURPOSE The purpose of this lab is to demonstrate the how to simulate 
conditional statements in assembley language. This is done by creating
a function that determines what type of triangle a user enters using if
statements.
*/

/*FUNCTION classify
 ARGUMENTS The parameters of this function are ints i, j and k
 RETURNS The function returns the int tri_type
 PURPOSE This function uses a series of if statements to determine the type of triangle
that is made from the three inputed sides. The function will determine whether the inputs
even make a triangle or if its scalene, equilateral or isosceles. It will return an int
value tri_type which will be a number 0-3 all corresponding to a different type.
*/
/* begin assembly stub */
.globl classify
.type classify,@function
classify:
/* prolog */
pushl %ebp
pushl %ebx
movl %esp, %ebp
/* put code here */
/* This first block of code checks to see if any of the intial variables are 0 */
	movl $0, %eax
	cmpl %eax, i
	jne checkOne		#First varible isn't 0 so check next
	movl $0,tri_type
	jmp return		#Return if varible is equal to 0 (Not a triangle)
checkOne:
	cmpl %eax, j
	jne checkTwo		#Jump is second varibale also isnt zero and check last
	movl $0,tri_type
	jmp return		#Return not a triangle is variable equals 0
checkTwo:
	cmpl %eax, k
	jne SecondCheck		#Check final varible return if equals 0 jump if not
	movl $0,tri_type
	jmp return
SecondCheck:
/* This block of code checks for matching sides by comparing together i, j, k */
	movl $0, match		#Set match to intial value of 0
	movl i, %eax
	cmpl %eax, j		# Compare i and j to determine if they are equal, if they are add 1 to 					match if not jump to match1
	jne match1
	addl $1, match

match1:
	cmpl %eax, k		# Do the same as above but compare i and k and add 2 to match this time
	jne match2
	addl $2, match

match2:
	movl j, %eax		# Do the same as above but compare j and k and add 3 to match this time
	cmpl %eax, k
	jne match3
	addl $3, match

match3:
/* Large block of if statements to determine what type of triangle the user entered */
	
	cmpl $0,match			# First if statement to check if match != 0	
	je more				# If match does equal 0 jump to more
	cmpl $1, match
	jne matchDoesntEqualOneElse 	#jump if match !=1 (This is the first nested if)
	movl i, %eax
	addl j,%eax			# Add i and j then compare to k
	cmpl k,%eax
	jg matchEqualOneEnd		# Jump to end of this if statement if i+j > k, if not return 0
	movl $0, tri_type
	jmp return

matchDoesntEqualOneElse:
/* This block of code is the else to if(match == 1) */

	cmpl $2, match
	je matchEqualTwoElse 	#jump past the if statement match == 2
	movl $6, %eax
	cmpl match, %eax
	jne two      		#jump past the if statement if match != 6, if not return tri_type = 1
	movl $1, tri_type
	jmp return

two:
/* This block of the code represents the else statement to if(match == 6) */

	movl j, %eax		#compare j + k to i
	addl k,%eax
	cmpl i,%eax
	jg matchEqualTwoElse	# if j+k > i then jump to matchEqualTwoElse, if not return tri_type = 0
	movl $0, tri_type
	jmp return

matchEqualTwoElse:
/* This block of code represents the else statment to  if(match != 2) */

	movl i, %eax		#compare i + k to j
	addl k,%eax
	cmpl j,%eax
	jg matchEqualTwoEnd	# if i+k > j then jump to matchEqualTwoElse, if not return tri_type = 0
	movl $0, tri_type
	jmp return

matchEqualTwoEnd:		#End of match != 2 (else)
matchEqualOneEnd: 		#End of match == 1 (else)
/* This small block of code represents what is after the two else statements above and before the end of the if(match) statement */
 
	movl $2, tri_type	#set tri_type to 2 and jmp to return
	jmp return		
more:
/* Check to see if this is a triangle. This series of code represents the final if statement containing two or's */

	movl i, %eax		#Add i and j then compare this value to k
	addl j,%eax
	cmpl k,%eax		# if i+j is greater then k jump to the next check if not set tri_state = 					0 and jmp to return
	jg checkOneTrig
	movl $0,tri_type
	jmp return

checkOneTrig:

	movl j, %eax		# Repeat the steps above but add j and k then compare to i
	addl k,%eax
	cmpl i,%eax
	jg checkTwoTrig
	movl $0,tri_type
	jmp return

checkTwoTrig:

	movl i, %eax		# Repeat the steps above one more time but add i and k then compare to j
	addl k,%eax
	cmpl j,%eax
	jg Scalene
	movl $0,tri_type
	jmp return

Scalene:

	movl $3, tri_type	#Lastly if it makes it past the three checks above set tri_state to 3 and 					jmp to return
	jmp return

return:
/* epilog */
movl %ebp, %esp
popl %ebx
popl %ebp
ret
/* declare variables here */
.comm match, 4
/* end assembly stub */

