# Operands to multiply
.data
a: .word 0xBAD
b: .word 0xFEED

.text
main:   # Load data from memory
		la      t3, a
        lw      t3, 0(t3)
        la      t4, b
        lw      t4, 0(t4)
        
        # t6 will contain the result
        add		t6, x0, x0

        # Mask for 16x8=24 multiply
        ori		t0, x0, 0xff
        slli	t0, t0, 8
        ori		t0, t0, 0xff
        slli	t0, t0, 8
        ori		t0, t0, 0xff
        
####################
# Start of your code
		# multiply bits 0 to 7 of a, with bits 0 to 15 of b, save in t6
		andi 	t5, t3, 0xff
		mul		t6, t4, t5
		and		t6, t6, t0
		
		# multiply bits 8 to 15 of a, with bits 0 to 15 of b
		srli	t5, t3, 8
		mul		t5, t4, t5
		and		t5, t5, t0
		slli	t5, t5, 8
		add		t6, t6, t5
# End of your code
####################
		
finish: addi    a0, x0, 1
        addi    a1, t6, 0
        ecall # print integer ecall
        addi    a0, x0, 10
        ecall # terminate ecall


