module rd_mux (
    input wire [31:0] alu_o,
    input wire [31:0] pc_o,
    input wire [1:0] rd_select,
    output reg [31:0] rd_o
);

    always @(*) begin
        case (rd_select)
            2'b01: begin
                rd_o = pc_o +32'd4;
            end
            default: begin
                rd_o = alu_o;
            end
        endcase
    end
endmodule
