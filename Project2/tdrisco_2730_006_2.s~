/*NAME Timothy Driscoll
 COURSE ECE 273
 SECION 006
 DATE 1.30.19
 FILE tdrisco_2730_006_2.s
 PURPOSE The purpose of this program is to demonstrate the use of 
basic arithmatic in assembly language. This is done by the
implementation of three different functions that involve different 
calculations. This program also demonstrates the use of variable 
intialization.
*/
/* begin assembly stub */
/*FUNCTION dodiff
 ARGUMENTS The parameters of this function are ints digit1, digit2 and digit3
 RETURNS The function returns the int diff
 PURPOSE This function performs basic arithmatic between three different integer values and returns them to the integer diff.
The arithmatic includes the multiplication of each digit y itself and the the addition and subtraction of these products.
*/
.globl dodiff
.type dodiff, @function
dodiff:
/* prolog */
pushl %ebp
pushl %ebx
movl %esp, %ebp
/* put code here */
movl digit1, %eax #Move digit one into the a register so it can then 			  be multiplyed by itself this will be done for digit 			  2 and 3 aswell
mull digit1
movl %eax, diff #Move the given product into the diff variable to 			allow for the next series of multiplication
movl digit2, %eax
mull digit2
addl diff, %eax  #Add the given product to register a then move to diff
movl %eax, diff
movl digit3, %eax #Again perform the multiplication
mull digit3
subl %eax, diff #finally subtract the the last product from diff 			resulting in final answer

/* epilog */
movl %ebp, %esp
popl %ebx
popl %ebp
ret
/*FUNCTION dosumprod
 ARGUMENTS The parameters of this function are ints digit1, digit2 and digit3
 RETURNS The function returns the int sum and product
 PURPOSE This function performs basic arithmatic between three different integer values and returns them to the integer sum and product. Sum is the sum of the three digits and product is the product of the three digits.
*/
.globl dosumprod
.type dosumprod, @function
dosumprod:
/* prolog */
pushl %ebp
pushl %ebx
movl %esp, %ebp
/* put code here */
movl digit1, %eax  #Add together digit1, digit2 and digit3 then move 			    them to the sum variable
addl digit2, %eax
addl digit3, %eax
movl %eax, sum

movl digit1, %eax  #Multiply together digit1, digit2 and digit3 then 			    move the product into the varibale product
mull digit2
mull digit3
movl %eax, product
/* epilog */
movl %ebp, %esp
popl %ebx
popl %ebp
ret
/*FUNCTION doremainder
 ARGUMENTS The parameters of this function are ints product and sum
 RETURNS The function returns the int remainder
 PURPOSE This function performs basic division between the product and sum variable and then returns the remainder of this division.
*/
.globl doremainder
.type doremainder, @function
doremainder:
/*Page 28 of 155*/
/* prolog */
pushl %ebp
pushl %ebx
movl %esp, %ebp
/* put code here */
movl $0, %edx	   #Clear out the d register then perform division 			    between the product and the sum (product/sum)
movl product, %eax
divl sum
movl %edx, remainder #Move the remainder from the d register into the 			     remainder variable
/* epilog */
movl %ebp, %esp
popl %ebx
popl %ebp
ret
/* declare variables here */
.comm digit1, 4
.comm digit2, 4
.comm digit3, 4
.comm diff, 4
.comm sum, 4
.comm product, 4
.comm remainder, 4
/* end assembly stub */
/* Do not forget the required blank line here! */

