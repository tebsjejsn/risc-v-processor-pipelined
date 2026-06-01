module main_controller(
    input  logic [6:0] opcode,
    input  logic [2:0] funct3,
    input  logic [6:0] funct7,
    input  logic       Zero,
    output logic [2:0] ImmType,
    output logic       ALUSrc,
    output logic       MemWrite,
    output logic [1:0] ResultSrc,
    output logic       RegWrite,
    output logic [2:0] ALUControl,
    output logic [1:0] PCSrc
);
    logic [1:0] JumpType;
    logic       Branch;

    main_dec m_decoder (
        .opcode,
        .ImmType,
        .ALUSrc,
        .ResultSrc,
        .MemWrite,
        .JumpType,
        .Branch,
        .RegWrite
    );

    alu_dec alu_decoder (
        .funct3,
        .funct7,
        .opcode,
        .ALUControl
    );

/*
    pc_dec pc_decoder (
        .Branch,
        .JumpType,
        .Zero,
        .funct3,
        .PCSrc
    );
*/
endmodule
