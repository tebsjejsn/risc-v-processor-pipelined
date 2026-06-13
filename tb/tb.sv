module tb();
    logic        clk;
    logic        reset;
    logic [31:0] WriteData;
    logic [31:0] dataAdr;
    logic        MemWrite;
    logic        RegWrite;
    logic [4:0]  Rd;
    logic [31:0] Result;
    logic [31:0] PCW;

    integer      instruction_count = 0;
    integer      trace_file;

    top dut (
        .clk,
        .reset,
        .WriteData,
        .dataAdr,
        .MemWrite,
        .RegWrite,
        .Rd,
        .Result,
        .PCW
    );

    // Clock generation
    always
        begin
            #10;
            clk = ~clk;
        end

    initial
        begin
            // Open commit log file
            trace_file = $fopen("data/hardware_trace.log", "w");

            // Initialize clock and reset signals
            clk = 0;
            reset = 1;
            #50;
            reset = 0;

            #10000;
            $fclose(trace_file);
            $finish;
        end

    always @(posedge clk) 
        begin
            if (RegWrite == 1 && Rd != 0)
                $fdisplay(trace_file, "PC: %h | REG: x%0d | VAL: %h", PCW, Rd, Result);
        end
endmodule