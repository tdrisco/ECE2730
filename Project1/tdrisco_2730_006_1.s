/* begin assembly code */
/*NAME Timothy Driscoll
 COURSE ECE 273
 SECION 006
 DATE 1.23.19
 FILE tdrisco_2730_006_1.s
 PURPOSE The purpose of this program is to sum 
the ascii values of all the characters in a user
defined string. This program demostrates basic 
compiling with assembly programs.
*/
.globl asum
.type asum,@function
asum:
pushl %ebp
movl %esp, %ebp
subl $4, %esp
movl $0, -4(%ebp)
.L2:
movl 8(%ebp),%eax
cmpb $0,(%eax)
jne .L4
jmp .L3
.L4:
movl 8(%ebp),%eax
movsbl (%eax),%edx
addl %edx, -4(%ebp)
incl 8(%ebp)
jmp .L2
.L3:
movl -4(%ebp), %eax
jmp .L1
.L1:
movl %ebp, %esp
popl %ebp
ret
/* end assembly */
/* Do not forget the required blank line here! */

