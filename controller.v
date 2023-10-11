module controller (
    input wire r_type,
    input wire i_type,
    input wire store,
    input wire branch,
    input wire load,
    input wire jal,
    input wire jalr,
    input wire auipc,
    input wire lui,
    output reg mem_write,
    output reg reg_write,
    output reg we_re,
    output reg [2:0] imme_sel,
    output reg [1:0] rd_sel,
    output reg [1:0] rs1_sel
);

    always @(*) begin
        mem_write = 1'b0;
        reg_write = 1'b0;
         rd_sel=2'b00;
         rs1_sel=2'b00;
        imme_sel = 3'b000;
        we_re=1'b0;
       
        case (r_type)
            1'b1: begin
                reg_write = 1;
                imme_sel = 3'b000;
            end
        endcase

        case (load)
            1'b1: begin
                reg_write = 1;
               imme_sel=3'b001;
               we_re=1'b1;
            end
        endcase

        case (branch)
            1'b1: begin
                
               imme_sel=3'b010;
               rs1_sel=2'b01;
            end
        endcase
        case (store)
            1'b1: begin
                reg_write = 1;
                mem_write = 1;
                imme_sel = 3'b011;
                we_re=1'b0;
            end
        endcase

        case (i_type)
            1'b1: begin
                reg_write = 1;
                imme_sel = 3'b001;

            end
        endcase
   

        case (jal)
            1'b1: begin
              imme_sel=3'b101;
               rd_sel=2'b01;
                reg_write = 1;
               rs1_sel=2'b10;
            end
        endcase

        case (jalr)
            1'b1: begin
              imme_sel=3'b001;
               rd_sel=2'b01;
                reg_write = 1;
               rs1_sel=2'b00;
            end
        endcase
         case (auipc)
            1'b1: begin
              imme_sel=3'b100;
               rd_sel=2'b00;
                reg_write = 1;
               rs1_sel=2'b01;
            end
            endcase
        case (lui)
            1'b1: begin
              imme_sel=3'b100;
               rd_sel=2'b10;
                reg_write = 1;
               rs1_sel=2'b01;
            end
        endcase
        
    end

endmodule
