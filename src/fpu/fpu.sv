module fpu(
    input  logic [31:0] FSrcA,
    input  logic [31:0] FSrcB,
    input  logic [2:0]  FControl,
    output logic [31:0] FPUResult
);
    logic [7:0]  ExpA;
    logic [7:0]  ExpB;
    logic [26:0] FracA_ext;
    logic [26:0] FracB_ext;
    logic [27:0] FracAdded;
    logic [24:0] FracRounded;
    logic [7:0]  Shamt;
    logic        Sticky;
    logic        Round_up;

    always_comb
        begin
            FPUResult   = 32'b0;
            Shamt       = 8'b0;
            Sticky      = 1'b0;
            Round_up    = 1'b0;
            FracAdded   = 28'b0;
            FracRounded = 25'b0;

            ExpA = FSrcA[30:23];
            ExpB = FSrcB[30:23];
            FracA_ext = {1'b1, FSrcA[22:0], 3'b000};
            FracB_ext = {1'b1, FSrcB[22:0], 3'b000};

            case (FControl)
                // Add
                3'b000: begin
                    if (ExpA > ExpB) 
                        begin
                            Shamt = ExpA - ExpB;
                            Sticky = | (FracB_ext & ((27'b1 << Shamt) - 1));

                            FracB_ext = FracB_ext >> Shamt;
                            FracB_ext[0] = FracB_ext[0] | Sticky;
                        end
                    else
                        begin
                            Shamt = ExpB - ExpA;
                            Sticky = | (FracA_ext & ((27'b1 << Shamt) - 1));

                            FracA_ext = FracA_ext >> Shamt;
                            FracA_ext[0] = FracA_ext[0] | Sticky;

                            ExpA = ExpB;
                        end

                    FracAdded = FracA_ext + FracB_ext;

                    if (FracAdded[27])
                        begin
                            Sticky = FracAdded[1] | FracAdded[0];
                            FracAdded = FracAdded >> 1;
                            FracAdded[0] = Sticky;
                            ExpA = ExpA + 1;
                        end

                    Round_up = FracAdded[2] & (FracAdded[1] | FracAdded[0] | FracAdded[3]);
                    FracRounded = FracAdded[26:3] + Round_up;

                    if (FracRounded[24])
                        begin
                            FracRounded = FracRounded >> 1;
                            ExpA = ExpA + 1;
                        end

                    FPUResult = {1'b0, ExpA, FracRounded[22:0]};
                end
                default:
            endcase
        end
endmodule