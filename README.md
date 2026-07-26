# fundamental

A single-cycle RISC-V RV32I processor built in Verilog from scratch, module by module.

This is my hands-on journey through computer architecture — implementing every component of a working processor to deeply understand how instructions become hardware.

---

## Motivation

Reading about processors is not the same as building one. This project implements a working RV32I core in Verilog to understand:

- How machine instructions map to hardware
- Why the datapath looks the way it does
- What single-cycle design costs in area vs pipelining
- How to verify hardware against a spec

Once functional, this core will be the control processor for my [nano-tpu](https://github.com/rhythm99e/nano-tpu) AI accelerator.

---

## Architecture

- **ISA:** RISC-V RV32I (base 32-bit integer)
- **Style:** Single-cycle, hardwired control
- **Target:** Xilinx Artix-7 (xc7a100tcsg324-1)
- **Language:** Verilog (SystemVerilog planned for later refactor)

Reference: Harris & Harris, *Digital Design and Computer Architecture (RISC-V Edition)*, Chapter 7.

---

## Module Status

| Module | Status | Description |
|---|---|---|
| ALU | ✅ Complete | 9 operations, zero flag, tested |
| Register File | ✅ Complete | x0 hardwired, dual read ports, tested |
| Control Unit | ✅ Complete | All RV32I opcodes decoded |
| Sign Extender | 🔨 In Progress | I/S/B/J immediate formats |
| ALU Control | 📋 Planned | Decodes aluop + funct3 + funct7 |
| Program Counter | 📋 Planned | PC + 4, branch, jump support |
| Instruction Memory | 📋 Planned | Loaded via `$readmemh` |
| Data Memory | 📋 Planned | Load/store word/halfword/byte |
| Datapath | 📋 Planned | Top-level wiring of all modules |
| Processor Top | 📋 Planned | End-to-end integration |

---

## Completed Module Details

### ALU (`alu.v`)

9 operations selected by `alucommand[3:0]`:

| Command | Operation |
|---|---|
| 0000 | AND |
| 0001 | OR |
| 0010 | XOR |
| 0100 | ADD |
| 0101 | SUB |
| 0110 | SLT (signed less than) |
| 0111 | SLL (logical left shift) |
| 1000 | SRL (logical right shift) |
| 1001 | SRA (arithmetic right shift) |

Outputs a `zero` flag used by branch instructions. Uses `$signed()` for SLT and SRA.

### Register File (`regfile.v`)

- 32 × 32-bit registers
- Dual combinational read ports (`rs1`, `rs2`)
- Synchronous write on rising clock edge
- `x0` hardwired to zero (writes ignored)

### Control Unit (`cu.v`)

Decodes 7-bit opcode into control signals:

| Opcode | Type | Example |
|---|---|---|
| 0110011 | R-type | ADD, SUB, AND, OR |
| 0010011 | I-type | ADDI, ORI, ANDI |
| 0000011 | Load | LW |
| 0100011 | Store | SW |
| 1100011 | Branch | BEQ, BNE |
| 1101111 | JAL | Jump and link |

Outputs: `regwrite`, `memwrite`, `memread`, `memtoreg`, `alusrc`, `branch`, `jump`, `aluop[1:0]`.

Purely combinational with default values = 0 for safety.

---

## File Structure
```
fundamental/
├── README.md
├── alu/
│ ├── alu.v
│ └── tb_alu.v
├── registerfile/
│ ├── regfile.v
│ └── tb_regfile.v
├── control_unit/
│ ├── cu.v
│ └── tb_cu.v
├── sign_extend/
│ ├── se.v
│ └── tb_sign_extend.v
└── (more modules coming)

text


```

## Tools

- **HDL:** Verilog
- **Simulation:** Icarus Verilog + GTKWave
- **Synthesis:** Xilinx Vivado 2023.2
- **Target FPGA:** xc7a100tcsg324-1 (Artix-7)
- **OS:** Ubuntu 22.04 (WSL2)

Each module is compiled and tested individually before integration:

```bash
iverilog -o output -s tb_module module.v tb_module.v
vvp output

Roadmap

Immediate

    Complete sign extender
    Build ALU control, PC, instruction memory
    Wire up datapath

Short-term

    Run a small assembly program end-to-end
    Add data memory and load/store support
    Full RV32I compliance test

Long-term

    Pipeline the design (5-stage)
    Add hazard detection and forwarding
    Integrate with nano-tpu accelerator
    Boot a minimal Linux (stretch goal)

Related Work

    nano-tpu — 4×4 systolic array AI accelerator

References

    Harris & Harris, Digital Design and Computer Architecture (RISC-V Edition)
    RISC-V ISA Manual
    Onur Mutlu lectures
    PULP Platform — Ibex core reference

Author

Rhythm Katwal
Electronics and Communication Engineering
Pulchowk Campus, IOE, Tribhuvan University, Nepal
GitHub: @rhythm99e
License

MIT
