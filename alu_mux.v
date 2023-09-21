module alu_mux (
    input wire [1:0] imme_sel,
    input wire [31:0] rs2,
     input wire [31:0] i_imme,
    input wire [31:0] s_imme,
    input wire [31:0] b_imme,
    output reg [31:0] op_b
);
      always @(*) begin
        case (imme_sel)
            2'b00: op_b = rs2;
            2'b01: op_b = i_imme;
            2'b10: op_b = s_imme;
            2'b11: op_b  =b_imme;
        endcase
      end
endmodule