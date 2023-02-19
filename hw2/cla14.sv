module cla14 (#parameter N = 14)
    (input logic [N-1:0] A, B,
    input logic Cin,
    output logic [N-1:0] S);
    
endmodule

module RFA 
    (input logic a, b, c,
    output logic s);
    logic g = a & b;
    logic p = a | b;
    assign s = ~((p & ~g) & c) & (c | (p & ~g));
endmodule : RFA

module bclg3 
    (input logic[2:0] g, p)

endmodule : bclg3