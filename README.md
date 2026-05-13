# ECE4300_InstructionFetch

<img width="1602" height="331" alt="image" src="https://github.com/user-attachments/assets/d161217f-3eb1-4c33-a132-6be23ae7b7b0" />
<img width="1109" height="213" alt="image" src="https://github.com/user-attachments/assets/b4244129-4f4f-419d-a05e-496188bd6ca9" />


Instruction Fetch implements the IF stage of a MIPS pipeline in Verilog responsible for fetching instructions from instructiom memory, updating the program counter (PC), and passing instruction data to decode stage through IF/ID latch

Modules included:

Program Counter (PC)
Adder (PC + 4)
Multiplexer (MUX)
Instruction Memory
IF/ID Latch
Top IF Module

The design was tested using Verilog testbenches and timing simulations to verify correct instruction fetching and PC updates.
