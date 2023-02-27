`timescale 1ps/1ps

module mult_tb ();;
    logic clk = 1;

    always clk = #5 ~clk;
    logic signed [15:0] X;
    logic signed [7:0]  Y;
    logic signed [23:0] Z;

    initial begin
        assign X = 1;
        assign Y = -128;
    end

    mult mut (.X(X),
              .Y(Y),
              .Z(Z));
            
    integer seed = 1000; // change seed to generate new random numbers

    integer count = 0;
    integer positive = 0;
    always @(posedge clk) begin
        #5 $display("  X = %d", X);
        #5 $display("* Y = %d", Y);
        #5 $display("Value of Z = %d", Z);
        if ((X * Y) == Z)
            #5 $display("Passed!!!!");
        else
            #5 $display("FAILED!!!");
        
        if (positive == 0) begin
            assign X = $random(seed * count)%65536;
            assign Y = Y + 1;
            positive = 1;
        end else begin 
            assign X = $urandom(seed * count)%65536;
            assign Y = Y + 1;
            positive = 0;
        end
        assign count = count + 1;
    end
endmodule