`include "Typedecode.v"
`include "alu_controller.v"
`include "controller.v"
//`include "top_controller.v"
`include "imme.v"
`include "regfile.v"
`include "alu.v"
//`include "ram.v"
module datapath(
    input wire [31:0] inst ,
    input wire rst,
    input wire clk
);

wire [31:0] s_imme;
wire [31:0] i_imme;
wire  [31:0] rs1;  
wire [31:0] rs2;
wire [31:0] out;

 wire r_type;
    wire i_type;
    wire store;
    wire [3:0] alu_controller;

     wire mem_write;
     wire reg_write;
     wire operand_b;
     wire [1:0] imme_sel;


// wire mem_write;
// wire reg_write;
// wire operand_b;
// wire [1:0] imme_sel;
// wire [3:0] alu_controller;






// top_controller u_top_controller(
//     .clk(clk),
//     .inst(inst)
// );

immediate_generator u_immediate_generator(
    
    .inst(inst),
    .s_imme(s_imme),
    .i_imme(i_imme)
);

regfile u_regfile(
    .rd_add(inst[11:7]),
    .rs1_add(inst[19:15]),
    .rs2_add(inst[24:20]),
    .rs1(rs1),
    .rs2(rs2),
    .clk(clk),
    .rst(rst),
    .data(out),        
    .enable(reg_write)
);
alu u_alu (
    .rs1(rs1),         
    .rs2(rs2),          
    .op(alu_controller[3:0]),
    .out(out),          
    .i_imme(i_imme),
    .imme_sel(imme_sel[1:0])
);


typedecode u_typedecode(
    
    .opcode(inst[6:0]),
    .r_type(r_type),
    .i_type(i_type),
    .store(store)

);

controller u_controller(

     .r_type(r_type),
     .i_type(i_type),
     .store(store),
     .mem_write(mem_write),
     .reg_write(reg_write),
     .operand_b(operand_b),
     .imme_sel(imme_sel)
);

alu_control u_alu_control (
    
    .r_type(r_type),
    .i_type(i_type),
    .store(store),
   .func3(inst[14:12]),
    .func7(inst[30]),
    .alu_controller(alu_controller)

);

// ram u_ram(
//     .clk(clk),
//     .address(out),
//     .data(rs2),
//     .store(store)
// );

endmodule
