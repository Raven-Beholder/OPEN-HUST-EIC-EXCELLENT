`timescale 10ns/1ns
module shift_register_test();
    reg S1, S0,  CP, CR;
    reg [7:0] D;
    wire[7:0] Q;
    shift_register_8 shift_register_8_inst(S1, S0,  CP, CR,D,Q);
    initial begin
        CP=0;
        CR=1;
        S1=1;
        S0=1;
        D=8'b1000_0000;
        #1 S1=1;
        S0=0;
        #16
        S1=0;
        S0=1;
        #16;
        $stop;
    end
    always begin
    #1 CP=~CP;
    end
endmodule