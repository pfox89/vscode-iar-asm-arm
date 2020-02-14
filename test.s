@	test.s
@	dan-c-underwood
@	Version - 1.1.0
@	15/08/15
@
@	Description - Example ARM Source File

strings:
string_a: 		defw	"Awaiting input"
string_b:		defb    'a', 'b', 'c', 'd'

branches:
		b		start			@ With comment!
		bne     end
		bl      linked_place

		.include "test.s"


#if defined(TEST)
	nop
#endif

#if ARM_ASSEMBLY
	svc 0
#endif

stack:
stack_end:      defs	512		@ Stack Declaration


		/* C Style comments
		Can be multiline */
start:
		adr		r6, stack_end
		mov		r0, #&3f
		bic		r2, r0
		mov		r1, sp
		strb	r0, [r1, #stack]
		nop
		stmfd	sp!, {r0-r2, lr}
		movs	r2, r2, lsr #1
		cmp		r0, r2
		adds	r0, r0, #&1
		bne		start
		ldmfd	sp!, {r0-r2, pc}^

end:
		svc	0
