module regfile(
    input  logic        clk,
    input  logic [4:0]  a1,
    input  logic [4:0]  a2,
    input  logic [4:0]  a3,
    input  logic [31:0] wd3,
    input  logic        we3,
    output logic [31:0] rd1,
    output logic [31:0] rd2
);
    typedef logic [31:0] ramtype [31:0];
    ramtype mem;

    always_ff @(posedge clk)
        if (we3) 
            mem[a3] <= wd3;
    
    always_comb
        begin
            if (a1 == 0)
                rd1 = '0;
            else
                rd1 = mem[a1];

            if (a2 == 0)
                rd2 = '0;
            else
                rd2 = mem[a2];
        end
endmodule