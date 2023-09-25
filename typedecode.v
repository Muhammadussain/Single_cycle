module typedecode(
    input wire [6:0] opcode,
    output reg r_type,
    output reg i_type,
    output reg store,
    output reg branch,
    output reg jal,
    output reg jalr, 
    output reg load
);
always @(*) begin
        r_type = 0;
        i_type = 0;
        store = 0;
        load = 0;
        branch = 0;
        jal = 0;
        jalr = 0;

        if (opcode == 7'b0110011)
            r_type = 1;
        else if (opcode == 7'b0100011)
            store = 1;
        else if (opcode == 7'b0010011)
            i_type = 1;
        else if (opcode == 7'b0000011)
            load = 1;
        else if (opcode == 7'b1100011)
            branch = 1;
        else if (opcode == 7'b1101111)
            jal = 1;
        else if (opcode == 7'b1100111)
            jalr = 1;
    end
    // r_type = 0;
    // i_type = 0;
    // store = 0;
    // load =0;
    // branch=0;
    // jal = 0;
    // jalr = 0;
    // case (opcode)
    //     7'b0110011: r_type = 1;
    //     7'b0100011: store = 1;
    //     7'b0010011: i_type = 1;
    //     7'b0000011: load = 1;
    //     7'b1100011: branch = 1;
    //     7'b1101111: jal = 1;
    //     7'b1100111: jalr = 1;
    // endcase


endmodule
