module datapath(
    input  logic        clk,
    input  logic        reset,
    input  logic [31:0] instrF,
    input  logic [31:0] ReadDataM,
    input  logic        RegWriteD,
    input  logic [2:0]  ImmTypeD,
    input  logic [3:0]  ALUSrcD,
    input  logic [2:0]  ALUControlD,
    input  logic [1:0]  ResultSrcD,
    input  logic [1:0]  PCSrc,
    input  logic        MemWriteD,
    input  logic [1:0]  FrwdAE,
    input  logic [1:0]  FrwdBE,
    input  logic        BranchD,
    input  logic [1:0]  JumpTypeD,
    input  logic        StallF,
    input  logic        StallD,
    input  logic        FlushE,
    input  logic        FlushD,
    input  logic [2:0]  FControlD,
    input  logic        FRegWriteD,
    input  logic [1:0]  FrwdCE,
    input  logic [1:0]  FrwdDE,
    output logic [31:0] instrD,
    output logic [2:0]  funct3,
    output logic        BranchE,
    output logic [1:0]  JumpTypeE,
    output logic [4:0]  RdM,
    output logic [4:0]  WriteBackW,
    output logic [31:0] PCF,
    output logic [31:0] WriteDataM,
    output logic        RegWriteM,
    output logic        RegWriteW,
    output logic [2:0]  FControlM,
    output logic [2:0]  FControlW,
    output logic        FRegWriteM,
    output logic        FRegWriteW,
    output logic [4:0]  Rs1E,
    output logic [4:0]  Rs2E,
    output logic [31:0] ALUResultM,
    output logic        MemWriteM,
    output logic [1:0]  ResultSrcE,
    output logic [4:0]  RdE,
    output logic [31:0] ResultW,
    output logic [31:0] PCW,
    output logic        Zero
);
    // Fetch variables
    logic [31:0] PCPlus4F;
    logic [31:0] PCTargetE;
    logic [31:0] PCNext;
    
    // Fetch to decode variables
    logic [31:0] PCD;
    logic [31:0] PCPlus4D;

    // Decode variables
    logic [31:0] RD1D;
    logic [31:0] RD2D;
    logic [31:0] FRD1D;
    logic [31:0] FRD2D;
    logic [31:0] ImmExtD;

    // Decode to execute variables
    logic [31:0] RD1E;
    logic [31:0] RD2E;
    logic [31:0] FRD1E;
    logic [31:0] FRD2E;
    logic [31:0] PCE;
    logic [31:0] ImmExtE;
    logic [31:0] PCPlus4E;

    // Execute variables
    logic [31:0] SrcA;
    logic [31:0] ALUSrcA;
    logic [31:0] SrcB;
    logic [31:0] ALUResultE;
    logic [31:0] FSrcA;
    logic [31:0] FALUSrcA;
    logic [31:0] FSrcB;
    logic [31:0] WriteDataE;
    logic [31:0] ALUResult;
    logic [31:0] FPUResult;

    // Execute to memory variables
    logic [31:0] PCPlus4M;
    logic [31:0] PCM;

    // Memory to write back variables
    logic [31:0] ALUResultW;
    logic [31:0] ReadDataW;
    logic [31:0] PCPlus4W;

    // Control signal variables
    logic       RegWriteE;
    logic [2:0] funct3E;
    logic [1:0] ResultSrcM;
    logic [1:0] ResultSrcW;
    logic       MemWriteE;
    logic [2:0] ALUControlE;
    logic [4:0] ALUSrcE;
    logic       FRegWriteE;
    logic [2:0] FControlE;

    // Fetch
    mux3 #(.width(32)) pcmux (
        .d0(PCPlus4F),
        .d1(PCTargetE),
        .d2(ALUResultE),
        .s(PCSrc),
        .y(PCNext)
    );

    floppc pcreg (
        .clk,
        .reset,
        .en(StallF),
        .d(PCNext),
        .q(PCF)
    );

    adder pcadder (
        .a(PCF),
        .b(32'd4),
        .y(PCPlus4F)
    );

    // Fetch to decode registers
    floprce instrFD (
        .clk,
        .reset,
        .en(StallD),
        .clr(FlushD),
        .d(instrF),
        .q(instrD)
    );

    floprce PCFD (
        .clk,
        .reset,
        .en(StallD),
        .clr(FlushD),
        .d(PCF),
        .q(PCD)
    );

    floprce PCPlus4FD (
        .clk,
        .reset,
        .en(StallD),
        .clr(FlushD),
        .d(PCPlus4F),
        .q(PCPlus4D)
    );

    // Decode
    regfile rf1 (
        .clk,
        .a1(instrD[19:15]),
        .a2(instrD[24:20]),
        .a3(WriteBackW),
        .wd3(ResultW),
        .we3(RegWriteW),
        .rd1(RD1D),
        .rd2(RD2D)
    );

    fpu_regfile rf2 (
        .clk,
        .a1(instrD[19:15]),
        .a2(instrD[24:20]),
        .a3(WriteBackW),
        .wd3(ResultW),
        .we3(FRegWriteW),
        .rd1(FRD1D),
        .rd2(FRD2D)
    );

    extend ext (
        .instr(instrD[31:7]),
        .immtype(ImmTypeD),
        .immext(ImmExtD)
    );

    // Decode to execute registers
    floprc RD1DE (
        .clk,
        .reset,
        .clr(FlushE),
        .d(RD1D),
        .q(RD1E)
    );

    floprc RD2DE (
        .clk,
        .reset,
        .clr(FlushE),
        .d(RD2D),
        .q(RD2E)
    );

    floprc #(.width(5)) RdDE (
        .clk,
        .reset,
        .clr(FlushE),
        .d(instrD[11:7]),
        .q(RdE)
    );

    floprc PCDE (
        .clk,
        .reset,
        .clr(FlushE),
        .d(PCD),
        .q(PCE)
    );

    floprc ImmExtDE (
        .clk,
        .reset,
        .clr(FlushE),
        .d(ImmExtD),
        .q(ImmExtE)
    );

    floprc PCPlus4DE (
        .clk,
        .reset,
        .clr(FlushE),
        .d(PCPlus4D),
        .q(PCPlus4E)
    );

    floprc #(.width(5)) Rs1DE (
        .clk,
        .reset,
        .clr(FlushE),
        .d(instrD[19:15]),
        .q(Rs1E)
    );

    floprc #(.width(5)) Rs2DE (
        .clk,
        .reset,
        .clr(FlushE),
        .d(instrD[24:20]),
        .q(Rs2E)
    );

    floprc FRD1DE (
        .clk,
        .reset,
        .clr(FlushE),
        .d(FRD1D),
        .q(FRD1E)
    );

    floprc FRD2DE (
        .clk,
        .reset,
        .clr(FlushE),
        .d(FRD2D),
        .q(FRD2E)
    );

    floprc #(.width(3)) FControlDE (
        .clk,
        .reset,
        .clr(FlushE),
        .d(FControlD),
        .q(FControlE)
    );

    floprc #(.width(1)) FRegWriteDE (
        .clk,
        .reset,
        .clr(FlushE),
        .d(FRegWriteD),
        .q(FRegWriteE)
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

    mux2 #(.width(32)) alusrc1mux (
        .d0(ALUSrcA),
        .d1(ImmExtE),
        .s(ALUSrcE[1]),
        .y(SrcB)
    );

    alu mainALU (
        .SrcA,
        .SrcB,
        .ALUControl(ALUControlE),
        .Zero,
        .ALUResult(ALUResult)
    );

    adder pctargetadder (
        .a(PCE),
        .b(ImmExtE),
        .y(PCTargetE)
    );

    mux3 #(.width(32)) alumux3 (
        .d0(FRD1E),
        .d1(ALUResultM),
        .d2(ResultW),
        .s(FrwdCE),
        .y(FSrcA)
    );

    mux3 #(.width(32)) alumux4 (
        .d0(FRD2E),
        .d1(ALUResultM),
        .d2(ResultW),
        .s(FrwdDE),
        .y(FALUSrcA)
    );

    mux2 #(.width(32)) alusrc2mux (
        .d0(FALUSrcA),
        .d1(ImmExtE),
        .s(ALUSrcE[0]),
        .y(FSrcB)
    );

    fpu FPU (
        .FSrcA,
        .FSrcB,
        .FControl(FControlE),
        .FPUResult
    );

    mux2 #(.width(32)) writealu (
        .d0(FALUSrcA),
        .d1(ALUSrcA),
        .s(ALUSrcE[2]),
        .y(WriteDataE)
    );

    mux2 #(.width(32)) aluresultalu (
        .d0(FPUResult),
        .d1(ALUResult),
        .s(ALUSrcE[3]),
        .y(ALUResultE)
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
        .d(WriteDataE),
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

    flopr PCEM (
        .clk,
        .reset,
        .d(PCE),
        .q(PCM)
    );

    flopr #(.width(3)) FControlEM (
        .clk,
        .reset,
        .d(FControlE),
        .q(FControlM)
    );

    flopr #(.width(1)) FRegWriteEM (
        .clk,
        .reset,
        .d(FRegWriteE),
        .q(FRegWriteM)
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

    flopr PCMW (
        .clk,
        .reset,
        .d(PCM),
        .q(PCW)
    );

    flopr #(.width(1)) FRegWriteMW (
        .clk,
        .reset,
        .d(FRegWriteM),
        .q(FRegWriteW)
    );

    flopr #(.width(3)) FControlMW (
        .clk,
        .reset,
        .d(FControlM),
        .q(FControlW)
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
    floprc #(.width(1)) RegWriteDE (
        .clk,
        .reset,
        .clr(FlushE),
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

    floprc #(.width(3)) funct3reg (
        .clk,
        .reset,
        .clr(FlushE),
        .d(instrD[14:12]),
        .q(funct3)
    );

    floprc #(.width(1)) BranchDE (
        .clk,
        .reset,
        .clr(FlushE),
        .d(BranchD),
        .q(BranchE)
    );

    floprc #(.width(2)) JumpTypeDE (
        .clk,
        .reset,
        .clr(FlushE),
        .d(JumpTypeD),
        .q(JumpTypeE)
    );

    floprc #(.width(2)) ResultSrcDE (
        .clk,
        .reset,
        .clr(FlushE),
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

    floprc #(.width(1)) MemWriteDE (
        .clk,
        .reset,
        .clr(FlushE),
        .d(MemWriteD),
        .q(MemWriteE)
    );

    flopr #(.width(1)) MemWriteEM (
        .clk,
        .reset,
        .d(MemWriteE),
        .q(MemWriteM)
    );

    floprc #(.width(3)) ALUControlDE (
        .clk,
        .reset,
        .clr(FlushE),
        .d(ALUControlD),
        .q(ALUControlE)
    );

    floprc #(.width(4)) ALUSrcDE (
        .clk,
        .reset,
        .clr(FlushE),
        .d(ALUSrcD),
        .q(ALUSrcE)
    );
endmodule
