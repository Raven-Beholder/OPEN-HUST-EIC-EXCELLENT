`timescale 10ns/1ns 
module TwoDigitComparator_test();
    reg A1,A2,B1,B2;
    wire F1,F2,F3;
    TwoDigitComparator TwoDigitComparator_inst(A1,A2,B1,B2,F1,F2,F3);
    initial begin
        A1=0;
        B1=0;
        A2=0;
        B2=0;
        #10 A1=1;
        #10 B1=1;
        #10 A2=1;
        #10 A2=0; B2=1;
        $stop();
    end 
endmodule
