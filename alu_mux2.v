module alu_mux2 (
    input wire [31:0] rs1,
    input wire [31:0] pc_out,
    //input wire branch,
    //input wire jal,
    input wire [1:0] rs_sel,
    
    output reg [31:0] res
);

always @(*) begin
    if(rs_sel==2'b01)begin
        res=pc_out;

    end
    else if(rs_sel==2'b00)begin
        res=rs1;
    end
    else if(rs_sel==2'b10)begin
        res=pc_out;
    end
    else 
    res=rs1;
end
endmodule