module pc_dec(
    input  logic       Branch,
    input  logic [1:0] JumpType,
    input  logic       Zero,
    input  logic [2:0] funct3,
    output logic [1:0] PCSrc
);
    always_comb
        if (Branch == '1 && ((Zero == '1 && funct3 == '0) || (Zero == '0 && funct3 == 3'b001)))
            PCSrc = 2'b01;
        else if (JumpType == 2'b01)
            PCSrc = 2'b01;
        else if (JumpType == 2'b10)
            PCSrc = 2'b10;
        else
            PCSrc = '0;
endmodule