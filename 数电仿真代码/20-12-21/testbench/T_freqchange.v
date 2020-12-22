`timescale 10ns/1ns
module freq_change_test();
    reg clk, rst_n;
    wire  clk_1khz;

    freq_change freq_change_inst(clk,rst_n, clk_1khz);
    initial begin
        clk=0;
        rst_n=0;
        #2 rst_n=1;
        #200_0000 $stop();
    end

    always begin
        #1 clk= ~clk;
    end
endmodule