    addi x1, x0, 1
    addi x2, x0, 2
    addi x3, x0, 3
    addi x4, x0, 4
    addi x5, x0, 5
    addi x6, x0, 6
    addi x7, x0, 7
    lui x8, 0x80002
	or x6, x3, x2
	ori x5, x5, -68
	jal x6, .+8
	lw x1, 4(x8)
	add x5, x4, x7
	beq x3, x6, .+4
	xori x4, x2, -28
	sw x2, 68(x8)
	beq x5, x1, .+12
	lui x5, 827
	sw x5, 24(x8)
	jal x6, .+4
	sw x5, 56(x8)
	bne x1, x5, .+12
	jal x3, .+4
	bne x2, x1, .+12
	beq x7, x2, .+12
	lw x6, 96(x8)
	lui x2, 620
	lw x4, 36(x8)
	lw x3, 116(x8)
	lw x1, 20(x8)
	jal x2, .+4
	sw x1, 8(x8)
	lui x5, 846
	ori x7, x7, 84
	andi x3, x7, 56
	lui x4, 329
	beq x3, x2, .+12
	jal x3, .+8
	lw x3, 8(x8)
	lw x4, 44(x8)
	lw x3, 104(x8)
	jal x4, .+8
	beq x5, x3, .+8
	jal x5, .+4
	add x1, x3, x1
	sw x5, 116(x8)
	ori x2, x4, -88
	lw x4, 80(x8)
	beq x7, x2, .+4
	jal x1, .+4
	and x5, x6, x3
	sw x6, 24(x8)
	sw x5, 4(x8)
	bne x4, x4, .+12
	sw x4, 0(x8)
	lui x5, 541
	andi x4, x2, -80
	sw x2, 84(x8)
	bne x5, x7, .+4
	jal x2, .+8
	sw x5, 88(x8)
	andi x2, x2, -40
	bne x7, x7, .+8
	jal x1, .+8
	jal x7, .+4
	beq x1, x6, .+8
	slt x1, x3, x7
	jal x3, .+8
	sub x6, x5, x5
	lui x3, 979
	bne x5, x7, .+12
	jal x3, .+4
	sw x3, 20(x8)
	sw x3, 96(x8)
	lui x7, 10
	jal x1, .+8
	slt x1, x7, x4
	and x6, x2, x3
	sw x7, 108(x8)
	xori x2, x5, -60
	lui x3, 769
	sw x6, 36(x8)
	jal x7, .+4
	xori x7, x5, 80
	slti x4, x1, 112
	lw x2, 44(x8)
	andi x3, x1, -8
	sw x5, 4(x8)
	jal x1, .+4
	ori x5, x6, 32
	jal x6, .+8
	sub x4, x4, x4
	and x3, x7, x7
	lw x1, 108(x8)
	or x7, x7, x2
	sub x5, x4, x2
	addi x6, x2, -108
	andi x5, x4, -76
	xori x2, x2, 76
	lw x3, 64(x8)
	lw x7, 16(x8)
	andi x1, x5, -104
	sw x1, 24(x8)
	bne x6, x1, .+12
	lw x1, 96(x8)
	bne x2, x2, .+8
	lw x1, 96(x8)
	lw x3, 40(x8)

end_loop:
	beq x0, x0, end_loop
