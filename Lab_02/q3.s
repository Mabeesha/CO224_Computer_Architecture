	.text 	@ instruction memory
	.global main
	
main:
	
	sub sp, sp, #4
	str lr, [sp, #0]

	ldr r4, =array_a
	mov r5,#0 
	mov r6,#16 

loop:
	cmp r5,#5
	blt LOOPBLOCK
	bgt exit1
LOOPBLOCK:
	ldr r7,[r4,r5]
	ldr r8,[r4,r6]
	cmp r7,r8
	bne PNO

	add r5,r5,#4
	sub r6,r6,#4
	b loop

exit1:	

PYES:
	ldr r0, =format1
	bl printf
	b exit2
PNO:
	ldr r0, =format2
	bl printf
	b exit2	

exit2:
	@ stack handling (pop lr from the stack) and return
	ldr lr, [sp, #0]
	add sp, sp, #4
	mov pc, lr
	
	.data	@ data memory
	
format1: .asciz "This number is a palindrome\n"
format2: .asciz "This number is not a palindrome\n"
	
	@array called array_a of size 40 bytes
	.balign 4 			@align to an address of multiple of 4
array_a: .word 2,3,9,3,2
