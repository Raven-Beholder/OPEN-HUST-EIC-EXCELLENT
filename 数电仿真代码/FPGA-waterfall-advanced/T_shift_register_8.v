`timescale 10ns/1ns
module shift_register_8_test();
    reg S1,S0,CP,CR,clr_n;
    reg [7:0] D;
    wire [7:0] Q;

    shift_register_8 shift_register_8_inst(S1,S0,CP,CR,clr_n,D,Q);

    initial begin
        CP = 0;
        CR = 0;
        clr_n = 0;
        D=8'b1000_0000;
        #2
        S1 = 0;
        S0 = 1;
        CR = 1;
        clr_n = 1;
        #60
        $stop();
    end
    always begin
        #1 clk= ~clk;
    end
endmodule