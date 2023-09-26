`include "typedecode.v"
`include "alu_controller.v"
`include "controller.v"
module top_controller(
    input wire [31:0] inst,
  output wire [3:0] alu_controller,
 output  wire mem_write,
    output  wire reg_write,
   output  wire [2:0] imme_sel,
    output wire store,
    output wire branch,
    output wire jal,
    output wire jalr,
    output wire lui,
    output wire auipc,

     output wire [1:0] rd_sel,
    output wire [1:0] rs1_sel,

    output wire load
    
 );
    wire r_type;
    wire i_type;
  


typedecode u_typedecode(
    .opcode(inst[6:0]),
    .r_type(r_type),
    .i_type(i_type),
    .store(store),
    .branch(branch),
    .load(load),
    .jal(jal),
    .auipc(auipc),
    .lui(lui),
    .jalr(jalr)


);

controller u_controller(

    
     .r_type(r_type),
     .i_type(i_type),
     .store(store),
    .branch(branch),
    .load(load),
    .jal(jal),
    .lui(lui),
    .auipc(auipc),
    .jalr(jalr),
    .rd_sel(rd_sel),
     .rs1_sel(rs1_sel),
     .mem_write(mem_write),
     .reg_write(reg_write),
     .imme_sel(imme_sel)
);

alu_control u_alu_control (
    .r_type(r_type),
    .i_type(i_type),
    .store(store),
    .load(load),
    .jal(jal),
    .auipc(auipc),
    .lui(lui),
    .branch(branch),
   .func3(inst[14:12]),
    .func7(inst[30]),
    .alu_controller(alu_controller)

);



endmodule