`timescale 10ns/1ns
module waterfall_test();
	reg clk;
	reg rst_n;//system
	reg clr_n;
	reg stop_n;//counter
	reg g1,g2,g3;//decoder
	reg S1,S0,CR;
	reg [7:0] D;//shift
	reg S;//Mux
	wire [7:0]Q;

    waterfall waterfall_test(clk,rst_n,clr_n,stop_n,g1,g2,g3,S1,S0,CR,D,S,Q);
    initial begin
		clk=0;
		rst_n=0;//system
		clr_n=0;
		stop_n=0;//counter
		g1=1;
		g2=0;
		g3=0;//decoder
		S1=1;
		S0=1;
		CR=1;//shift
		D=8'b1000_0000;
		S=1;//initial
		#2
		clr_n=1;
		#2
		rst_n=1;
		//clr_n=1;
		stop_n=1;
		S1=0;
		S0=1;
		//# 2000000stop();
	end
    always begin
        #1 clk= ~clk;
    end
endmodule