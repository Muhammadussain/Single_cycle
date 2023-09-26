module alu_control (
   
    input wire r_type,
    input wire i_type,
    input wire store,
    input wire load,
    input wire branch,
    input wire jal,
    input wire lui,
    input wire auipc,
    input wire [2:0] func3,
    input wire func7,
    output reg [3:0] alu_controller
);

always @(*) begin
    if (r_type) begin
        alu_controller = (func3[2:0] == 3'b000 & func7 == 0) ? 4'b0000 :
                         (func3[2:0] == 3'b000 & func7 == 1) ? 4'b1001 :
                         (func3[2:0] == 3'b001 & func7 == 0) ? 4'b0001 :
                         (func3[2:0] == 3'b010 & func7 == 0) ? 4'b0010 :
                         (func3[2:0] == 3'b011 & func7 == 0) ? 4'b0011 :
                         (func3[2:0] == 3'b100 & func7 == 0) ? 4'b0100 :
                         (func3[2:0] == 3'b101 & func7 == 0) ? 4'b0101 :
                         (func3[2:0] == 3'b101 & func7 == 1) ? 4'b0110 :
                         (func3[2:0] == 3'b110 & func7 == 0) ? 4'b0111 :
                         (func3[2:0] == 3'b111 & func7 == 0) ? 4'b1000 : 4'b0000;
    end
    else if (i_type) begin
        alu_controller = (func3[2:0] == 3'b000 & func7 == 0) ? 4'b0000 :
                         (func3[2:0] == 3'b001 & func7 == 0) ? 4'b0001 :
                         (func3[2:0] == 3'b010 & func7 == 0) ? 4'b0010 :
                         (func3[2:0] == 3'b011 & func7 == 0) ? 4'b0011 :
                         (func3[2:0] == 3'b100 & func7 == 0) ? 4'b0100 :
                         (func3[2:0] == 3'b101 & func7 == 0) ? 4'b0101 :
                         (func3[2:0] == 3'b101 & func7 == 1) ? 4'b0110 :
                         (func3[2:0] == 3'b110 & func7 == 0) ? 4'b0111 :
                         (func3[2:0] == 3'b111 & func7 == 0) ? 4'b1000 : 4'b0000;
    end
    else if (store) begin
        alu_controller = 4'b0000;
    end
      else if (load) begin
        alu_controller = 4'b0000;
    end
     else if (branch) begin
        alu_controller = 4'b0000;
    end
     else if (jal) begin
        alu_controller = 4'b0000;
    end
     else if (lui) begin
        alu_controller = 4'b0000;
    end
     else if (auipc) begin
        alu_controller = 4'b0000;
    end
    
end

endmodule
