module floppc(
    input  logic        clk,
    input  logic        reset,
    input  logic        en,
    input  logic [31:0] d,
    output logic [31:0] q
);

    always_ff @(posedge clk, posedge reset) begin
        if (reset) 
            q <= 32'h80000000;
        else if (en) 
            q <= d;
    end
endmodule