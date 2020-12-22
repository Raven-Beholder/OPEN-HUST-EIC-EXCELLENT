`timescale 10ns/1ns
module counter_auto_test();
    reg clr_n, stop_n, clk;
    wire [2:0] counter;

    initial begin
        clk = 0;
        clr_n = 0;
        stop_n = 1;
        #10 clr_n = 1;
        #1600 $stop();
    end
    counter_auto counter_auto_inst(clr_n, stop_n, clk,counter);

    always begin
        #1 clk = ~clk;
    end

endmodule
