`include "pc.v"

module fetch (
    input wire clk,
    input wire rst,

    //for 
    input wire request_i,
    input wire request_o,
    
    input wire [31:0] address_in,
    input wire branch ,
    input wire jal,
    input wire jalr,
    input wire [31:0] aluout,
  
    input wire branchsignal,
    output wire [31:0]address_out
);
    
pc u_pc(
    .clk(clk),
    .rst(rst),
    
.branch(branch),
.jal(jal),
.jalr(jalr),
.address_in(0),
.branchsignal(branchsignal),
.aluout(aluout),

.address_out(address_out)

);
endmodule