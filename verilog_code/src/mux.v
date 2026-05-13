`timescale 1ns / 1ps

module mux #(parameter WIDTH = 32)(
    input [WIDTH-1:0] in_0,
    input[WIDTH-1:0] in_1,
    input select,
    output[WIDTH-1:0] mux_out
);
    assign mux_out = select ? in_1 : in_0 ;

endmodule
