addi x4, x0, 5
slti x5, x4, 2
add  x3, x4, x5
addi x1, x0, 7
end_loop:
    jal  x0, end_loop
