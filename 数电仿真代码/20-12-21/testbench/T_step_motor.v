`timescale 10ns/1ns
module Step_Motor_test();
    reg M,CP,nCR,clr;
    wire A,B,C;
    Step_Motor Step_Motor_inst(M,CP,nCR,clr,A,B,C);
    initial begin
	clr=0;
        CP=0;
        nCR=0;
        M=0;
        #50 nCR=1; clr=1;
        #80 M=1;
        #500 nCR=0;
        #200;
        $stop();
        end 
    always begin
        #10 CP=~CP;
        end
endmodule