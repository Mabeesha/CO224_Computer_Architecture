	.text
	.global main

main:
	
	@ stack handling, will discuss later
	sub sp, sp, #4
	str lr, [sp, #0]

	mov r4,#1
	
loop:
	cmp r4,#10
	bhi exit

	ldr r0, =answer
	mov r1,r4
	bl printf
	add r4,r4,#1
	b loop

exit:

	@ stack handling and return, will discuss later
	ldr lr, [sp, #0]
	add sp, sp, #4
	mov pc, lr

	
	.data	@ data memory starts here

answer:	.asciz "The value is %d\n"

