module regfile_mux (
    input wire [31:0] data_alu_out,
    input wire [31:0] data_reg_l,
    input wire [31:0] pc_o,
    input wire [1:0] rd_select,
    input wire load,
    input wire [31:0]lui_imme,
    output reg [31:0] data
);
      
    always @(*) begin
       if(load)begin
        data=data_reg_l;

       end
      
        if (rd_select==2'b01)
             begin
                data = pc_o +32'd4;
            end
            if (rd_select==2'b10)
             begin
                data = lui_imme;
            end
             else
            data=data_alu_out;
             end
    
 endmodule
// module rd_mux (
//     input wire [31:0] alu_o,
//     input wire [31:0] pc_o,
//     input wire [1:0] rd_select,
//     output reg [31:0] rd_o
// );

//     always @(*) begin
       
//     end
// endmodule