import random

def generate_inputs(filename):
    values = """\
    addi x1, x0, 1
    addi x2, x0, 2
    addi x3, x0, 3
    addi x4, x0, 4
    addi x5, x0, 5
    addi x6, x0, 6
    addi x7, x0, 7
    lui x8, 0x80002"""

    with open(filename, "w") as f:
        f.write(values)

        for instr in range(100):
            r1 = random.randint(1, 7)
            r2 = random.randint(1, 7)
            r3 = random.randint(1, 7)

            instr_type = random.randint(1, 7)

            match instr_type:
                # lw instruction
                case 1:
                    imm = random.randint(0, 30) * 4

                    f.write(f"\n\tlw x{r1}, {imm}(x8)")
                # sw instruction
                case 2:
                    imm = random.randint(0, 30) * 4

                    f.write(f"\n\tsw x{r1}, {imm}(x8)")
                # i-type instructions
                case 3:
                    imm = random.randint(-30, 30) * 4

                    i_instr = random.randint(1, 5)

                    match i_instr:
                        case 1:
                            f.write("\n\taddi ")
                        case 2:
                            f.write("\n\txori ")
                        case 3:
                            f.write("\n\tori ")
                        case 4:
                            f.write("\n\tandi ")
                        case 5:
                            f.write("\n\tslti ")
                    
                    f.write(f"x{r1}, x{r2}, {imm}")
                # b-type instructions
                case 4:
                    imm = random.randint(1, 3) * 4

                    if imm > 100 * 4:
                        continue

                    b_instr = random.randint(1, 2)

                    match b_instr:
                        # FIX: Added dot (.) for PC-relative branching
                        case 1:
                            f.write(f"\n\tbeq x{r1}, x{r2}, .+{imm}")
                        case 2:
                            f.write(f"\n\tbne x{r1}, x{r2}, .+{imm}")
                # r-type instructions
                case 5:
                    r_instr = random.randint(1, 6)

                    match r_instr:
                        case 1:
                            f.write("\n\tadd ")
                        case 2:
                            f.write("\n\tsub ")
                        case 3:
                            f.write("\n\txor ")
                        case 4:
                            f.write("\n\tor ")
                        case 5:
                            f.write("\n\tand ")
                        case 6:
                            f.write("\n\tslt ")

                    f.write(f"x{r1}, x{r2}, x{r3}")
                # jump instructions
                case 6:
                    imm = random.randint(1, 2) * 4

                    if imm > 100 * 4:
                        continue

                    j_instr = random.randint(1, 2)

                    match j_instr:
                        # FIX: Added dot (.) for PC-relative jumping
                        case 1:
                            f.write(f"\n\tjal x{r1}, .+{imm}")
                        case 2:
                            f.write(f"\n\tjal x{r1}, .+{imm}")
                # lui instruction
                case 7:
                    imm = random.randint(0, 1000)

                    f.write(f"\n\tlui x{r1}, {imm}")

        f.write("\n\nend_loop:")
        f.write("\n\tbeq x0, x0, end_loop\n")

if __name__ == "__main__":
    generate_inputs("instructions/test.S")