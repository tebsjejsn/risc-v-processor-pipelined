module adder(
    input  logic [31:0] a,
    input  logic [31:0] b,
    output logic [31:0] y
);
    assign y = signed'(a) + signed'(b);
endmodule