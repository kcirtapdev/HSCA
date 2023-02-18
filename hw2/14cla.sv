module cla #(parameter N = 14) 
    (input [N-1:0] A, B
    input Cin,
    output [N-1:0] sum,
    output Cout);

    logic [N-1:0] G, P, C;

    assign c[0] = Cin;

    assign G[0] = A[0] & B[0]; 
    assign P[0] = A[0] ^ B[0]; // Initial checks

    genvar i;
    generate
        for (i = 1; i < N; i = i + 3) begin
            assign G[i] = A[i] & B[i];
            assign P[i] = A[i] ^ B[i];

            assign G[i+1] = G[i-1] & P[i-1];
            assign P[i+1] = P[i-1] | (G[i-1] & P[i-1]);
            
            assign G[i+2] = G[i] & P[i] & P[i+1];
            assign P[i+2] = G[i] & P[i+1] | (G[i] & P[i+1]) | (G[i+1] & P[i]);

            assign C[i] = G[i] | (P[i] & C[i-1]);
            assign C[i+1] = G[i+1] | (P[i+1] & C[i]);
            assign C[i+2] = G[i+2] | (P[i+2] & C[i+1]);
        end
    endgenerate

    assign sum = a + b + cin;
    assign cout = c[N-1];

endmodule
