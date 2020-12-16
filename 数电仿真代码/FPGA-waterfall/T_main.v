`timescale 10ns/1ns

module waterfall_led_test();
    reg clk,rst_n,clr_n,stop_n,g1,g2,g3;
    wire [7:0] y;

    initial begin
        clk = 0;
        rst_n = 0;
	clr_n = 1;
	stop_n = 1;
        g1 = 1;
        g2 = 0;
        g3 = 0;

	#10 rst_n = 1;

	#2_000_000_000;
        $stop(); 
    end

    waterfall_led u1(clk,rst_n,g1,g2,g3,clr_n,stop_n,y);

    always begin
        #1 clk= ~clk;
    end

endmodule