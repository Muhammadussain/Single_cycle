module alu_mux (
    input wire [2:0] imme_sel,
    input wire [31:0] rs2,
     input wire [31:0] i_imme,
    input wire [31:0] s_imme,
    input wire [31:0] b_imme,
    input wire [31:0] uj_imme,
<<<<<<< HEAD
    input wire [31:0] u_imme,
=======
>>>>>>> fd1ce303ca5ee1c79a9a8170700a0c8db2cd483b
    output reg [31:0] op_b
);
      always @(*) begin
        case (imme_sel)
            3'b000: op_b = rs2;
            3'b001: op_b = i_imme;
<<<<<<< HEAD
            3'b010: op_b  =b_imme;
            3'b011: op_b = s_imme;
            3'b100: op_b = u_imme;
=======
            3'b011: op_b = s_imme;
            3'b010: op_b  =b_imme;
>>>>>>> fd1ce303ca5ee1c79a9a8170700a0c8db2cd483b
            3'b101: op_b  =uj_imme;
        endcase
      end
endmodule