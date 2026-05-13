`timescale 1ns / 1ps


module instr_mem #(parameter WIDTH = 32, DEPTH = 300) (
    input [WIDTH-1:0] address,
    input clk,
    input reset,
    output reg [WIDTH-1:0] instruction
);
    
    reg [WIDTH-1:0] memory [0:DEPTH-1];
    integer i;
    initial 
        begin
            instruction = {WIDTH{1'b0}};
            for (i=0; i<DEPTH; i=i+1) memory[i] = {WIDTH{1'b0}};
            
            instruction = 32'h00000000;
            memory[0] = 32'hA00000AA;
            memory[1] = 32'h10000011;
            memory[2] = 32'h20000022;
            memory[3] = 32'h30000033;
            memory[4] = 32'h40000044;
            memory[5] = 32'h50000055;
            memory[6] = 32'h60000066;
            memory[7] = 32'h70000077;
            memory[8] = 32'h80000088;
            memory[9] = 32'h90000099;
        end
    
    always @(posedge clk) 
        begin
            if(reset)
                instruction <= 32'b0;
            else
                instruction <= memory[address[31:2]];
        end
endmodule
