module floprc
#(
    parameter width=32
) (
    input  logic             clk,
    input  logic             reset,
    input  logic             clr,
    input  logic [width-1:0] d,
    output logic [width-1:0] q
);
    always_ff @(posedge clk, posedge reset) begin
        if (reset)    q <= '0;
        else if (clr) q <= '0;
        else          q <= d;
    end
endmodule