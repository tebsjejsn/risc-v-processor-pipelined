module alu_dec(
    input  logic [2:0] funct3,
    input  logic [6:0] funct7,
    input  logic [6:0] opcode,
    output logic [2:0] ALUControl,
    output logic [2:0] FControl
);
    always_comb
        begin
            ALUControl = 3'b000;
            FControl = 3'b000;

            case(opcode)
                // lw
                7'b0000011: ALUControl = 3'b000;
                // sw
                7'b0100011: ALUControl = 3'b000;
                // r-type
                7'b0110011: begin
                    case(funct3) 
                    // add/sub
                        3'b000: begin
                            // add
                            if (funct7 == 7'b0000000)
                                ALUControl = 3'b000;
                            // sub
                            else
                                ALUControl = 3'b001;
                        end
                        // xor
                        3'b100: ALUControl = 3'b100;
                        // or
                        3'b110: ALUControl = 3'b110;
                        // and
                        3'b111: ALUControl = 3'b111;
                        // slt
                        3'b010: ALUControl = 3'b010;
                    endcase
                end
                // i-type
                7'b0010011: begin
                    case(funct3)
                        // addi
                        3'b000: ALUControl = 3'b000;
                        // xori
                        3'b100: ALUControl = 3'b100;
                        // ori
                        3'b110: ALUControl = 3'b110;
                        // andi
                        3'b111: ALUControl = 3'b111;
                        // slti
                        3'b010: ALUControl = 3'b010;
                    endcase
                end
                // b-type
                7'b1100011: ALUControl = 3'b001;
                // jal
                7'b1101111: ALUControl = 3'b000;
                // jalr
                7'b1100111: ALUControl = 3'b000;
                // lui
                7'b0110111: ALUControl = 3'b101;
                // flw
                7'b0000111: ALUControl = 3'b000;
                // fsw
                7'b0100111: ALUControl = 3'b000;
                // other fpu
                7'b1010011: begin
                    case (funct7)
                        // fadd.s
                        7'b0000000: FControl = 3'b000;
                        // fsub.s
                        7'b0000100: FControl = 3'b001;
                        // fmul.s
                        7'b0001000: FControl = 3'b010;
                        // fdiv.s
                        7'b0001100: FControl = 3'b011;
                        // flt.s, feq.s
                        7'b1010000: begin
                            case (funct3)
                                // flt.s
                                3'b001: FControl = 3'b100;
                                // feq.s
                                3'b010: FControl = 3'b101;
                            endcase
                        end
                    endcase
                end
            endcase
        end 
endmodule