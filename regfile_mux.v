module regfile_mux (
    input wire [31:0] data_alu_out,
    input wire [31:0] data_reg_l,
    input wire load,
    output reg [31:0] data
);
      
    always @(*) begin
       if(load)begin
        data=data_reg_l;

       end
       else
       data=data_alu_out;
    end
endmodule