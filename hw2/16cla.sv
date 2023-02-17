module cla16 #(parameter N = 64)
    (input logic [2:0] s,
    input logic [N-1:0] d0, d1, d2, d3, d4, d5, d6, d7,
    output logic [N-1:0] y);
    
    always @ (d0, d1, d2, d3, d4, d5, d6, d7, s) begin
        case (s)
            3'b000  : y = d0;
            3'b001  : y = d1;
            3'b010  : y = d2;
            3'b011  : y = d3;
            3'b100  : y = d4;
            3'b101  : y = d5;
            3'b110  : y = d6;
            3'b111  : y = d7;
            default : y = d0;
        endcase
    end
endmodule