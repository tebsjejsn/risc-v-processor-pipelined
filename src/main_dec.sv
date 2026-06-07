module main_dec(
    input  logic [6:0] opcode,
    output logic [2:0] ImmType,
    output logic       ALUSrc,
    output logic [1:0] ResultSrc,
    output logic       MemWrite,
    output logic [1:0] JumpType,
    output logic       Branch,
    output logic       RegWrite
);
    always_comb
        case(opcode)
            // lw instruction
            7'b0000011: begin
                RegWrite = '1;
                ALUSrc = '1;
                MemWrite = '0;
                ResultSrc = 2'b01;
                ImmType = 3'b001;
                Branch = '0;
                JumpType = '0;
            end
            // sw instruction
            7'b0100011: begin
                RegWrite = '0;
                ALUSrc = '1;
                MemWrite = '1;
                ResultSrc = '0;
                ImmType = 3'b010;
                Branch = '0;
                JumpType = '0;
            end
            // i-type instructions (addi, xori, ori, andi, slti)
            7'b0010011: begin
                RegWrite = '1;
                ALUSrc = '1;
                MemWrite = '0;
                ResultSrc = '0;
                ImmType = 3'b001;
                Branch = '0;
                JumpType = '0;
            end
            // b-type instructions (beq, bne)
            7'b1100011: begin
                RegWrite = '0;
                ALUSrc = '0;
                MemWrite = '0;
                ResultSrc = '0;
                ImmType = 3'b011;
                Branch = '1;
                JumpType = '0;
            end
            // r-type instructions (add, sub, xor, or, and, slt)
            7'b0110011: begin
                RegWrite = '1;
                ALUSrc = '0;
                MemWrite = '0;
                ResultSrc = '0;
                ImmType = '0;
                Branch = '0;
                JumpType = '0;
            end
            // jal instruction
            7'b1101111: begin
                RegWrite = '1;
                MemWrite = '0;
                ResultSrc = 2'b10;
                ALUSrc = '1;
                ImmType = 3'b100;
                Branch = '0;
                JumpType = 2'b01;
            end
            // jalr instruction
            7'b1100111: begin
                RegWrite = '1;
                MemWrite = '0;
                ResultSrc = 2'b10;
                ALUSrc = '1;
                ImmType = 3'b001;
                Branch = '0;
                JumpType = 2'b10;
            end
            // lui instruction
            7'b0110111: begin
                RegWrite = '1;
                MemWrite = '0;
                ResultSrc = 2'b00;
                ALUSrc = '1;
                ImmType = 3'b101;
                Branch = '0;
                JumpType = '0;
            end
            default: begin
                RegWrite = '0;
                MemWrite = '0;
                ResultSrc = '0;
                ALUSrc = '0;
                ImmType = '0;
                Branch = '0;
                JumpType = '0;
            end
        endcase
endmodule