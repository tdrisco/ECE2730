/*NAME Timothy Driscoll
 COURSE ECE 273
 SECION 006
 DATE 3.6.19
 FILE tdrisco_2730_006_4.s
 PURPOSE The purpose of this lab is to demonstrate the how to use register indirect addresing and base indexing to refrence both pointer and elements in an array. The function belows implements both of these types of addressing
*/

/* begin assembly stub */

/*FUNCTION AtoI
 ARGUMENTS The parameters of this function are char *ascii, int *intptr, int sign, int mulitiplier and int i.
RETURNS The function returns the values that correspond to the variables input and output. Input represent the ascii version of the input and output represents the integer version of the input.
 PURPOSE This function is designed to take in multiple inputs and return two differnt things. The first thing that is returned is idetical to input and it is the ascii representation of what the user inputed. The second return is the integer version of what the user inputed. The fucntion is designed to get the integer version by removing characters like +, space and tab just leaving the int value.
*/

.globl AtoI
.type AtoI,@function
AtoI:
/* prolog */
pushl %ebp
movl %esp, %ebp
pushl %ebx
pushl %esi
pushl %edi
/* put code here */
movl $1, sign	#intialize sign to one

while: #start of the while loop that checks for a space or tab
	movl ascii, %eax	# move ascii to a register and compare to space ascii value
	cmpb $32,(%eax)
	jne check2		# if ascii is a space add one and jump to the to of the while if not 					check for a tab
	addl $1,ascii
	jmp while
check2:
	movl ascii, %eax	# move ascii back to register a and compare to tab ascii value
	cmpb $9,(%eax)
	jne next		# if ascii is a tab add one and jump back to the top of the while loop if 					not move onto the next label
	addl $1,ascii
	jmp while
next:
	movl ascii, %eax	#move ascii to register a and check for a plus sign
	cmpb $43,(%eax)
	jne elseIf		#if there is a plus sign add one to ascii otherwise jump to the next label
	addl $1,ascii
elseIf:
	movl ascii, %eax	#move ascii to register a and check for a minus sign
	cmpb $45,(%eax)
	jne endOfIf		#if there is a minus sign add one to ascii and change sign to -1
	movl $-1,sign		#if there was no minus sign jump to the next label
	addl $1,ascii
endOfIf:
	movl intptr, %eax	#initialize the intptr value to 0 using register indirect addressing
	movl $0,(%eax)
	movl %eax, intptr
	movl $0, i		#intialize the index i to 0 and move it int the indexing register edi
	movl i,%edi
topOfFor:
	movl ascii, %eax	#move ascii into the a register, clear the b register and move i to edi
	movl $0, %ebx
	movl i,%edi
	movb (%eax,%edi,1), %bl #move the ith element of ascii into the lower byte of the b register
	cmpb $48, %bl		#compare the single byte in the b register to the ascii character 0
	jl outFor		#if the byte is greater than or equal to '0' jump to the next label if 					not compare the byte to the the ascii character 9 (less then or equal to 					'9')
	cmpb $57,%bl
	jg outFor		#if the byte doesnt fall in this range add one to the index and jump back 					to the topOfFor label to compare again
	addl $1,i
	jmp topOfFor
outFor:
	subl $1,%edi		#subtract one from the index value i
	movl %edi, i
	movl $1, multiplier	# set the multiplier varible to 1
topFor2:	
	cmpl $0,i		#if i is less than 0 jump the next label
	jl outFor2
	movl ascii, %ebx	#move ascii to register b, i to edi and clear register a
	movl i, %edi
	movl $0, %eax
	movb (%ebx,%edi,1), %al	#move the ith element of ascii into the lower byte of the a register
	subb $48,%al		#subtract the charcter '0' from the ith element of ascii
	mull multiplier		#multiply the above value by multiplier and add to intptr
	movl intptr, %ebx
	addl %eax,(%ebx)
	movl multiplier,%eax	#Increment the multiplier by a factor of ten
	movl $10,%ecx
	mull %ecx
	movl %eax, multiplier
	subl $1,i		#subtract one from the index and jump back to the top of topFor2
	jmp topFor2
outFor2:
	movl intptr,%ebx	#set intptr to the product of intptr and the sign variable
	movl (%ebx),%eax
	mull sign
	movl %eax,(%ebx)
	

return:
/* epilog */
popl %edi
popl %esi
popl %ebx
movl %ebp, %esp
popl %ebp
ret
/* end assembly stub */

