addi x1, x0, 1
    addi x2, x0, 2
    add  x3, x1, x2
    sub  x4, x3, x1
    beq  x4, x2, branch_target
    addi x5, x0, 99
    add  x6, x5, x5
    addi x7, x0, 99

branch_target:
    addi x8, x4, 1

end_loop:
    beq  x0, x0, end_loop