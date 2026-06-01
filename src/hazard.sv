module hazard(
    input  logic [4:0] Rs1E,
    input  logic [4:0] Rs2E,
    input  logic [4:0] RdM,
    input  logic [4:0] WriteBackW,
    input  logic       RegWriteM,
    input  logic       RegWriteW,
    output logic [1:0] FrwdBE,
    output logic [1:0] FrwdAE
);
    always_comb begin
        if (Rs1E == RdM && RegWriteM == 1 && Rs1E != 0)
            FrwdAE = 2'b01;
        else if (Rs1E == WriteBackW && RegWriteW == 1 && Rs1E != 0)
            FrwdAE = 2'b10;
        else
            FrwdAE = '0;

        if (Rs2E == RdM && RegWriteM == 1 && Rs2E != 0)
            FrwdBE = 2'b01;
        else if (Rs2E == WriteBackW && RegWriteW == 1 && Rs2E != 0)
            FrwdBE = 2'b10;
        else
            FrwdBE = '0;
    end
endmodule