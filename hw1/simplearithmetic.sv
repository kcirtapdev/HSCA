module simplearithmetic #(parameter N = 64) (
    input logic [N-1:0] A,B,C,
    output logic [N-1:0] Z);
    assign Z = (A * B) + C;
endmodule