`timescale 1ps/1ps

module 16cla_tb;
    logic clk = 1;
    always clk = #5 ~clk;
endmodule