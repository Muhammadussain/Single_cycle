module datamemory (
    input wire clk,
    input wire store,
    input wire [7:0] address,
    input wire load,
    input wire [31:0] data_in,

    output reg [31:0] data_out
);
    reg [31:0] datamem [255:0];
    
    always @(posedge clk)begin
        
        if(store) begin

          datamem[address]<=data_in;
        end

    end
    always @(*)begin
    data_out=datamem[address];
    end
endmodule