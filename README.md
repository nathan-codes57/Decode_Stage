# Lab 2 — Decode
<!--
Replace every item in square brackets before submitting.
Keep this README focused on what the design does, how it is used, and how it was
verified.
-->
## Design Scope and Assumptions
- **In scope:** This lab implements an instruction decode in verilog.
- **Out of scope:** Fetch, Execute, Memory Access, Writeback
- **Assumptions:** 32 bit data bus, 32 registers
- **Limitations:** No addi instruction, disconnected write reg, write data, NPC_in, regwrite
## Requirements
| Requirement | Description | Verification Method |
|---|---|---|
| Latch | Passes data onto the next pipeline stage | Test case, waveform, inspection |
| Register File | 32 general purpose registers, If regwrite == 1, then write the "writedata" value into the "write reg" location Else read the data from "read reg1" and "read reg2" as their respective "read data" | Test case, waveform, inspection |
| Control | Follow MIPS control format | Test case, waveform, inspection |
| Sign Extend | Receives 16 bit immediate values and outputs 32 bits sign extended | Test case, waveform, inspection |
| Final ID Stage | Ties all 4 minor modules together into overall Instruction Decode | Test case, waveform, inspection |
## Implementation
### Source Code
| File | Description |
|---|---|
| [`control.v`](https://github.com/nathan-codes57/Decode_Stage/blob/main/Source-Files/control.v) | Source code for control module |
| [`signExtend.v`](https://github.com/nathan-codes57/Decode_Stage/blob/main/Source-Files/signExtend.v) | Source code for sign extend module |
| [`RegFile.v`](https://github.com/nathan-codes57/Decode_Stage/blob/main/Source-Files/RegFile.v) | Source code for register file module |
| [`IDEXLatch.v`](https://github.com/nathan-codes57/Decode_Stage/blob/main/Source-Files/IDEXLatch.v) | Source code for IDEX latch |
| [`Decode.v`](https://github.com/nathan-codes57/Decode_Stage/blob/main/Source-Files/Decode.v) | Source code for decode module |
| [`Decode_tb.v`](https://github.com/nathan-codes57/Decode_Stage/blob/main/Testbench-Files/Decode_tb.v) | Testbench code for decode module |
### Implementation Notes
- Instruction types include R-Format, LW, SW, and BEQ.
- Decode, register file, sign extender are reusable.
- Modules wired to other pipeline stages left disconnected.
## Verification
### Verification Strategy
The design is verified using **[simulation, formal checks, hardware testing, or
another method]**.
Verification covers:
- [Normal operating case]
- [Boundary or maximum-value case]
- [Reset or initialization case]
- [Invalid, stalled, or exceptional case, if applicable]
### Testbench and Waveform
Save screenshots and waveform images in the repository's `images/` folder.
![Testbench or waveform](images/[testbench-screenshot-filename].png)
The testbench source is available [*here*](LINK_TO_TESTBENCH_CODE).
### Results
| Test Case | Expected Result | Observed Result | Status |
|---|---|---|---|
| TC-01 — [Name] | [Expected behavior] | [Observed behavior] | Pass / Fail |
| TC-02 — [Name] | [Expected behavior] | [Observed behavior] | Pass / Fail |
| TC-03 — [Name] | [Expected behavior] | [Observed behavior] | Pass / Fail |
## Reproduction Instructions
### Tools and Versions
- **Simulator / synthesis tool:** [Name and version]
- **Language / standard:** [Verilog/SystemVerilog version]
- **Operating system:** [macOS, Windows, Linux, or other]
- **Additional dependencies:** [List any required tools or libraries]
### Build and Run
```bash
# Replace these commands with the commands required for this lab.
[compile-command]
[run-command]
```
Expected output:
```text
[Paste a short representative output or result here.]
```
## Repository Organization
```text
.
├── README.md
├── images/
│ ├── [timing-diagram-filename].png
│ └── [testbench-screenshot-filename].png
├── [source-files]
└── [testbench-files]
```
## Known Issues and Future Improvements
- [Document any known issue, unverified behavior, or technical debt.]
- [Describe a realistic improvement or extension.]
