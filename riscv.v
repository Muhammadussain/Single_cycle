`include "top_controller.v"
`include "imme.v"
`include "regfile.v"
`include "alu.v"
`include "pc.v"
`include "datamemory.v"
`include "instruction_mem.v"
`include "wrapper.v"
`include "alu_mux.v"
`include "alu_mux2.v"
`include "branch.v"
// `include "rd_mux.v"
`include "regfile_mux.v"

module riscv(
    input wire rst,
    input wire clk,
    input wire enable
);
wire [31:0] address_out;
wire [1:0] rd_sel;
wire [1:0] rs1_sel;
wire [31:0] pc_address_out;
wire [31:0] instr_out;
wire [3:0] alu_controller;
wire mem_write;
wire reg_write;
wire [2:0] imme_sel;
wire r_type;
wire i_type;
wire branch;
wire jal;
wire jalr;
wire branchsignal;
wire load;
wire store;
wire [31:0] s_imme;
wire [31:0] i_imme;
wire [31:0] uj_imme;
wire [31:0] u_imme;
wire [31:0] b_imme;
wire [31:0] data;
wire [31:0] out;
wire [31:0] op_b;
wire [31:0] data_out_l;
wire  [31:0] rs1;  
wire [31:0] rs2;
wire [31:0] res;
wire [31:0] rd_o;
//wire reg_enable;

wire [31:0] data_in_l;
wire [31:0] data_in_s;

wire [31:0] data_out_s;
//wire [31:0] data_out_l;
wire [1:0] byte_address;
wire [3:0] wrapmasking;
wire [31:0] data_mem_in;
wire [31:0] data_mem_out;
//ire [7:0] address;
// wire mem_write;
// wire reg_write;
// wire operand_b;
// wire [1:0] imme_sel;
// wire [3:0] alu_controller;




pc u_pc(
    .clk(clk),
    .rst(rst),
.branch(branch),
.jal(jal),
.jalr(jalr),
.address_in(0),
//.rd_out(rd_o),
.branchsignal(branchsignal),
.aluout(out),

.address_out(address_out)

);
instructionmemory u_instructionmemory(
.clk(clk),
.enable(enable),
.address(address_out[9:2]),
// .data_in(pc_address_out),
.data_out(instr_out)

);

top_controller u_top_controller(
    
    .inst(instr_out),
    .alu_controller(alu_controller),
    .mem_write(mem_write),
    .load(load),
    .branch(branch),
    .store(store),
    .jal(jal),
    .jalr(jalr),
    .rd_sel(rd_sel),
    .rs1_sel(rs1_sel),
    .reg_write(reg_write),
    .imme_sel(imme_sel)

);

immediate_generator u_immediate_generator(
    
    .inst(instr_out),
    .s_imme(s_imme),
    .i_imme(i_imme),
    .uj_imme(uj_imme),
    .u_imme(u_imme),
    .b_imme(b_imme)
);

regfile_mux u_regfile_mux (
    .data_alu_out(out),
    .data_reg_l(data_out_l),
    .load(load),
    .lui_imme(u_imme),
    .pc_o(address_out),
    .rd_select(rd_sel),
    .data(data)

);
regfile u_regfile(
    
    .rd_add(instr_out[11:7]),
    .rs1_add(instr_out[19:15]),
    .rs2_add(instr_out[24:20]),
    .rs1(rs1),
    .rs2(rs2),
    .clk(clk),
    .data_i(data),
    .rst(rst),       
    .reg_enable(reg_write)
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
   // .jal(jal),
     .rs_sel(rs1_sel),
    .pc_out(address_out),
   // .branch(branch),
    .res(res)
);
alu u_alu (
    .rs1(res),         
    .rs2(op_b),          
    .op(alu_controller[3:0]),
    .out(out)
);
// rd_mux u_rd_mux(
//     .alu_o(out),
//     .pc_o(address_out),
//     .rd_select(rd_sel),
//     .rd_o(rd_o)
// );
branch u_branch(
    .rs1(rs1),
    .rs2(rs2),
    .bena(branch),
    .func_3(instr_out[14:12]),
    .branchsignal(branchsignal)
    );

datamem u_datamem(
    .clk(clk),
    .load(load),
    .store(store),
    .address(out[9:2]),
    .data_mem_in(data_out_s),
    .masking(wrapmasking),
    .data_mem_out(data_mem_out)

);


wrapper u_wrapper(
.load(load),
.store(store),
.data_in_l(data_mem_out),
.data_in_s(rs2),
.data_out_l(data_out_l),
.data_out_s(data_out_s),
.func3(instr_out[14:12]),
.byte_address(out[1:0]),
.wrapmasking(wrapmasking)
);


endmodule





















































// typedecode u_typedecode(
    
//     .opcode(inst[6:0]),
//     .r_type(r_type),
//     .i_type(i_type),
//     .store(store)

// );

// controller u_controller(

//      .r_type(r_type),
//      .i_type(i_type),
//      .store(store),
//      .mem_write(mem_write),
//      .reg_write(reg_write),
//      .operand_b(operand_b),
//      .imme_sel(imme_sel)
// );

// alu_control u_alu_control (
    
//     .r_type(r_type),
//     .i_type(i_type),
//     .store(store),
//    .func3(inst[14:12]),
//     .func7(inst[30]),
//     .alu_controller(alu_controller)

// );