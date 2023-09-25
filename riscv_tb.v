`timescale 1ns/1ps
module riscv_tb();
    reg clk;
    reg rst;
    reg enable;
   

    riscv u_riscv(
        .clk(clk),
        .rst(rst),
        .enable(enable)
    );

    initial begin
        clk = 0;
        rst = 0;
        #10;
        rst=1;
        enable = 0;
    

       
       
        #200;

        $finish;       
    end
     initial begin
       $dumpfile("riscv.vcd");
       $dumpvars(0,riscv_tb);
    end

    always begin
        #5 clk= ~clk;
    end
endmodule