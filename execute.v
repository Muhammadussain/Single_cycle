`include "alu.v"
`include "alu_mux.v"
`include "alu_mux2.v"
`include "branch.v"

module execute (
    input wire [31:0] rs1,
    input wire [31:0] rs2,
    input wire [3:0] op,
    output wire [31:0] out,

    input wire [31:0] pc_out,

    input wire [1:0] rs_sel,
    input wire [2:0] imme_sel,
    input wire [31:0] i_imme,
    input wire [31:0] s_imme,
    input wire [31:0] b_imme,
    input wire [31:0] uj_imme,
    input wire [31:0] u_imme,
    input wire [31:0] a_rs1,
    input wire [31:0] a_rs2,
    
    input wire bena,
    input wire [2:0] func_3,
    output wire branchsignal,
    output  wire [31:0] res,
    output wire [31:0] op_b
);




alu_mux u_alu_mux(
    .imme_sel(imme_sel),
    .rs2(rs2),
    .uj_imme(uj_imme),
    .i_imme(i_imme),
    .u_imme(u_imme),
    .b_imme(b_imme),
    .s_imme(s_imme),
    .op_b(op_b)
);

alu_mux2 u_alu_mux2(
    .rs1(rs1),
 .rs_sel(rs_sel),
    .pc_out(pc_out),

    .res(res)
);
alu u_alu (
    .a_rs1(a_rs1),
    .a_rs2(a_rs2),
    .op(op),
    .out(out)
);
branch u_branch(
    .rs1(rs1),
    .rs2(rs2),
    //branch
    .bena(bena),
    .func_3(func_3),
    .branchsignal(branchsignal)
    );

endmodule