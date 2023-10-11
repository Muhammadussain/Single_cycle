`include "regfile_mux.v"
module writeback (
      
    input wire [31:0] data_alu_out,
    input wire [31:0] data_reg_l,
    input wire [31:0] pc_o,
    input wire [1:0] rd_select,
    input wire load,
    input wire [31:0]lui_imme,
    output wire [31:0] data
);

regfile_mux u_regfile_mux (
    .data_alu_out(data_alu_out),
    .data_reg_l(data_reg_l),
    .load(load),
    .lui_imme(lui_imme),
    .pc_o(pc_o),
    .rd_select(rd_select),
    .data(data)

);
    
endmodule