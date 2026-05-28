module alu_dec(
    input  logic [2:0] funct3,
    input  logic [6:0] funct7,
    input  logic [6:0] opcode,
    output logic [2:0] ALUControl
);
    always_comb
        begin
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
                        default: ALUControl = 3'b000;
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
                        default: ALUControl = 3'b000;
                    endcase
                end
                // b-type
                7'b1100011: ALUControl = 3'b001;
                // jal
                7'b1101111: ALUControl = 3'b000;
                // jalr
                7'b1100111: ALUControl = 3'b000;
                default: ALUControl = 3'b000;
            endcase
        end 
endmodule