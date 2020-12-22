module waterfall(
    input clk,
	input rst_n ,//system
	input clr_n,
	input stop_n,//counter
	input g1,g2,g3,//decoder
	input S1,S0,CR,
	input [7:0] D,//shift
	input S,//Mux
	output wire[7:0] Q
    );

    wire clk1hz;
    wire [2:0] counter;
    wire [7:0] Y;	
    wire [7:0] X;	


    freq_change freq_change_inst(clk,rst_n,clk1hz);
    counter_auto counter_inst(clr_n,stop_n,clk1hz,counter);
    decoder3_8 decoder3_8_inst(counter,g1,g2,g3,Y);//counter+decoder

    shift_register_8 shift_register_8_inst(S1, S0, clk1hz, CR, D, X);//shift

    Mux2to1 Mux2to1_inst(X,Y,S,Q);

endmodule
