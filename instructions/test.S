.global _start
_start:
    addi x2, x0, 0x40
    addi x1, x0, 42
    sw x1, 0(x2)
    lw x4, 0(x2)
    addi x5, x0, 12
    sub x3, x4, x5
end_loop:
    jal x0, end_loop