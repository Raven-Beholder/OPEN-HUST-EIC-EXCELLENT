`timescale 10ns/1ns
module counter_test();
	reg clk, rst_n, stop_n, clr_n, M;
	wire [2:0] counter;
	wire [25:0] clk_cnt;
	wire clk_1hz;

	initial begin
		clk = 0;
	    	rst_n = 1;
		clr_n = 0;
	    	stop_n = 1;
		M = 1;
		#10 clr_n = 1;

		#200_000
		$stop;
	end
	counter u2( clk, rst_n, clr_n, stop_n, M,counter,clk_cnt,clk_1hz);

	always begin
		#1 clk = ~clk;
	end

endmodule