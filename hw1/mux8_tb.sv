`timescale 1ps/1ps
module mux8_tb;
    logic[2:0] s = 3'b000;
    logic [63:0] d0, d1, d2, d3, d4, d5, d6, d7;
    logic [63:0] y;
    logic clk = 1;
    integer count = 1;
    always clk = #5 ~clk;

    testmux8 #(.N(64)) mut(.s(s), 
                        .d0(d0), 
                        .d1(d1), 
                        .d2(d2), 
                        .d3(d3), 
                        .d4(d4), 
                        .d5(d5), 
                        .d6(d6), 
                        .d7(d7), 
                        .y(y));

    integer seed = 540; // change seed to generate new random numbers

    always @(posedge clk) begin
        assign s = $urandom(seed + (count * 9))%7;
        assign count = count + 1;

        #0 $display("Value of y = %d", y);
    end

    initial begin
        // Generate random numbers based on the seed given
        assign d0 = $urandom(seed)%20;
        assign d1 = $urandom(seed * 2)%20;
        assign d2 = $urandom(seed * 3)%20;
        assign d3 = $urandom(seed * 4)%20;
        assign d4 = $urandom(seed * 5)%20;
        assign d5 = $urandom(seed * 6)%20;
        assign d6 = $urandom(seed * 7)%20;
        assign d7 = $urandom(seed * 8)%20;

        // Display iteration, random values, and the result
        #0 $display ("Value of d0 = %0d", d0);
        #0 $display ("Value of d1 = %0d", d1);
        #0 $display ("Value of d2 = %0d", d2);
        #0 $display ("Value of d3 = %0d", d3);
        #0 $display ("Value of d4 = %0d", d4);
        #0 $display ("Value of d5 = %0d", d5);
        #0 $display ("Value of d6 = %0d", d6);
        #0 $display ("Value of d7 = %0d", d7);
    end
endmodule