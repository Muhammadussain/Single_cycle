module alu (
    input wire [1:0] imme_sel,
    input wire [31:0] rs1,
    input wire [31:0] rs2,
    input wire [3:0] op,
    output reg [31:0] out,
   
    input wire [31:0] i_imme,
    input wire [31:0] s_imme
);

    reg [31:0] op_b;

    always @(*) begin
        case (imme_sel)
            2'b00: op_b = rs2;
            2'b01: op_b = i_imme;
            2'b10: op_b = s_imme;
            default: op_b = 32'b0;
        endcase

        case (op)
            4'b0000: out = rs1 + op_b;
            4'b0001: out = rs1 << op_b[4:0];
            4'b0010: out = (rs1 < op_b) ? 32'b1 : 32'b0;
            4'b0011: out = (rs1 < op_b) ? 32'b1 : 32'b0;
            4'b0100: out = rs1 ^ op_b;
            4'b0101: out = rs1 >> op_b[4:0];
            4'b0110: out = rs1 >>> op_b[4:0];
            4'b0111: out = rs1 | op_b;
            4'b1000: out = rs1 & op_b;
            4'b1001: out = rs1 - op_b;
            default: out = 32'b0;
        endcase
    end
endmodule
