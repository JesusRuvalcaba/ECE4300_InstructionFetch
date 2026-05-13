`timescale 1ns / 1ps


module adder #(parameter WIDTH = 32)(
    input [WIDTH-1:0] a,
    output [WIDTH-1:0] adder_out
    );
    
    assign adder_out = a + 32'd4;   
    
endmodule
