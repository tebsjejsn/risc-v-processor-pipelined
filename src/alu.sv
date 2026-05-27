module alu(
    input  logic [31:0] SrcA,
    input  logic [31:0] SrcB,
    input  logic [2:0]  ALUControl,
    output logic        Zero,
    output logic [31:0] ALUResult
);
    logic signed [31:0] A;
    logic signed [31:0] B;

    assign A = signed'(SrcA);
    assign B = signed'(SrcB);
    
    always_comb
        begin
            case(ALUControl)
                3'b000: 
                    ALUResult = A + B;
                3'b001: 
                    ALUResult = A - B;
                3'b010: begin
                    ALUResult = {32{1'b0}};
                    if (A < B) ALUResult[0] = 1;
                end
                3'b100: 
                    ALUResult = SrcA ^ SrcB;
                3'b110: 
                    ALUResult = SrcA | SrcB;
                3'b111: 
                    ALUResult = SrcA & SrcB;
                default: 
                    ALUResult = {32{1'b0}};
            endcase

            if ((A -B) == 0)
                Zero = 1;
            else
                Zero = 0;
        end
endmodule