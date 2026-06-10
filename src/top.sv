module top(
    input  logic clk,
    input  logic reset,
    output logic [31:0] WriteData,
    output logic [31:0] dataAdr,
    output logic        MemWrite,
    output logic        RegWrite,
    output logic [31:0] PCW,
    output logic [31:0] Result,
    output logic [4:0]  Rd
);
    logic [31:0] instr;
    logic [31:0] ReadData;
    logic [31:0] PCF;

    riscvpipelined riscv (
        .clk,
        .reset,
        .instrF(instr),
        .ReadDataM(ReadData),
        .ALUResultM(dataAdr),
        .WriteDataM(WriteData),
        .PCF,
        .MemWriteM(MemWrite),
        .RegWriteW(RegWrite),
        .WriteBackW(Rd),
        .ResultW(Result),
        .PCW
    );

    imem imem1 (
        .A(PCF),
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