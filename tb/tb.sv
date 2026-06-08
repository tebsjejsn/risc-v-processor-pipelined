module tb();
    logic        clk;
    logic        reset;
    logic [31:0] WriteData;
    logic [31:0] dataAdr;
    logic        MemWrite;
    logic        RegWrite;

    integer      instruction_count = 0;
    integer      file_tracker = 1;
    integer      trace_file_ctrl;
    integer      trace_file_fwd;
    integer      trace_file_stl;
    integer      trace_file;
    integer      scan_result;
    logic [31:0] expected_pc;
    logic [31:0] expected_data;

    top dut (
        .clk,
        .reset,
        .WriteData,
        .dataAdr,
        .MemWrite,
        .RegWrite
    );

    always 
        begin
            clk = 0;
            #5;
            clk = 1;
            #5;
        end

    initial 
        begin
            trace_file_fwd = $fopen("C:/Users/tejpa/risc-v-processor-pipelined/data/forwarding.txt", "r");
            trace_file_stl = $fopen("C:/Users/tejpa/risc-v-processor-pipelined/data/stalling.txt", "r");
            trace_file_ctrl = $fopen("C:/Users/tejpa/risc-v-processor-pipelined/data/control.txt", "r");

            reset = 1;
            #30;
            reset = 0;
        end

    always @(negedge clk)
        begin
            if (~reset)
                if (RegWrite)
                    if (file_tracker == 1)
                        trace_file = trace_file_fwd;
                    else if (file_tracker == 2)
                        trace_file = trace_file_stl;
                    else
                        trace_file = trace_file_ctrl;

                    // CREATE SCANNING FORMAT
                    // scan_result = $fscanf(trace_file, "%h %h\n", expected_pc, expected_data);
                    scanf_result = $fscanf(trace_file);

                    if (scan_result == -1 && file_tracker == 2)
                        begin
                            $display("SUCCESS: %0d control instructions executed flawlessly!", instruction_count);
                            $stop;
                        end
                    else if (scan_result == -1 && file_tracker == 1)
                        begin
                            $display("SUCCESS: %0d stalling instructions executed flawlessly!", instruction_count);
                            file_tracker = file_tracker + 1;
                        end
                    else
                        begin
                            $display("SUCCESS: %0d forwarding instructions executed flawlessly!", instruction_count);
                            file_tracker = file_tracker + 1;
                        end

                    // ADD CHECKING LOGIC
                    /*
                    if (dut.PC !== expected_pc || dut.riscv.dp.Result !== expected_data) begin
                        $display("-----------------------------------------");
                        $display("FAILURE AT INSTRUCTION %0d", instruction_count);
                        $display("Expected: PC = %h, WriteData = %h", expected_pc, expected_data);
                        $display("Actual:   PC = %h, WriteData = %h", dut.PC, WriteData);
                        $display("-----------------------------------------");
                        $stop;
                    end
                    */

                    instruction_count = instruction_count + 1;



        end
endmodule