module pc (
    input wire clk,
    input wire rst,
    input wire [31:0] address_in,
    input wire branch ,
    input wire jal,
    input wire jalr,
    input wire [31:0] aluout,
    //input wire  [31:0] rd_out,
    input wire branchsignal,
    output reg [31:0]address_out

);

always @(posedge clk ) begin
    if(!rst)begin
        address_out <= 0;
    end
    
    else if (branchsignal && branch)
    address_out <= aluout;
    

    else if (jal)begin
    address_out <= aluout ;
    end
     else if (jalr)begin
    address_out <= aluout /*+rd_out*/;
    end
    else begin
        address_out <= address_out + 32'd4;
    end
end
endmodule