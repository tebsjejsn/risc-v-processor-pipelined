module extend(
    input  logic [31:7] instr,
    input  logic [2:0]  immtype,
    output logic [31:0] immext
);
    logic [11:0] imm12;
    logic [12:0] imm13;
    logic [20:0] imm21;

    always_comb
        case(immtype)
            3'b000: immext = {32{1'b0}};
            3'b001: begin
                imm12 = instr[31:20];
                immext = {{20{instr[31]}}, imm12};
            end
            3'b010: begin
                imm12 = {instr[31:25], instr[11:7]};
                immext = {{20{instr[31]}}, imm12};
            end
            3'b011: begin
                imm13 = {instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};
                immext = {{19{instr[31]}}, imm13};
            end
            3'b100: begin
                imm21 = {instr[31], instr[19:12], instr[20], instr[30:21], 1'b0};
                immext = {{11{instr[31]}}, imm21};
            end
            default: immext = {32{1'b0}};
        endcase
endmodule