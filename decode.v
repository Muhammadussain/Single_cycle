`include "top_controller.v"
`include "imme.v"
`include "regfile.v"


module decode (
    //topcon
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
    output wire we_re,
    output wire load,


//imme
    
    output wire [31:0] s_imme,
    output wire [31:0] b_imme,
     output wire [31:0] u_imme,
    
    output wire [31:0] uj_imme,    
    output wire [31:0] i_imme,
 
    //regfile
    input wire [4:0] rd_add,
    input wire [4:0] rs1_add,
    input wire [4:0] rs2_add,
    input wire clk,
    input wire rst,
    input wire [31:0] data_i,
    input wire reg_enable,
    output wire [31:0] rs1,
    output wire [31:0] rs2
 
);
    

top_controller u_top_controller(
    
    .inst(inst),
    .alu_controller(alu_controller),
    .mem_write(mem_write),
    .load(load),
    .branch(branch),
    .store(store),
    .jal(jal),
    .jalr(jalr),
    .we_re(we_re),
    .rd_sel(rd_sel),
    .rs1_sel(rs1_sel),
    .reg_write(reg_write),
    .imme_sel(imme_sel)

);

immediate_generator u_immediate_generator(
    
    .inst(inst),
    .s_imme(s_imme),
    .i_imme(i_imme),
    .uj_imme(uj_imme),
    .u_imme(u_imme),
    .b_imme(b_imme)
);


regfile u_regfile(
    //changes made from inst to same kerdiya
    .rd_add(rd_add),
    .rs1_add(rs1_add),
    .rs2_add(rs2_add),
    .rs1(rs1),
    .rs2(rs2),
    .clk(clk),
    .data_i(data_i),
    .rst(rst),       
    .reg_enable(reg_enable)
);

endmodule