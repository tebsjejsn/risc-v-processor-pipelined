module top(
    input  logic clk,
    input  logic reset,
    output logic [31:0] WriteData,
    output logic [31:0] dataAdr,
    output logic        MemWrite,
    output logic        RegWrite
);
    logic [31:0] instr;
    logic [31:0] ReadData;
    logic [31:0] PC;

    riscvpipelined riscv (
        .clk,
        .reset,
        .instrF(instr),
        .ReadDataM(ReadData),
        .ALUResultM(dataAdr),
        .WriteDataM(WriteData),
        .PCF(PC),
        .MemWriteM(MemWrite),
        .RegWriteW(RegWrite)
    );

    imem imem1 (
        .A(PC),
        .rd(instr)
    );

    dmem dmem1 (
        .A(dataAdr),
        .wd(WriteData),
        .clk,
        .MemWrite,
        .ReadData
    );
endmodule