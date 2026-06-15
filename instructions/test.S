    addi x1, x0, 1
    addi x2, x0, 2
    addi x3, x0, 3
    addi x4, x0, 4
    addi x5, x0, 5
    addi x6, x0, 6
    addi x7, x0, 7
    lui x8, 0x80002
	sw x1, 52(x8)
	ori x7, x5, -112
	or x6, x3, x3
	lui x4, 124
	lui x6, 749
	lui x6, 920
	sw x1, 0(x8)
	lw x3, 96(x8)
	sw x5, 4(x8)
	lui x7, 107
	slti x1, x2, -12
	and x3, x6, x5
	slti x7, x5, 92
	ori x6, x3, -44
	add x7, x3, x3
	lui x1, 903
	or x6, x3, x3
	sw x7, 40(x8)
	sw x4, 20(x8)
	lw x1, 40(x8)
	jal x7, .+4
	lw x6, 76(x8)
	beq x6, x1, .+8
	or x6, x4, x6
	lw x1, 32(x8)
	beq x2, x3, .+8
	lw x5, 4(x8)
	lw x6, 112(x8)
	and x3, x2, x2
	jal x6, .+4
	beq x1, x3, .+12
	lw x2, 120(x8)
	sw x5, 100(x8)
	sw x6, 76(x8)
	andi x5, x5, -96
	bne x2, x5, .+8
	jal x3, .+8
	sw x2, 32(x8)
	jal x5, .+8
	sw x7, 68(x8)
	xor x4, x2, x1
	bne x7, x2, .+12
	lw x2, 48(x8)
	lui x2, 707
	slt x2, x6, x1
	lw x3, 120(x8)
	jal x2, .+4
	lui x7, 272
	sub x1, x5, x1
	lw x1, 64(x8)
	slti x7, x7, -36
	lui x7, 113
	sub x4, x7, x2
	addi x2, x2, 112
	add x3, x7, x1
	lw x5, 64(x8)
	addi x7, x3, 64
	sw x4, 64(x8)
	bne x6, x2, .+8
	andi x2, x7, 28
	beq x4, x2, .+12
	beq x4, x6, .+8
	and x1, x3, x1
	lw x4, 44(x8)
	jal x7, .+4
	lw x1, 40(x8)
	lw x6, 76(x8)
	lui x4, 527
	lui x6, 853
	addi x4, x2, 76
	lw x2, 16(x8)
	jal x6, .+4
	sw x5, 92(x8)
	jal x4, .+8
	lw x1, 16(x8)
	xori x6, x4, -32
	jal x2, .+4
	sw x6, 64(x8)
	xor x3, x1, x3
	slt x1, x7, x1
	lw x5, 36(x8)
	ori x7, x5, -16
	sw x1, 96(x8)
	bne x2, x3, .+4
	lw x1, 100(x8)
	sw x6, 72(x8)
	and x5, x6, x7
	lui x5, 366
	lw x2, 20(x8)
	or x7, x1, x5
	beq x2, x4, .+12
	sw x1, 64(x8)
	jal x5, .+8
	lw x3, 8(x8)
	slti x4, x4, 68
	bne x2, x4, .+12
	and x5, x1, x4
	sw x6, 32(x8)
	bne x3, x5, .+4
	beq x2, x2, .+4
	jal x3, .+8
	beq x7, x1, .+8
	sw x4, 36(x8)
	sub x4, x3, x5
	lw x5, 36(x8)
	ori x2, x7, 48
	bne x1, x5, .+4
	jal x2, .+4
	andi x2, x5, -16
	bne x7, x1, .+8
	addi x5, x3, -96
	xor x7, x4, x6
	lui x4, 398
	add x5, x5, x2
	sw x5, 16(x8)
	lui x4, 354
	jal x1, .+4
	addi x5, x1, 36
	addi x1, x2, 60
	lui x2, 349
	xori x7, x6, -68
	lw x5, 16(x8)
	sw x3, 24(x8)
	jal x2, .+4
	lw x6, 60(x8)
	lui x3, 671
	sw x5, 28(x8)
	lw x6, 60(x8)
	jal x6, .+8
	sw x4, 68(x8)
	bne x3, x4, .+12
	sw x6, 68(x8)
	lw x7, 64(x8)
	lw x2, 28(x8)
	slti x1, x6, 48
	sw x2, 16(x8)
	lui x7, 894
	andi x6, x4, 68
	sw x6, 100(x8)
	lui x2, 709
	lui x7, 101
	lui x3, 661
	lui x3, 867
	lui x2, 239
	beq x6, x2, .+4
	xor x2, x6, x2
	bne x7, x1, .+4
	add x6, x5, x7
	andi x3, x7, 40
	lw x5, 16(x8)
	and x3, x2, x4
	lui x7, 408
	lui x3, 450
	xori x4, x3, 44
	jal x4, .+4
	lui x1, 92
	addi x5, x5, -88
	sw x7, 0(x8)
	jal x3, .+4
	sw x6, 48(x8)
	lw x6, 36(x8)
	lui x3, 626
	slti x7, x2, -116
	xor x2, x2, x5
	jal x4, .+4
	jal x5, .+4
	sw x5, 8(x8)
	lw x4, 48(x8)
	jal x3, .+8
	sw x4, 28(x8)
	jal x5, .+8
	lw x2, 60(x8)
	lui x4, 71
	sw x4, 56(x8)
	lw x3, 40(x8)
	lui x1, 610
	lui x3, 286
	bne x1, x6, .+12
	sw x7, 52(x8)
	jal x1, .+8
	sw x2, 96(x8)
	jal x1, .+8
	slt x5, x6, x6
	add x6, x6, x3
	lui x1, 196
	jal x6, .+4
	jal x3, .+8
	lw x3, 108(x8)
	sw x1, 72(x8)
	lui x3, 149
	jal x2, .+4
	sw x6, 0(x8)
	and x6, x4, x4
	lui x2, 662
	bne x4, x4, .+8
	jal x7, .+8
	sw x5, 80(x8)
	jal x6, .+8
	jal x6, .+8
	beq x6, x4, .+4
	and x6, x5, x3
	and x2, x3, x3
	jal x5, .+4
	sw x4, 4(x8)
	sw x2, 120(x8)
	beq x3, x6, .+12
	lw x5, 48(x8)
	jal x1, .+8
	lw x3, 76(x8)
	lui x5, 986
	lui x7, 295
	lui x7, 225
	lui x5, 410
	addi x4, x7, 40
	sub x6, x3, x7
	jal x5, .+4
	lui x4, 205
	ori x6, x6, 20
	sub x3, x2, x3
	lui x4, 954
	sw x5, 100(x8)
	jal x5, .+8
	lw x6, 44(x8)
	sw x1, 16(x8)
	ori x6, x1, 40
	or x1, x5, x1
	jal x3, .+4
	bne x1, x5, .+8
	xor x5, x5, x4
	xori x7, x4, -28
	lui x1, 710
	bne x6, x2, .+12
	lw x5, 8(x8)
	sub x2, x5, x7
	lw x5, 48(x8)
	lui x4, 487
	jal x1, .+8
	xori x3, x6, 88
	lw x4, 16(x8)
	lw x6, 76(x8)
	or x5, x1, x3
	lui x2, 842
	sub x5, x4, x7
	sw x5, 56(x8)
	beq x1, x5, .+8
	ori x7, x2, 48
	bne x3, x7, .+12
	jal x6, .+8
	lw x5, 96(x8)
	jal x7, .+4
	lw x5, 100(x8)
	jal x7, .+4
	jal x3, .+4
	add x3, x6, x2
	sw x3, 96(x8)
	xori x2, x2, 60
	bne x7, x7, .+12
	bne x2, x6, .+12
	or x6, x7, x5
	sw x7, 40(x8)
	jal x6, .+8
	addi x1, x7, 120
	xor x6, x3, x3
	jal x4, .+4
	jal x6, .+4
	jal x4, .+4
	lw x4, 8(x8)
	jal x6, .+4
	xor x6, x6, x5
	lw x5, 40(x8)
	sw x6, 60(x8)
	bne x3, x1, .+4
	ori x5, x6, 64
	lw x2, 48(x8)
	sw x7, 84(x8)
	sw x1, 116(x8)
	bne x4, x4, .+12
	sw x5, 12(x8)
	jal x6, .+8
	lui x5, 988
	slt x6, x1, x1
	sw x5, 56(x8)
	bne x5, x2, .+4
	jal x2, .+4
	sub x3, x4, x2
	addi x5, x4, -112
	slti x4, x5, -36
	sw x2, 48(x8)
	sw x3, 36(x8)
	sw x2, 76(x8)
	jal x5, .+4
	jal x6, .+8
	xor x3, x7, x4
	sw x5, 12(x8)
	sub x4, x2, x2
	add x6, x3, x2
	sw x1, 108(x8)
	sw x3, 112(x8)
	slti x2, x4, -88
	lw x5, 52(x8)
	lui x4, 713
	slt x3, x6, x7
	beq x4, x2, .+4
	lui x4, 969
	sub x4, x1, x6
	jal x5, .+8
	sub x7, x2, x6
	lui x7, 209
	andi x5, x5, 8
	sw x4, 60(x8)
	jal x4, .+4
	jal x1, .+4
	bne x1, x4, .+4
	bne x1, x4, .+8
	xori x6, x2, -24
	sw x1, 32(x8)
	lui x7, 230
	andi x7, x1, 56
	lw x2, 0(x8)
	jal x5, .+4
	jal x5, .+8
	lui x7, 42
	or x2, x3, x1
	sw x5, 28(x8)
	jal x2, .+8
	addi x5, x1, -8
	bne x2, x7, .+4
	jal x5, .+8
	lw x5, 0(x8)
	sw x1, 76(x8)
	lw x1, 32(x8)
	jal x7, .+4
	sw x5, 80(x8)
	jal x7, .+4
	lui x1, 613
	sw x3, 112(x8)
	beq x2, x3, .+4
	lw x5, 48(x8)
	lui x2, 679
	sub x6, x7, x1
	beq x1, x1, .+8
	sw x1, 100(x8)
	lw x3, 56(x8)
	bne x4, x6, .+12
	beq x1, x2, .+8
	bne x6, x7, .+12
	beq x2, x7, .+12
	jal x4, .+8
	sw x7, 8(x8)
	sw x5, 44(x8)
	lw x4, 0(x8)
	add x3, x5, x7
	xori x7, x4, -60
	lui x6, 997
	sw x2, 36(x8)
	addi x6, x7, -12
	xori x3, x5, 56
	xori x3, x7, -64
	jal x5, .+8
	andi x4, x1, 120
	jal x4, .+4
	sub x2, x6, x2
	bne x7, x3, .+12
	lui x6, 226
	lui x2, 827
	andi x1, x1, -40
	sw x5, 76(x8)
	andi x5, x3, -24
	lui x4, 45
	andi x5, x6, 64
	bne x6, x5, .+12
	bne x3, x3, .+8
	lui x7, 795
	lui x1, 280
	jal x4, .+8
	lw x5, 108(x8)
	jal x1, .+8
	sw x6, 0(x8)
	ori x3, x4, 48
	sub x3, x5, x5
	jal x1, .+8
	lw x2, 72(x8)
	jal x7, .+4
	beq x4, x7, .+12
	bne x1, x2, .+8
	sw x3, 92(x8)
	jal x4, .+8
	lw x2, 16(x8)
	lw x6, 36(x8)
	beq x2, x5, .+4
	xori x5, x4, 8
	lui x1, 89
	jal x6, .+4
	lui x6, 294
	lw x2, 32(x8)
	slt x1, x7, x3
	add x1, x7, x6
	jal x5, .+4
	jal x3, .+4
	andi x6, x4, -28
	lw x5, 96(x8)
	lui x2, 522
	sw x6, 116(x8)
	or x2, x1, x1
	sub x3, x6, x3
	jal x6, .+4
	or x6, x1, x6
	jal x4, .+4
	jal x1, .+8
	bne x7, x3, .+4
	lw x2, 92(x8)
	lui x7, 726
	lw x7, 72(x8)
	jal x4, .+8
	xori x1, x7, -96
	lw x6, 52(x8)
	bne x1, x3, .+8
	lui x7, 60
	beq x4, x3, .+4
	slt x5, x1, x4
	sw x7, 52(x8)
	jal x2, .+4
	jal x3, .+4
	lui x7, 311
	lw x1, 100(x8)
	sw x7, 112(x8)
	lui x7, 761
	ori x4, x3, 68
	lui x6, 111
	addi x5, x1, -96
	jal x5, .+4
	sw x7, 104(x8)
	and x1, x2, x3
	lui x1, 665
	xor x6, x5, x6
	sw x6, 92(x8)
	jal x2, .+8
	jal x6, .+4
	add x7, x7, x2
	sw x2, 16(x8)
	lw x5, 108(x8)
	sub x1, x4, x2
	sw x3, 64(x8)
	ori x6, x2, 72
	jal x3, .+8
	lui x7, 240
	andi x6, x5, -52
	bne x6, x5, .+8
	jal x4, .+8
	sw x5, 8(x8)
	sw x1, 12(x8)
	andi x7, x3, 52
	lw x1, 44(x8)
	lui x5, 268
	andi x3, x7, 84
	beq x1, x1, .+12
	addi x5, x4, -96
	sw x6, 120(x8)
	lui x2, 413
	jal x4, .+4
	xori x7, x4, 104
	lw x4, 52(x8)
	sw x2, 100(x8)
	xori x3, x2, -32
	xor x4, x2, x7
	bne x3, x7, .+4
	lui x1, 338
	xori x4, x3, 104
	jal x3, .+4
	addi x5, x4, 96
	add x2, x7, x3
	bne x6, x6, .+8
	lw x1, 100(x8)
	ori x4, x7, 116
	sw x5, 60(x8)
	jal x4, .+8
	sw x1, 80(x8)
	jal x4, .+4
	jal x6, .+8
	bne x2, x3, .+8
	lw x3, 64(x8)
	jal x1, .+4
	lui x2, 706
	slt x4, x2, x7
	slti x3, x2, 112
	lw x2, 0(x8)
	jal x4, .+8
	sw x6, 0(x8)
	xor x4, x4, x4
	sw x4, 80(x8)
	bne x3, x7, .+8
	sw x4, 64(x8)
	bne x5, x4, .+4
	xori x2, x4, -116
	bne x3, x3, .+12
	slt x6, x4, x7
	lui x4, 509
	sw x6, 76(x8)
	bne x7, x5, .+4
	or x2, x4, x1
	jal x5, .+4
	sw x6, 44(x8)
	lw x5, 52(x8)
	addi x7, x2, 28
	lw x4, 96(x8)
	lw x3, 104(x8)
	sw x5, 116(x8)
	sw x2, 116(x8)
	lui x6, 391
	lw x7, 116(x8)
	lui x1, 870
	lui x7, 353
	beq x7, x1, .+12
	addi x5, x1, -100
	or x4, x2, x7
	jal x3, .+4
	jal x5, .+8
	lui x2, 780
	or x7, x7, x1
	sw x1, 0(x8)
	lw x3, 88(x8)
	lw x6, 64(x8)
	sw x6, 64(x8)
	lui x6, 6
	sw x2, 76(x8)
	lui x6, 989
	jal x2, .+4
	lui x3, 253
	ori x3, x2, 12
	bne x3, x2, .+8
	lui x5, 457
	lui x3, 877
	lui x5, 187
	lui x7, 746
	lui x7, 205
	bne x7, x6, .+4
	sw x6, 84(x8)
	slti x7, x1, -28
	ori x1, x1, -36
	jal x2, .+4
	slt x6, x5, x5
	lui x5, 444
	ori x7, x3, -104
	andi x6, x4, -56
	jal x2, .+4
	jal x1, .+8
	bne x6, x4, .+8
	sub x2, x2, x3
	jal x1, .+4
	slt x7, x3, x2
	lw x2, 44(x8)
	lui x5, 62
	lw x5, 16(x8)
	xori x5, x4, -12
	lui x7, 413
	ori x3, x5, 68
	jal x7, .+4
	beq x6, x1, .+12
	lui x3, 697
	jal x7, .+8
	sw x1, 76(x8)
	slt x3, x7, x7
	beq x1, x6, .+4
	ori x3, x6, -36
	jal x7, .+8
	bne x5, x3, .+8
	sw x5, 120(x8)
	beq x1, x7, .+4
	jal x3, .+4
	lui x5, 699
	sub x1, x7, x2
	lui x3, 975
	beq x2, x6, .+4
	lui x5, 368
	lw x4, 116(x8)
	xori x2, x2, -92
	ori x2, x1, -48
	lw x5, 56(x8)
	xori x5, x6, 56
	jal x1, .+4
	jal x3, .+8
	bne x6, x4, .+8
	sw x5, 108(x8)
	xori x4, x1, -64
	sub x6, x3, x2
	lw x7, 16(x8)
	jal x5, .+8
	sub x1, x7, x2
	jal x6, .+4
	jal x3, .+4
	xori x4, x3, -12
	jal x4, .+8
	beq x1, x7, .+8
	sw x2, 80(x8)
	xori x6, x5, 84
	lui x6, 380
	lw x4, 4(x8)
	ori x5, x7, 96
	sw x2, 116(x8)
	jal x3, .+4
	lui x6, 96
	jal x5, .+4
	lui x7, 632
	bne x3, x7, .+8
	jal x5, .+8
	jal x6, .+4
	jal x6, .+8
	lui x6, 982
	lw x3, 64(x8)
	jal x5, .+4
	andi x5, x3, 8
	slt x6, x5, x3
	lui x2, 604
	lui x1, 117
	bne x5, x1, .+8
	andi x5, x3, -104
	lui x2, 845
	jal x5, .+4
	jal x2, .+4
	sw x1, 56(x8)
	sw x6, 4(x8)
	and x3, x3, x1
	sw x6, 116(x8)
	slt x2, x5, x6
	lw x3, 36(x8)
	andi x2, x5, 112
	sw x4, 108(x8)
	jal x7, .+8
	sub x4, x5, x5
	jal x2, .+8
	lui x5, 104
	lui x5, 520
	lw x4, 64(x8)
	jal x4, .+8
	lui x1, 738
	sw x7, 40(x8)
	lui x1, 756
	sw x5, 76(x8)
	addi x1, x3, 8
	lui x1, 93
	ori x1, x7, 28
	ori x4, x1, 32
	lui x2, 859
	slt x1, x2, x6
	addi x4, x2, 68
	and x5, x7, x6
	bne x2, x7, .+12
	addi x1, x2, -20
	sw x1, 108(x8)
	lui x6, 287
	lui x4, 973
	lw x4, 120(x8)
	lui x3, 728
	sw x1, 68(x8)
	lw x6, 116(x8)
	jal x1, .+8
	lui x4, 522
	xori x1, x4, -88
	sw x2, 60(x8)
	sw x3, 68(x8)
	jal x2, .+8
	add x7, x5, x7
	jal x4, .+8
	sw x3, 76(x8)
	slti x4, x5, -16
	andi x3, x6, 40
	slt x7, x5, x6
	xori x5, x7, 52
	ori x4, x5, 24
	lui x7, 368
	lui x6, 496
	slti x2, x5, 76
	lw x1, 108(x8)
	sw x5, 96(x8)
	ori x7, x2, 108
	sw x7, 76(x8)
	lw x1, 20(x8)
	lui x1, 848
	or x1, x7, x6
	slt x3, x7, x3
	lui x2, 563
	lui x7, 134
	slt x6, x1, x5
	lw x3, 68(x8)
	lui x5, 247
	addi x2, x7, -4
	jal x4, .+4
	lui x3, 656
	beq x3, x7, .+8
	lw x7, 52(x8)
	bne x3, x1, .+12
	sw x2, 24(x8)
	sub x4, x6, x2
	lw x1, 36(x8)
	and x5, x5, x5
	andi x2, x1, 28
	lw x6, 96(x8)
	jal x2, .+8
	lui x1, 865
	sw x4, 20(x8)
	beq x6, x1, .+12
	slt x4, x1, x4
	sw x4, 60(x8)
	slt x5, x7, x6
	jal x6, .+4
	lui x2, 465
	lui x2, 444
	slti x6, x7, 60
	bne x2, x1, .+12
	lw x2, 16(x8)
	jal x6, .+4
	ori x5, x2, 104
	xori x4, x4, 4
	jal x1, .+8
	or x4, x2, x1
	addi x1, x1, 8
	and x2, x5, x5
	add x2, x6, x6
	lw x7, 104(x8)
	sub x3, x1, x6
	sw x6, 20(x8)
	lw x5, 12(x8)
	lui x4, 484
	slti x4, x1, -88
	jal x5, .+4
	slt x4, x6, x3
	ori x7, x7, -48
	xori x6, x2, -44
	and x4, x7, x6
	xor x7, x3, x6
	lw x1, 28(x8)
	beq x6, x3, .+8
	xori x1, x1, -60
	sw x3, 76(x8)
	ori x2, x4, -12
	andi x5, x7, -96
	slti x2, x1, -12
	sw x6, 20(x8)
	and x6, x6, x7
	or x5, x1, x2
	lw x7, 48(x8)
	lw x7, 68(x8)
	bne x7, x3, .+4
	or x6, x4, x6
	lui x5, 257
	sw x6, 68(x8)
	xor x1, x1, x4
	lui x2, 768
	lw x1, 20(x8)
	sw x2, 84(x8)
	sw x5, 68(x8)
	sub x4, x7, x7
	ori x7, x1, -32
	beq x2, x5, .+4
	jal x4, .+4
	sw x5, 80(x8)
	sw x1, 48(x8)
	beq x3, x6, .+8
	bne x5, x5, .+4
	lui x2, 476
	or x7, x1, x2
	sw x3, 20(x8)
	slt x1, x5, x4
	slt x7, x3, x3
	xor x7, x4, x2
	jal x3, .+4
	lw x6, 64(x8)
	beq x2, x2, .+4
	slti x5, x1, -16
	jal x2, .+4
	addi x1, x7, -40
	lui x1, 427
	slti x2, x4, -76
	sw x4, 108(x8)
	jal x6, .+4
	lw x1, 64(x8)
	beq x7, x7, .+4
	lw x5, 104(x8)
	lw x3, 28(x8)
	xori x6, x3, -16
	jal x4, .+4
	jal x5, .+8
	lui x6, 511
	sw x7, 40(x8)
	andi x1, x1, -28
	sub x4, x3, x2
	lw x3, 92(x8)
	beq x5, x4, .+12
	lui x5, 614
	lw x7, 104(x8)
	slti x7, x5, -100
	sw x7, 116(x8)
	bne x5, x3, .+12
	lui x2, 550
	beq x3, x2, .+8
	ori x1, x6, 84
	sw x1, 92(x8)
	lw x3, 120(x8)
	xor x5, x5, x1
	lui x1, 725
	add x2, x6, x2
	jal x1, .+8
	lw x4, 108(x8)
	slti x4, x4, 80
	lw x2, 40(x8)
	ori x5, x7, 76
	jal x1, .+4
	lui x5, 573
	lw x1, 112(x8)
	sw x1, 12(x8)
	andi x1, x2, 24
	slti x5, x2, 120
	sw x1, 60(x8)
	beq x1, x2, .+12
	sw x6, 76(x8)
	lw x7, 0(x8)
	jal x3, .+8
	lw x1, 44(x8)
	ori x6, x2, 112
	sw x1, 24(x8)
	lui x4, 687
	bne x4, x4, .+4
	lw x4, 24(x8)
	bne x4, x2, .+12
	lui x4, 242
	sw x7, 12(x8)
	bne x4, x5, .+12
	lui x1, 749
	slt x4, x5, x6
	andi x2, x3, -32
	lui x4, 226
	lui x6, 631
	sw x3, 76(x8)
	beq x2, x3, .+8
	lw x1, 52(x8)
	lw x1, 12(x8)
	lw x6, 72(x8)
	beq x6, x5, .+4
	sw x6, 0(x8)
	jal x3, .+4
	lui x1, 948
	and x6, x2, x6
	bne x6, x6, .+4
	lw x1, 120(x8)
	ori x7, x2, 104
	lui x4, 351
	jal x3, .+4
	xori x6, x7, -72
	ori x5, x2, 68
	lw x3, 100(x8)
	sw x3, 112(x8)
	lw x4, 48(x8)
	jal x4, .+8
	lw x3, 8(x8)
	sw x1, 52(x8)
	and x1, x7, x1
	lw x3, 80(x8)
	jal x2, .+8
	jal x4, .+4
	lui x6, 198
	sw x4, 104(x8)
	beq x5, x5, .+4
	lui x6, 574
	jal x3, .+8
	slti x6, x6, -52
	sw x4, 120(x8)
	bne x1, x7, .+12
	lui x3, 31
	jal x6, .+8
	sub x3, x1, x5
	beq x5, x4, .+8
	addi x1, x7, 44
	sw x3, 100(x8)
	andi x3, x2, -108
	addi x6, x6, 64
	beq x7, x2, .+12
	sw x1, 36(x8)
	lui x3, 857
	lui x1, 306
	jal x5, .+4
	lw x6, 8(x8)
	jal x5, .+8
	sw x3, 104(x8)
	sw x2, 40(x8)
	jal x3, .+8
	lui x2, 546
	sw x2, 4(x8)
	beq x5, x3, .+12
	lui x6, 594
	lui x7, 895
	jal x2, .+4
	lui x6, 233
	and x3, x2, x1
	bne x3, x6, .+12
	sub x1, x4, x4
	slt x3, x1, x1
	addi x6, x1, 116
	lw x7, 36(x8)
	sw x4, 80(x8)
	jal x1, .+4
	sw x1, 112(x8)
	lui x5, 792
	bne x3, x4, .+12
	xori x5, x2, 68
	lui x1, 551
	beq x4, x2, .+8
	beq x4, x7, .+8
	lw x4, 20(x8)
	jal x5, .+8
	beq x4, x7, .+4
	lui x7, 183
	jal x2, .+8
	slt x1, x6, x6
	add x6, x6, x1
	lw x7, 76(x8)
	add x2, x2, x6
	lw x5, 68(x8)
	sw x5, 108(x8)
	lui x7, 816
	bne x2, x5, .+12
	jal x4, .+8
	jal x1, .+4
	slti x3, x1, -64
	ori x5, x4, -104
	lw x3, 104(x8)
	jal x6, .+8
	slti x4, x6, -16
	beq x6, x5, .+4
	sw x2, 68(x8)
	sw x1, 44(x8)
	sw x7, 96(x8)
	sw x2, 16(x8)
	jal x3, .+4
	jal x6, .+8
	or x4, x1, x5
	lw x6, 100(x8)
	slti x1, x1, -116
	bne x6, x7, .+4
	beq x3, x3, .+4
	beq x1, x1, .+4
	sub x1, x4, x4
	jal x4, .+8
	jal x6, .+8
	lw x5, 8(x8)
	lui x4, 794
	sw x2, 12(x8)
	lw x7, 112(x8)
	jal x1, .+4
	xori x7, x4, -80
	or x5, x5, x2
	sw x1, 44(x8)
	bne x4, x3, .+12
	lw x5, 108(x8)
	andi x7, x3, -72
	slt x6, x5, x3
	sw x4, 20(x8)
	bne x4, x1, .+12
	bne x3, x3, .+4
	jal x3, .+4
	beq x4, x5, .+4
	slti x5, x6, 108
	sw x4, 76(x8)
	bne x2, x4, .+4
	sw x6, 100(x8)
	lw x1, 28(x8)
	lui x4, 155
	andi x3, x6, -44
	lui x6, 277
	jal x7, .+8
	bne x1, x1, .+12
	jal x7, .+8
	lw x3, 68(x8)
	beq x7, x3, .+4
	bne x4, x2, .+8
	slt x1, x5, x6
	and x5, x2, x5
	sub x2, x1, x1
	or x7, x3, x3
	beq x6, x5, .+8
	beq x6, x5, .+12
	lui x2, 257
	jal x3, .+4
	jal x7, .+8
	lw x2, 76(x8)
	sw x5, 96(x8)
	or x7, x7, x7
	lw x2, 4(x8)
	xor x7, x1, x1
	lw x4, 120(x8)
	lw x2, 16(x8)
	bne x6, x6, .+12
	jal x2, .+8
	bne x1, x1, .+12
	and x4, x1, x1
	bne x2, x5, .+12
	lw x2, 60(x8)
	lui x3, 535
	jal x7, .+4
	xor x7, x3, x5
	ori x7, x1, 116

end_loop:
	beq x0, x0, end_loop
