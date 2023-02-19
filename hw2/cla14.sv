module cla14 #(parameter N = 14, parameter R = 3)
    (input logic [N:0] A, B,
    input logic Cin,
    output logic [N:0] S);
    logic [N:0] C, P, G;

    assign S[N] = 1'b0;
    assign G[N] = 1'b0;
    assign P[N] = 1'b0;
    assign C[N] = 1'b0;
    assign A[N] = 1'b0;
    assign B[N] = 1'b0;

    assign C[0] = Cin;

    RFA rfa_blk_0 [2:0] (
        .a              (A[2:0]),
        .b              (B[2:0]),
        .c              (C[2:0]),
        .p              (P[2:0]),
        .g              (G[2:0]),
        .s              (S[2:0]) 
    );

    RFA rfa_blk_1 [5:3] (
        .a              (A[5:3]),
        .b              (B[5:3]),
        .c              (C[5:3]),
        .p              (P[5:3]),
        .g              (G[5:3]),
        .s              (S[5:3]) 
    );

    RFA rfa_blk_2 [8:6] (
        .a              (A[8:6]),
        .b              (B[8:6]),
        .c              (C[8:6]),
        .p              (P[8:6]),
        .g              (G[8:6]),
        .s              (S[8:6]) 
    );

    RFA rfa_blk_3 [11:9] (
        .a              (A[11:9]),
        .b              (B[11:9]),
        .c              (C[11:9]),
        .p              (P[11:9]),
        .g              (G[11:9]),
        .s              (S[11:9]) 
    );

    RFA rfa_blk_4 [14:12] (
            .a              (A[14:12]),
            .b              (B[14:12]),
            .c              (C[14:12]),
            .p              (P[14:12]),
            .g              (G[14:12]),
            .s              (S[14:12]) 
        );

    bclg3 bclg3_blk_0 (
        .g              (G[2:0]),
        .p              (P[2:0]),
        .cin            (Cin),
        .cout           (C[2:1]),
        .pout           (P[2:0]),
        .gout           (G[2:0])
    );

    bclg3 bclg3_blk_1 (
    .g              (G[5:3]),
    .p              (P[5:3]),
    .cin            (C[3]),
    .cout           (C[5:4]),
    .pout           (P[5:3]),
    .gout           (G[5:3])
);

bclg3 bclg3_blk_2 (
    .g              (G[8:6]),
    .p              (P[8:6]),
    .cin            (C[6]),
    .cout           (C[8:7]),
    .pout           (P[8:6]),
    .gout           (G[8:6])
);

bclg3 bclg3_blk_3 (
    .g              (G[11:9]),
    .p              (P[11:9]),
    .cin            (C[9]),
    .cout           (C[11:10]),
    .pout           (P[11:9]),
    .gout           (G[11:9])
);

bclg3 bclg3_blk_4 (
    .g              (G[14:12]),
    .p              (P[14:12]),
    .cin            (C[12]),
    .cout           (C[14:13]),
    .pout           (P[14:12]),
    .gout           (G[14:12])
);

bclg3 bclg3_lal_0 (
    .g(G[8:0]),
    .p(P[8:0]),
    .cin(C[0]),
    .cout({C[6], C[3]}),
    .gout(G[8:0])
);

bclg3 bclg3_lal_1 (
    .g(G[14:9]),
    .p(P[14:9]),
    .cin(C[9]),
    .cout(C[12]),
    .gout(G[14:9])
);

bclg3 bclg3_final_stage (
    .g(G[14:0]),
    .p(P[14:0]),
    .cin(C[0]),
    .cout(C[9]),
    .gout(G[14:0])
);

endmodule

module RFA 
    (input logic a, b, c,
    output logic s, p, g);
    assign g = a & b;
    assign p = a | b;
    assign s = (~((p & ~g) & c)) & (c | (p & ~g));
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