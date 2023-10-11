`timescale 1ns/1ps
module datapath_tb();
    reg clk;
    reg rst;
    reg request;
   

    datapath u_datapath(
        .clk(clk),
        .rst(rst),
        .request(request)
    );

    initial begin
        clk = 0;
        rst = 0;
        #10;
        rst=1;
        request = 1;
    

       
       
        #200;

        $finish;       
    end
     initial begin
       $dumpfile("datapath.vcd");
       $dumpvars(0,datapath_tb);
    end

    always begin
        #5 clk= ~clk;
    end
endmodule