`timescale 1ps/1ps
module simplearithmetic_tb;
    logic [63:0] A, B, C;
    logic [63:0] Z;

    simplearithmetic #(.N(64)) mut(.A(A),
                                   .B(B),
                                   .C(C),
                                   .Z(Z));
    

    integer i;
    integer seed = 0; // Change this number to get different random numbers.
    initial begin
        #0 $display ("Using seed: %0d", seed);
        for (i = 0; i <= 10; i = i + 1) // We will test this module 10 times.
        begin
            // Generate random numbers based on the seed given
            assign A = $urandom(seed + i)%20;
            assign B = $urandom(seed + i * 2)%20;
            assign C = $urandom(seed + i * 3)%20;

            // Display iteration, random values, and the result
            #5 $display ("Iteration %0d", i);
            #0 $display ("Value of A = %0d, B = %0d, C = %0d", A, B, C);
            #0 $display ("Result of Z = A * B + C = %0d", Z);
            #0 $display ("");
        end
    end
endmodule