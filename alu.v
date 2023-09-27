module alu (
    
    input wire [31:0] rs1,
    input wire [31:0] rs2,
    input wire [3:0] op,
    output reg [31:0] out
   
   
);
    always @(*) begin
        
    
        case (op)
            4'b0000: out = rs1 + rs2;
            4'b0001: out = rs1 << rs2[4:0];
            4'b0010: out = (rs1 < rs2) ? 32'b1 : 32'b0;
            4'b0011: out = (rs1 < rs2) ? 32'b1 : 32'b0;
            4'b0100: out = rs1 ^ rs2;
            4'b0101: out = rs1 >> rs2[4:0];
            4'b0110: out = rs1 >>> rs2[4:0];
            4'b0111: out = rs1 | rs2;
            4'b1000: out = rs1 & rs2;
            4'b1001: out = rs1 - rs2;
            default: out = 32'b0;
        endcase
   end
endmodule
