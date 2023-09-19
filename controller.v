module controller (
    input wire r_type,
    input wire i_type,
    input wire store,
    input wire branch,
    input wire load,
    output reg mem_write,
    output reg reg_write,
  
    output reg [1:0] imme_sel
);

    always @(*) begin
        mem_write = 0;
        reg_write = 0;
      
        imme_sel = 2'b00;

       
        case (r_type)
            1'b1: begin
                reg_write = 1;
                imme_sel = 2'b00;
            end
        endcase

        case (load)
            1'b1: begin
                reg_write = 1;
               imme_sel=2'b01;
            end
        endcase

        case (store)
            1'b1: begin
                mem_write = 1;
                imme_sel = 2'b10;
            end
        endcase

        case (i_type)
            1'b1: begin
                reg_write = 1;
                imme_sel = 2'b01;
            end
        endcase
    end

endmodule
