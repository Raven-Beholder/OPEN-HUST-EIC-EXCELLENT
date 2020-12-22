`timescale 10ns/1ns
module comparator_8_test();
    //input
    reg [7:0] A;
    reg [7:0] B;
    reg rst;
    reg clk;
    //output
    wire equal;
    wire larger;
    wire smaller;
    comparator_8 comparator_8_inst(A,B,rst,clk,equal,larger,smaller);
    initial begin
	clk = 0;
	A = 8'b0001_0000;
        B = 8'b0000_1000;
        rst = 0;
	#10
        #2 rst = 1;

        #4
        A = 8'b0001_0000;
        B = 8'b0010_0000;
        rst = 0;
        
        #2 rst = 1;

        #4
        A = 8'b0001_0000;
        B = 8'b0001_0000;
        rst = 0;
        #2 rst = 1;
        #2 $stop();
    end

    always begin
        #1 clk = ~clk;
    end
endmodule
