module cla14 (#parameter N = 14, R = 3)
    (input logic [N-1:0] A, B,
    input logic Cin,
    output logic [N-1:0] S);
    logic [N-1:0] C, P, G, S;
    assign C[0] = Cin;
    genvar i, j;
    generate;
        for (i = 0; i < (N/R); i += 1) begin
            for (j = 0; j < R; j += 1)
                RFA(A[i + j], B[i + j], C[i + j], S[i + j])
            bclg3()
        end
    endgenerate
    RFA()
endmodule

module RFA 
    (input logic a, b, c,
    output logic s);
    logic g = a & b;
    logic p = a | b;
    assign s = ~((p & ~g) & c) & (c | (p & ~g));
endmodule : RFA

// Credits to Dr. Stine
module bclg3 
    (input logic[2:0] g, p,
    input logic cin,
    output logic [2:1] cout, 
    output logic pout, gout);

    assign cout[1] = g[0] | (p[0] & cin);
    assign cout[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);

    assign gout = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]);
    assign pout = (p[2] & p[1] & p[0] & cin);
endmodule : bclg3