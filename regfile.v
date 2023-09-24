module regfile (
    input wire [4:0] rd_add,
    input wire [4:0] rs1_add,
    input wire [4:0] rs2_add,
    input wire clk,
    input wire rst,
    input wire [31:0] data_i,
    input wire reg_enable,
    output reg [31:0] rs1,
    output reg [31:0] rs2
);

    reg [31:0] rd [31:0];
    reg [31:0] i;
    
  
    always @(posedge clk) begin
        if (!rst) begin
            for (i = 0; i < 32; i = i + 1)
                rd[i] <= 32'b0;
        end else begin
            if (reg_enable) begin
                rd[0] <= 32'b00000000000000000000000000000000;
                rd[rd_add] <= data_i;
            end
        end
    end

    always @(*) begin
        rs1 = rd[rs1_add];
        rs2 = rd[rs2_add];
    end

endmodule
