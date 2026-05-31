module flopr 
#(
    parameter width=32
) (
    input  logic        clk,
    input  logic        reset,
    input  logic [width-1:0] d,
    output logic [width-1:0] q
);
    always_ff @(posedge clk, posedge reset)
        if (reset) q <= '0;
        else       q <= d;
endmodule