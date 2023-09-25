module wrapper (
    
    input  wire load ,
    input wire store,
    input wire [31:0] data_in_l,
    input wire [31:0] data_in_s,
    input wire [2:0] func3,
    input wire [1:0] byte_address,
   
 
    output reg [31:0]data_out_l,
    output reg [31:0]data_out_s,
    output  reg [3:0] wrapmasking
);
    
    always @(*) begin
    if (store) begin
        if(func3==3'b000)begin
   case (byte_address)
    2'b00: begin
            wrapmasking = 4'b0001;
                    data_out_s = data_in_s;
                end
                2'b01: begin
                    wrapmasking = 4'b0010;
                    data_out_s = {data_in_s[31:16],data_in_s[7:0],data_in_s[7:0]};
                end
                2'b10: begin
                    wrapmasking = 4'b0100;
                    data_out_s = {data_in_s[31:24],data_in_s[7:0],data_in_s[15:0]};
                end
                2'b11: begin
                    wrapmasking = 4'b1000;
                    data_out_s = {data_in_s[7:0],data_in_s[23:0]};
                end
               endcase 
            end
          
            if(func3==3'b001)begin                                        //halfword
                case (byte_address)
                 2'b00: begin
                    wrapmasking = 4'b0011;
                    data_out_s = data_in_s;
                 end
                 2'b01: begin
                    wrapmasking = 4'b0110;
                    data_out_s = {data_in_s[31:24],data_in_s[15:0],data_in_s[7:0]};
                 end
                 2'b10: begin
                    wrapmasking = 4'b1100;
                    data_out_s = {data_in_s[15:0],data_in_s[15:0]};
                 end
                endcase   
            end

            if(func3==3'b010) begin                                        //word
                wrapmasking = 4'b1111;
                data_out_s = data_in_s;
            end
        end  

 if(load)begin
        
        if (func3 == 3'b000)begin                                           //byte

            case (byte_address)
            2'b00 :  data_out_l = {{24{data_in_l[7]}},data_in_l[7:0]};
            2'b01 :  data_out_l = {{24{data_in_l[15]}},data_in_l[15:8]};
            2'b10 :  data_out_l = {{24{data_in_l[23]}},data_in_l[23:16]};
            2'b11 :  data_out_l = {{24{data_in_l[31]}},data_in_l[31:24]};
            endcase

        end
        else if (func3 == 3'b001)begin                                     //halfword

            case (byte_address)
            2'b00 :  data_out_l = {{16{data_in_l[15]}},data_in_l[15:0]};
            2'b01 :  data_out_l = {{16{data_in_l[23]}},data_in_l[23:8]};
            2'b10 :  data_out_l = {{16{data_in_l[31]}},data_in_l[31:16]};
            // 2'b11 :  data_out_l = {{16{data_in_l[31]}},data_in_l[31:16]};                                                                                                                                                                                                                                                                                                                                                             
            endcase

        end

        else if (func3==3'b010)begin                                       //word

        data_out_l = data_in_l;

        end
        else if(func3==3'b100)begin                                       //byte unsigned
            case (byte_address)
            2'b00 :  data_out_l = {24'b0,data_in_l[7:0]};
            2'b01 :  data_out_l = {24'b0,data_in_l[15:8]};
            2'b10 :  data_out_l = {24'b0,data_in_l[23:16]};
            2'b11 :  data_out_l = {24'b0,data_in_l[31:24]};
            endcase
        end
        else if(func3==3'b101)begin                                       //half word unsigned
            case (byte_address)
            2'b00 :  data_out_l = {16'b0,data_in_l[15:0]};
            2'b01 :  data_out_l = {16'b0,data_in_l[23:8]};
            2'b10 :  data_out_l = {16'b0,data_in_l[31:16]};
            // 2'b11 :  data_out_l = {16'b0,data_in_l[31:16]};                                                                                                                                                                                                                                                                                                                                                             
            endcase

        end
    end












 end
    
    
endmodule