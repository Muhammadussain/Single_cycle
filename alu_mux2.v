module alu_mux2 (
    input wire [31:0] rs1,
    input wire [31:0] pc_out,
    input wire branch,
    output reg [31:0] res
);

always @(*) begin
    if(branch)begin
        res=pc_out;

    end
    else 
    res=rs1;
end
endmodule