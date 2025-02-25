# MIPS Processor Project

This repository contains a MIPS processor implementation designed using VHDL. The project includes various components such as instruction fetch, instruction decode, execution unit, control unit, memory, register file, seven-segment display (SSD), MPG, and a testing unit.

## Components Overview

### 1. Seven-Segment Display (SSD)
**Function:**
- The SSD component is responsible for displaying data on a 7-segment display.
- It cycles through four digits, showing the appropriate hexadecimal values.

### 2. Instruction Fetch (IF)
**Function:**
- The Instruction Fetch unit retrieves the next instruction from memory.
- Implements a program counter (PC) that increments or changes based on branch/jump instructions.
- Supports branch and jump operations using multiplexers.

### 3. Instruction Decode (ID)
**Function:**
- Decodes the instruction fetched from memory.
- Extracts opcode, register addresses, immediate values, and shift amounts.
- Interfaces with the register file to fetch operand values.

### 4. Execution Unit (EX)
**Function:**
- Performs arithmetic and logic operations using an ALU.
- Determines zero flag for branch execution.
- Calculates target addresses for branch instructions.

### 5. Control Unit (CU)
**Function:**
- Generates control signals for various components.
- Determines operation types (arithmetic, logic, memory access, control flow).
- Controls register writes, memory accesses, ALU operations, and branching.

### 6. Memory (MEM)
**Function:**
- Handles data memory read/write operations.
- Implements memory-mapped register storage.
- Provides memory interface for load/store instructions.

### 7. Register File
**Function:**
- Stores general-purpose registers used by the processor.
- Provides read and write access to registers.
- Supports register writes controlled by the control unit.

### 8. MPG (Manual Pulse Generator)
**Function:**
- Generates enable signals for manual stepping of the processor.
- Used to control execution flow for debugging purposes.

### 9. Testing Unit
**Function:**
- Integrates all components for verification.
- Allows for program execution and debugging via LED indicators and SSD output.
- Provides test scenarios to validate processor functionality.

## Build and Simulation

### Simulation Instructions
- Use a VHDL simulator such as ModelSim or Xilinx Vivado.
- Load all components into the simulator.
- Run the testbench to verify processor functionality.

### FPGA Deployment
- Synthesize and deploy the design onto an FPGA.
- Use external inputs for instruction and data memory.
- Monitor execution via SSD and LEDs.

## Conclusion
This MIPS processor project demonstrates a basic implementation with all necessary components. The design is modular, allowing easy modifications and enhancements. Through testing and FPGA deployment, this project serves as a foundation for understanding MIPS architecture and digital design principles.
