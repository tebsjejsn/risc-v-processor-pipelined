import sys
import re

def parse_hardware_logs(hardware_file):
    hw_commits = {}

    pattern = re.compile(r"PC:\s*([0-9a-fA-F]+)\s*\|\s*REG:\s*x(\d+)\s*\|\s*VAL:\s*([0-9a-fA-F]+)")

    try:
        with open(hardware_file, 'r') as f:
            for line in f:
                match = pattern.search(line)

                if match:
                    PC = int(match.group(1), 16)
                    Reg = int(match.group(2))
                    Val = int(match.group(3), 16)

                    hw_commits[PC] = (Reg, Val)
    except FileNotFoundError:
        print(f"Error: Could not find hardware log at {hardware_file}")
        sys.exit(1)

    return hw_commits

def parse_spike_logs(spike_file):
    spike_commits = {}

    pattern = re.compile(r"core\s+\d+:\s+\d\s+0x([0-9a-fA-F]+)\s+\(0x[0-9a-fA-F]+\)\s+x(\d+)\s+0x([0-9a-fA-F]+)")

    try:
        with open(spike_file, 'r') as f:
            for line in f:
                match = pattern.search(line)

                if match:
                    PC = int(match.group(1), 16) - 0x80000000
                    Reg = int(match.group(2))
                    Val = int(match.group(3), 16)

                    if Reg != 0:
                        spike_commits[PC] = (Reg, Val)
    except FileNotFoundError:
        print(f"Error: Could not find spike log at {spike_file}")
        sys.exit(1)

    return spike_commits

def compare_logs(hardware_file, spike_file):
    print("\n--------------------------------------------------------------")
    print("Parsing log files...")

    hw_data = parse_hardware_logs(hardware_file)
    spike_data = parse_spike_logs(spike_file)

    if not hw_data:
        print("No valid register writes found in hardware logs!")

    errors = 0
    successes = 0

    print("\n\n--- Starting Verification ---\n")

    for PC in sorted(spike_data.keys()):
        spike_reg, spike_val = spike_data[PC]
        
        if PC not in hw_data:
            if spike_reg == 0: 
                continue
            print(f"Mismatch at PC 0x{PC:08X}: Spike executed an instruction writing to x{spike_reg}, but Hardware didn't commit anything.")
            errors += 1
            continue
            
        hw_reg, hw_val = hw_data[PC]
        
        if hw_reg != spike_reg or hw_val != spike_val:
            print(f"MISMATCH at PC 0x{PC:08X}!")
            print(f"  Spike expected:   x{spike_reg} = 0x{spike_val:08X}")
            print(f"  Hardware actual:   x{hw_reg} = 0x{hw_val:08X}")
            errors += 1
        else:
            print(f"PASS: PC 0x{PC:08X} | x{hw_reg} successfully updated to 0x{hw_val:08X}")
            successes += 1

    print("\n\n--- Verification Summary ---\n")
    if errors == 0:
        print(f"SUCCESS! All {successes} instructions match Spike perfectly.")
    else:
        print(f"FAILED with {errors} mismatches. Time to check the waveforms.")
    print("--------------------------------------------------------------\n")

if __name__ == "__main__":
    compare_logs("C:/Users/tejpa/risc-v-processor-pipelined/data/hardware_trace.log", "C:/Users/tejpa/risc-v-processor-pipelined/data/spike_trace.log")

