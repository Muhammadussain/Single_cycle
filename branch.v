module branch (
    input wire [31:0] rs1,
    input wire [31:0] rs2,
    input wire bena,
    input wire [2:0] func_3,
    output reg branchsignal
);
always @(*) begin
    if (bena)begin
    case(func_3)
    3'b000:branchsignal=($signed (rs1)==$signed(rs2))?1:0; //beq
    3'b001:branchsignal=($signed (rs1)!=$signed (rs2))?1:0; //bne
    3'b100:branchsignal=($signed (rs1)<$signed (rs2))?1:0; //blt    
    3'b101:branchsignal=($signed (rs1)>=$signed (rs2))?1:0;//bge
    3'b110:branchsignal=(rs1<rs2)?1:0;  //bltu
    3'b111:branchsignal=(rs1>=rs2)?1:0;//bgeu
  


    endcase
    end
end
    
endmodule