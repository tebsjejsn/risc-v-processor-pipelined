module imem(
    input  logic [31:0] A,
    output logic [31:0] rd
);
    typedef logic [31:0] ramtype [32767:0];
    ramtype mem;

    // add appropriate text file
    initial $readmemh("C:/Users/tejpa/risc-v-processor-pipelined/instructions/test.hex", mem);

    assign rd = mem[A[16:2]];
endmodule