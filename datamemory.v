module datamem(
    input wire clk,
    input wire load,
    input wire store,
    input wire [7:0] address,
    input wire [31:0] data_mem_in,
    input wire [3:0] masking,

    output reg [31:0] data_mem_out
);

    reg [31:0] mem [0:255];

    always @ (posedge clk) begin 
        if(store)begin
            // mem[address] <= data_mem_in;

            if(masking[0]) begin
                mem[address][7:0] <= data_mem_in[7:0];
            end
            if(masking[1]) begin
                mem[address][15:8] <= data_mem_in[15:8];
            end
            if(masking[2]) begin
                mem[address][23:16] <= data_mem_in[23:16];
            end
            if(masking[3]) begin
                mem[address][31:24] <= data_mem_in[31:24];
            end
        end
    end

    always @(*) begin
        
        if(load)begin
            data_mem_out= mem[address];
        end
        
    end
endmodule