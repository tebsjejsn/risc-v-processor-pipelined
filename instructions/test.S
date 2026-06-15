    addi x1, x0, 1
    addi x2, x0, 2
    addi x3, x0, 3
    addi x4, x0, 4
    addi x5, x0, 5
    addi x6, x0, 6
    addi x7, x0, 7
    lui x8, 0x80002
	beq x1, x5, .+4
	slt x1, x3, x7
	beq x3, x1, .+4
	lui x1, 742
	bne x3, x3, .+8
	lw x4, 80(x8)
	andi x6, x3, -68
	lui x6, 827
	bne x3, x4, .+12
	lw x1, 16(x8)
	lw x3, 4(x8)
	sw x7, 28(x8)
	beq x7, x7, .+12
	lw x2, 64(x8)
	jal x5, .+4
	or x4, x5, x1
	jal x6, .+8
	lw x7, 48(x8)
	sw x3, 16(x8)
	add x2, x2, x1
	lui x5, 193
	addi x7, x6, 112
	lw x2, 40(x8)
	slt x3, x7, x3
	slti x1, x5, 112
	sw x3, 0(x8)
	jal x5, .+8
	lui x6, 194
	xor x5, x1, x2
	lw x5, 8(x8)
	sw x5, 88(x8)
	beq x4, x5, .+8
	lui x1, 262
	bne x7, x4, .+8
	sw x7, 48(x8)
	lw x2, 88(x8)
	beq x2, x4, .+8
	jal x6, .+8
	bne x4, x3, .+4
	sw x7, 116(x8)
	sw x6, 0(x8)
	jal x3, .+8
	ori x7, x2, -92
	xori x4, x6, -100
	sw x2, 12(x8)
	and x6, x5, x6
	bne x1, x2, .+8
	lui x4, 254
	lw x5, 116(x8)
	jal x7, .+4
	xori x6, x5, -36
	slt x2, x7, x2
	lw x1, 68(x8)
	jal x4, .+8
	jal x4, .+8
	or x5, x1, x7
	add x7, x5, x5
	xor x6, x2, x3
	add x4, x5, x2
	sub x3, x2, x1
	add x2, x7, x7
	ori x6, x7, 24
	sw x1, 32(x8)
	bne x6, x2, .+12
	lw x6, 68(x8)
	lui x3, 984
	lui x3, 170
	lui x3, 942
	sw x6, 88(x8)
	beq x7, x4, .+8
	ori x2, x5, 0
	beq x6, x3, .+8
	lw x2, 80(x8)
	sub x5, x2, x2
	lui x1, 499
	beq x1, x3, .+4
	lw x2, 60(x8)
	sw x4, 84(x8)
	bne x3, x4, .+8
	sw x4, 36(x8)
	lui x7, 60
	add x1, x3, x3
	xori x2, x7, -48
	slt x2, x1, x4
	lui x3, 984
	slti x4, x2, 44
	lw x3, 60(x8)
	lui x3, 412
	xor x1, x7, x2
	jal x5, .+8
	or x5, x3, x3
	beq x7, x7, .+12
	lui x1, 488
	lui x6, 911
	lui x7, 668
	jal x5, .+8
	bne x2, x7, .+12
	lw x5, 8(x8)
	xori x3, x7, -104