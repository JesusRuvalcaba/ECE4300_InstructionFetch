`timescale 1ns / 1ps

module top_if #(parameter WIDTH = 32)(
    input clk,
    input [WIDTH-1:0] pc_from_exmem,
    input pcsrc,
    input reset,
    output [WIDTH-1:0] if_pc_out,
    output [WIDTH-1:0] if_instr_out
);   

    wire [WIDTH-1:0] mux_out;
    wire [WIDTH-1:0] adder_out;
    wire [WIDTH-1:0] instr_mem_out;
    wire [WIDTH-1:0] pc_out;
    
    mux #(.WIDTH(WIDTH)) dut_mux (
        .select(pcsrc),
        .in_0(adder_out),
        .in_1(pc_from_exmem),
        .mux_out(mux_out)
    );   
        
    instr_mem #(.WIDTH(WIDTH)) dut_instr_mem (
        .reset(reset),
        .address(pc_out),
        .clk(clk),
        .instruction(instr_mem_out)
    );
    
    adder #(.WIDTH(WIDTH)) dut_adder (
        .a(pc_out),
        .adder_out(adder_out)
    );
        
    pc #(.WIDTH(WIDTH)) dut_pc (
        .reset(reset),
        .pc_inp(mux_out),
        .clk(clk),
        .pc_out(pc_out)
    );    
    
    if_latch #(.WIDTH(WIDTH)) dut_latch (
        .reset(reset),
        .clk(clk),
        .if_instr_in(instr_mem_out),
        .if_pc_in(adder_out),
        .if_pc_out(if_pc_out),
        .if_instr_out(if_instr_out)
    );

endmodule
