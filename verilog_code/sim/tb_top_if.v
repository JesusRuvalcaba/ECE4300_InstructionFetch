`timescale 1ns/1ps

module tb_top_if;
  reg clk;
  reg pcsrc;
  reg [31:0] pc_from_exmem;
  reg reset;

  wire [31:0] if_instr_out;
  wire [31:0] if_pc_out;

  top_if dut (
    .clk(clk),
    .pc_from_exmem(pc_from_exmem),
    .pcsrc(pcsrc),
    .if_instr_out(if_instr_out),
    .if_pc_out(if_pc_out),
    .reset(reset)
  );

  initial clk = 0;
  always #5 clk = ~clk;

  initial begin
    reset = 1'b1;
    pc_from_exmem = 32'd0;
    pcsrc = 1'b0;
     
    repeat (3) @(posedge clk);
    
    reset = 1'b0;
   

    repeat (16) @(posedge clk);
    pcsrc = 1'b1;
    pc_from_exmem = 32'd8;
     repeat (5) @(posedge clk);
    
    $finish;
  end 
endmodule
