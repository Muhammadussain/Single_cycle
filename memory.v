`include "wrapper.v"
module memory(
    input wire clk,
    input  wire load ,
    input wire store,
    output wire memory_l,
    output wire memory_s,
    input wire [31:0] data_in_l,
    input wire [31:0] data_in_s,
    input wire [2:0] func3,
    input wire [1:0] byte_address,
   
 
    output wire [31:0]data_out_l,
    output wire [31:0]data_out_s,
    output  wire [3:0] wrapmasking

);
wrapper u_wrapper(
.load(load),
.store(store),
.data_in_l(data_in_l),
.data_in_s(data_in_s),
.data_out_l(data_out_l),
.data_out_s(data_out_s),
.func3(func3),
.byte_address(byte_address),
.wrapmasking(wrapmasking)
);

endmodule