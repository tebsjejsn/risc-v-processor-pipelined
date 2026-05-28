module dmem(
    input  logic [31:0] A,
    input  logic [31:0] wd,
    input  logic        clk,
    input  logic        MemWrite,
    output logic [31:0] ReadData
);
    typedef logic [31:0] ramtype [63:0];
    ramtype mem;

    always_ff @(posedge clk)
        if (MemWrite) 
            mem[A[7:2]] <= wd;

    assign ReadData = mem[A[7:2]];
endmodule