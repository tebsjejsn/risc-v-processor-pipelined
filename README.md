# Pipelined RISC-V Processor

A 5-stage pipelined processor implemented in SystemVerilog, capable of executing RV32I programs. The processor consists of three main components: a datapath (divided into fetch, decode, execute, memory, and writeback stages), a control unit, and a hazard unit (capable of forwarding, stalling, and control logic).

## Datapath Diagram
![Datapath Diagram](images/datapath.jpeg)

## Instruction Set
There are 18 unique instructions that the processor can execute. This combination of instructions forms a Turing complete instruction set.

|  Type  |              Instructions             |
|--------|---------------------------------------|
| R-type | ADD, SUB, AND, OR, XOR, SLT           |
| I-type | ADDI, XORI, ORI, ANDI, SLTI, LW, JALR |
| S-type | SW                                    |
| B-type | BEQ, BNE                              |
| J-type | JAL                                   |
| U-type | LUI                                   |

## Project Structure
```
risc-v-processor-pipelined/

├── images/       # Datapath diagram

├── instructions/ # Assembly test programs and generated HEX files

├── scripts/      # Python scripts

├── src/          # SystemVerilog source files (datapath, control unit, hazard unit)

├── tb/           # Testbench files

└── link.ld       # Linker script
```

## Installation

### 1. Prerequisites
- **Questa** (included with Quartus Prime Lite)
- **riscv64-unknown-elf-gcc** — RISC-V cross-compiler toolchain
  - Linux/macOS: `sudo apt install gcc-riscv64-unknown-elf` or via Homebrew
  - Windows: install via [xPack RISC-V Toolchain](https://github.com/xpack-dev-tools/riscv-none-elf-gcc-xpack/releases)

### 2. Clone the Repository
```bash
git clone https://github.com/tebsjejsn/risc-v-processor-pipelined.git
cd risc-v-processor-pipelined
```

## Executable HEX File

### 1. Create the HEX File
```bash
riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 -nostdlib -nostartfiles -Ttext=0x80000000 instructions/test.S -o instructions/test.elf
riscv64-unknown-elf-objcopy -O binary instructions/test.elf instructions/test.bin
hexdump -v -e '1/4 "%08x\n"' instructions/test.bin > instructions/test.hex
```

### 2. Remove Unnecessary Files
```bash
rm instructions/test.elf instructions/test.bin
```

## Running the Project

### 1. Program Setup
- Open the repository in Visual Studio Code to browse and edit source files.
- Launch Questa, find the transcript window, and change the working directory to the folder of risc-v-processor-pipelined

### 2. Compilation
> Run the following in the Questa transcript window
```
vlib work
vmap work work
vlog -sv {*}[glob src/*.sv] {*}[glob tb/*.sv]
```

### 3. Load the Testbench
```
vsim -voptargs="+acc" work.tb
```

### 4. Run the Simulation
- Go to the sim window, right-click module named "tb", and select Add > To Wave > All items in region
- Type run -all in the Questa transcript window

## (Optional) Add Unique Instructions

### 1. Insert New Instructions
- Write a new assembly program in `instructions/test.S`, or use `generate.py` to produce a random valid instruction sequence:
```bash
python3 scripts/generate.py > instructions/test.S
```

### 2. Repeat Steps
- Follow the previous steps to create a HEX file and run the simulation

## License
Distributed under the MIT License. See `LICENSE` for more information.