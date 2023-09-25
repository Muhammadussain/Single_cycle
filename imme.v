module immediate_generator(
    input wire [31:0] inst,
    output reg [31:0] s_imme,
    output reg [31:0] b_imme,    
    output reg [31:0] uj_imme,    
    output reg [31:0] i_imme
);

always @(*) begin
    case (inst[31])
        1'b1: begin
            s_imme = {20'b11111111111111111111, inst[31:25], inst[11:7]};
            i_imme = {20'b11111111111111111111, inst[31:20]};
                 b_imme = {19'b1111111111111111111,inst[31],inst[7],inst[30:25],inst[11:8],1'b0};
                uj_imme = {11'b11111111111,inst[31],inst[19:12],inst[20],inst[30:21],1'b0};
        end
        default: begin
            s_imme = {20'b00000000000000000000, inst[31:25], inst[11:7]};
            i_imme = {20'b00000000000000000000, inst[31:20]};
                b_imme = {19'b0000000000000000000,inst[31],inst[7],inst[30:25],inst[11:8],1'b0};
                uj_imme = {11'b00000000000,inst[31],inst[19:12],inst[20],inst[30:21],1'b0};
        end
    endcase
end

// always @(*) begin

//             i_imme = {{20{inst[31]}}, inst[31:20]};
//             s_imme = {{20{inst[31]}}, inst[31:25], inst[11:7]};
//            b_imme = {{19{inst[31]}},inst[31],inst[7],inst[30:25],inst[11:8],1'b0};
//           uj_imme = {{11{inst[31]}},inst[31],inst[19:12],inst[20],inst[30:21],1'b0};
//     end

endmodule
