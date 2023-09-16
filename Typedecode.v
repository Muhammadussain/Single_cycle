module typedecode(
    input wire [6:0] opcode,
    output reg r_type,
    output reg i_type,
    output reg store
);

always @(*) begin
    r_type = 0;
    i_type = 0;
    store = 0;
    
    case (opcode)
        7'b0110110: r_type = 1;
        7'b0100011: store = 1;
        7'b0010011: i_type = 1;
    endcase
end

endmodule
