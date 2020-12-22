`timescale 10ns/1ns
module Mux2to1_test();
    reg [7:0]D0, D1;
    reg S;
    wire [7:0]Y;

    Mux2to1 Mux2to1_inst(D0, D1, S, Y);

    initial begin
        D0 = 'b10101010;
        D1 = 'b01010101;
        #4 S = 1;
        #4 S = 0;
        #4 $stop();
    end
endmodule

