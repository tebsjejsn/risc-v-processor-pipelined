module datapath(
    input  logic        clk,
    input  logic        reset,
    input  logic [31:0] instrF,
    input  logic [31:0] ReadDataM,
    input  logic        RegWriteD,
    input  logic [2:0]  ImmTypeD,
    input  logic        ALUSrcD,
    input  logic [2:0]  ALUControlD,
    input  logic [1:0]  ResultSrcD,
    input  logic [1:0]  PCSrc,
    input  logic        MemWriteD,
    input  logic [1:0]  FrwdAE,
    input  logic [1:0]  FrwdBE,
    input  logic        BranchD,
    input  logic [1:0]  JumpTypeD,
    output logic [2:0]  funct3,
    output logic        BranchE,
    output logic [1:0]  JumpTypeE,
    output logic [4:0]  RdM,
    output logic [4:0]  WriteBackW,
    output logic [31:0] PCF,
    output logic [31:0] WriteDataM,
    output logic [4:0]  Rs1E,
    output logic [4:0]  Rs2E,
    output logic [31:0] ALUResultM,
    output logic        MemWriteM,
    output logic        Zero
);
    // Fetch variables
    logic [31:0] PCPlus4F;
    logic [31:0] PCTargetE;
    logic [31:0] PCNext;
    
    // Fetch to decode variables
    logic [31:0] instrD;
    logic [31:0] PCD;
    logic [31:0] PCPlus4D;

    // Decode variables
    logic [31:0] ResultW;
    logic [31:0] RD1D;
    logic [31:0] RD2D;
    logic [31:0] ImmExtD;

    // Decode to execute variables
    logic [31:0] RD1E;
    logic [31:0] RD2E;
    logic [4:0]  RdE;
    logic [31:0] PCE;
    logic [31:0] ImmExtE;
    logic [31:0] PCPlus4E;

    // Execute variables
    logic [31:0] SrcA;
    logic [31:0] ALUSrcA;
    logic [31:0] SrcB;
    logic [31:0] ALUResultE;

    // Execute to memory variables
    logic [31:0] PCPlus4M;

    // Memory to write back variables
    logic [31:0] ALUResultW;
    logic [31:0] ReadDataW;
    logic [31:0] PCPlus4W;

    // Control signal variables
    logic       RegWriteE;
    logic       RegWriteM;
    logic       RegWriteW;
    logic [3:0] funct3E;
    logic [1:0] ResultSrcE;
    logic [1:0] ResultSrcM;
    logic [1:0] ResultSrcW;
    logic       MemWriteE;
    logic [2:0] ALUControlE;
    logic       ALUSrcE;

    // Fetch
    mux3 #(.width(32)) pcmux (
        .d0(PCPlus4F),
        .d1(PCTargetE),
        .d2(ALUResultM),
        .s(PCSrc),
        .y(PCNext)
    );

    flopr pcreg (
        .clk,
        .reset,
        .d(PCNext),
        .q(PCF)
    );

    adder pcadder (
        .a(PCF),
        .b(32'd4),
        .y(PCPlus4F)
    );

    // Fetch to decode registers
    flopr instrFD (
        .clk,
        .reset,
        .d(instrF),
        .q(instrD)
    );

    flopr PCFD (
        .clk,
        .reset,
        .d(PCF),
        .q(PCD)
    );

    flopr PCPlus4FD (
        .clk,
        .reset,
        .d(PCPlus4F),
        .q(PCPlus4D)
    );

    // Decode
    regfile rf (
        .clk,
        .a1(instrD[19:15]),
        .a2(instrD[24:20]),
        .a3(WriteBackW),
        .wd3(ResultW),
        .we3(RegWriteW),
        .rd1(RD1D),
        .rd2(RD2D)
    );

    extend ext (
        .instr(instrD[31:7]),
        .immtype(ImmTypeD),
        .immext(ImmExtD)
    );

    // Decode to execute registers
    flopr RD1DE (
        .clk,
        .reset,
        .d(RD1D),
        .q(RD1E)
    );

    flopr RD2DE (
        .clk,
        .reset,
        .d(RD2D),
        .q(RD2E)
    );

    flopr #(.width(5)) RdDE (
        .clk,
        .reset,
        .d(instrD[11:7]),
        .q(RdE)
    );

    flopr PCDE (
        .clk,
        .reset,
        .d(PCD),
        .q(PCE)
    );

    flopr ImmExtDE (
        .clk,
        .reset,
        .d(ImmExtD),
        .q(ImmExtE)
    );

    flopr PCPlus4DE (
        .clk,
        .reset,
        .d(PCPlus4D),
        .q(PCPlus4E)
    );

    flopr #(.width(5)) Rs1DE (
        .clk,
        .reset,
        .d(instrD[19:15]),
        .q(Rs1E)
    );

    flopr #(.width(5)) Rs2DE (
        .clk,
        .reset,
        .d(instrD[24:20]),
        .q(Rs2E)
    );

    // Execute
    mux3 #(.width(32)) alumux1 (
        .d0(RD1E),
        .d1(ALUResultM),
        .d2(ResultW),
        .s(FrwdAE),
        .y(SrcA)
    );

    mux3 #(.width(32)) alumux2 (
        .d0(RD2E),
        .d1(ALUResultM),
        .d2(ResultW),
        .s(FrwdBE),
        .y(ALUSrcA)
    );

    mux2 #(.width(32)) alusrcmux (
        .d0(ALUSrcA),
        .d1(ImmExtE),
        .s(ALUSrcE),
        .y(SrcB)
    );

    alu mainALU (
        .SrcA,
        .SrcB,
        .ALUControl(ALUControlE),
        .Zero,
        .ALUResult(ALUResultE)
    );

    adder pctargetadder (
        .a(PCE),
        .b(ImmExtE),
        .y(PCTargetE)
    );

    // Execute to memory registers
    flopr ALUResultEM (
        .clk,
        .reset,
        .d(ALUResultE),
        .q(ALUResultM)
    );

    flopr WriteDataEM (
        .clk,
        .reset,
        .d(RD2E),
        .q(WriteDataM)
    );

    flopr #(.width(5)) RdEM (
        .clk,
        .reset,
        .d(RdE),
        .q(RdM)
    );

    flopr PCPlus4EM (
        .clk,
        .reset,
        .d(PCPlus4E),
        .q(PCPlus4M)
    );

    // Memory to write back registers
    flopr ALUResultMW (
        .clk,
        .reset,
        .d(ALUResultM),
        .q(ALUResultW)
    );

    flopr ReadDataMW (
        .clk,
        .reset,
        .d(ReadDataM),
        .q(ReadDataW)
    );

    flopr PCPlus4MW (
        .clk,
        .reset,
        .d(PCPlus4M),
        .q(PCPlus4W)
    );

    flopr #(.width(5)) regfileRD (
        .clk,
        .reset,
        .d(RdM),
        .q(WriteBackW)
    );

    // Write back
    mux3 #(.width(32)) writebackmux (
        .d0(ALUResultW),
        .d1(ReadDataW),
        .d2(PCPlus4W),
        .s(ResultSrcW),
        .y(ResultW)
    );

    // Control signals
    flopr #(.width(1)) RegWriteDE (
        .clk,
        .reset,
        .d(RegWriteD),
        .q(RegWriteE)
    );

    flopr #(.width(1)) RegWriteEM (
        .clk,
        .reset,
        .d(RegWriteE),
        .q(RegWriteM)
    );

    flopr #(.width(1)) RegWriteMW (
        .clk,
        .reset,
        .d(RegWriteM),
        .q(RegWriteW)
    );

    flopr #(.width(3)) funct3reg (
        .clk,
        .reset,
        .d(instrD[14:12]),
        .q(funct3)
    );

    flopr #(.width(1)) BranchDE (
        .clk,
        .reset,
        .d(BranchD),
        .q(BranchE)
    );

    flopr #(.width(2)) JumpTypeDE (
        .clk,
        .reset,
        .d(JumpTypeD),
        .q(JumpTypeE)
    );

    flopr #(.width(2)) ResultSrcDE (
        .clk,
        .reset,
        .d(ResultSrcD),
        .q(ResultSrcE)
    );

    flopr #(.width(2)) ResultSrcEM (
        .clk,
        .reset,
        .d(ResultSrcE),
        .q(ResultSrcM)
    );

    flopr #(.width(2)) ResultSrcMW (
        .clk,
        .reset,
        .d(ResultSrcM),
        .q(ResultSrcW)
    );

    flopr #(.width(1)) MemWriteDE (
        .clk,
        .reset,
        .d(MemWriteD),
        .q(MemWriteE)
    );

    flopr #(.width(1)) MemWriteEM (
        .clk,
        .reset,
        .d(MemWriteE),
        .q(MemWriteM)
    );

    flopr #(.width(3)) ALUControlDE (
        .clk,
        .reset,
        .d(ALUControlD),
        .q(ALUControlE)
    );

    flopr #(.width(1)) ALUSrcDE (
        .clk,
        .reset,
        .d(ALUSrcD),
        .q(ALUSrcE)
    );
endmodule
