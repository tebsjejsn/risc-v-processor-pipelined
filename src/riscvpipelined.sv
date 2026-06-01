module riscvpipelined(
    input  logic clk,
    input  logic reset,
    input  logic [31:0] instrF,
    input  logic [31:0] ReadDataM,
    output logic [31:0] ALUResultM,
    output logic [31:0] WriteDataM,
    output logic [31:0] PCF
);
    logic        RegWriteD;
    logic [2:0]  ImmTypeD;
    logic        ALUSrcD;
    logic [2:0]  ALUControlD;
    logic [1:0]  ResultSrcD;
    logic [1:0]  PCSrc;
    logic        MemWriteD;
    logic [1:0]  FrwdAE;
    logic [1:0]  FrwdBE;
    logic        BranchD;
    logic [1:0]  JumpTypeD;
    logic [31:0] instrD;
    logic [2:0]  funct3;
    logic        BranchE;
    logic [1:0]  JumpTypeE;
    logic [4:0]  RdM;
    logic        RegWriteM;
    logic        RegWriteW;
    logic [4:0]  WriteBackW;
    logic [4:0]  Rs1E;
    logic [4:0]  Rs2E;
    logic        MemWriteM;
    logic        Zero;

    datapath dp (
        .clk,
        .reset,
        .instrF,
        .ReadDataM,
        .ImmTypeD,
        .ALUSrcD,
        .ALUControlD,
        .ResultSrcD,
        .PCSrc,
        .MemWriteD,
        .FrwdAE,
        .FrwdBE,
        .BranchD,
        .JumpTypeD,
        .instrD,
        .funct3,
        .BranchE,
        .JumpTypeE,
        .RdM,
        .WriteBackW,
        .PCF,
        .WriteDataM,
        .RegWriteM,
        .RegWriteW,
        .Rs1E,
        .Rs2E,
        .ALUResultM,
        .MemWriteM,
        .Zero
    );

    main_dec m_decoder (
        .opcode(instrD[6:0]),
        .ImmType(ImmTypeD),
        .ALUSrc(ALUSrcD),
        .ResultSrc(ResultSrcD),
        .MemWrite(MemWriteD),
        .JumpType(JumpTypeD),
        .Branch(BranchD),
        .RegWrite(RegWriteD)
    );

    alu_dec alu_decoder (
        .funct3(instrD[14:12]),
        .funct7(instrD[31:25]),
        .opcode(instrD[6:0]),
        .ALUControl(ALUControlD)
    );

    pc_dec pc_decoder (
        .Branch(BranchE),
        .JumpType(JumpTypeE),
        .Zero,
        .funct3,
        .PCSrc
    );

    hazard h_unit (
        .Rs1E,
        .Rs2E,
        .RdM,
        .WriteBackW,
        .RegWriteM,
        .RegWriteW,
        .FrwdAE,
        .FrwdBE
    );
endmodule