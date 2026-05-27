module flopr(
    input  logic        clk,
    input  logic        reset,
    input  logic [31:0] d,
    output logic [31:0] q
);
    always_ff @(posedge clk, posedge reset)
        if (reset) q <= {32{1'b0}};
        else       q <= d;
endmodule