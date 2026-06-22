module hazard(
    input  logic [4:0] Rs1E,
    input  logic [4:0] Rs2E,
    input  logic [4:0] RdM,
    input  logic [4:0] WriteBackW,
    input  logic       RegWriteM,
    input  logic       RegWriteW,
    input  logic [4:0] Rs1D,
    input  logic [4:0] Rs2D,
    input  logic [4:0] RdE,
    input  logic [1:0] ResultSrcE,
    input  logic [1:0] PCSrc,
    input  logic [2:0] FControlM,
    input  logic [2:0] FControlW,
    input  logic       FRegWriteM,
    input  logic       FRegWriteW,
    output logic [1:0] FrwdBE,
    output logic [1:0] FrwdAE,
    output logic [1:0] FrwdCE,
    output logic [1:0] FrwdDE,
    output logic       StallF,
    output logic       StallD,
    output logic       FlushE,
    output logic       FlushD
);
    logic lwStall;

    always_comb begin
        FrwdAE = 0;
        FrwdBE = 0;
        FrwdCE = 0;
        FrwdDE = 0;

        // Forwarding logic
        if (Rs1E == RdM && RegWriteM == 1 && Rs1E != 0)
            FrwdAE = 2'b01;
        else if (Rs1E == WriteBackW && RegWriteW == 1 && Rs1E != 0)
            FrwdAE = 2'b10;
        else
            FrwdAE = '0;

        if (Rs1E == RdM && FRegWriteM == 1)
            FrwdCE = 2'b01;
        else if (Rs1E == WriteBackW && FRegWriteW == 1)
            FrwdCE = 2'b10;
        else
            FrwdCE = '0;

        if (Rs2E == RdM && RegWriteM == 1 && Rs2E != 0)
            FrwdBE = 2'b01;
        else if (Rs2E == WriteBackW && RegWriteW == 1 && Rs2E != 0)
            FrwdBE = 2'b10;
        else
            FrwdBE = '0;

        if (Rs2E == RdM && FRegWriteM == 1)
            FrwdDE = 2'b01;
        else if (Rs2E == WriteBackW && FRegWriteW == 1)
            FrwdDE = 2'b10;
        else
            FrwdDE = '0;

        // Stalling logic
        if (ResultSrcE[0] == 1 && (RdE != 0) && (Rs1D == RdE || Rs2D == RdE)) 
            lwStall = 1;
        else
            lwStall = 0;

        // Flush and freeze logic
        StallF = ~lwStall;
        StallD = ~lwStall;
        FlushE = lwStall || (PCSrc != 2'b00);
        FlushD = (PCSrc != 2'b00);
    end
endmodule