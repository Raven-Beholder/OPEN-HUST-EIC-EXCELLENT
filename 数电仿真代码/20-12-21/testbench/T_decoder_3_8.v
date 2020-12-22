`timescale 10ns/1ns
module decoder3_8_test();
reg [2:0] A;
reg g1,g2,g3;
wire [7:0] y;
decoder3_8 decoder3to8(A,g1,g2,g3,y);
initial 
    begin
    A=3'b000;
    g1=1;
    g2=0;
    g3=0;
    #10 A=3'b000;
    #10 A=3'b001;
    #10 A=3'b010;
    #10 A=3'b011;
    #10 A=3'b100;
    #10 A=3'b101;
    #10 A=3'b110;
    #10 A=3'b111;
    #10 g1=0;
    $stop();
    end
endmodule
