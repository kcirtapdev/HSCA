`timescale 1ps/1ps
module cla14_tb;
    logic [13:0] a, b, s;
    logic clk = 1;

    always clk = #5 ~clk;

    cla14 #(.N(14)) mut(.A(a), 
                        .B(b), 
                        .Cin(1'b0),
                        .S(s));

    integer seed = 540; // change seed to generate new random numbers
    integer count = 1;
    integer addarithm = 0;
    always @(posedge clk) begin
        assign a = $urandom(seed + (count * 1))%10;
        assign b = $urandom(seed + (count * 2))%10;
        assign count = count + 1;

        #5 $display("  %b", a);
        #5 $display("+ %b", b);
        #5 $display("Value of s = %b", s);
        assign addarithm = a + b;
        #5 $display("%d == %d", s, addarithm);
        assign a = 14'b0;
        assign b = 14'b0;
    end
endmodule