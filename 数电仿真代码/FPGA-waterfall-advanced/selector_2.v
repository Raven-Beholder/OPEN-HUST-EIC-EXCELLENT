module Mux2to1(
    input [7:0] D0,
    input [7:0] D1,
    input S, 
    output reg [7:0] Y
    );
    always @ (D0 or D1 or S) begin
    if (S == 0)
        Y = D0;
    else if (S == 1)
        Y = D1;
    end
endmodule

module Concatenate
( input [7:0] A, B, output [7:0] X, Y, Z );
// A, B are input vectors, X, Y, Z are output vectors
// X = A is right-shifted 3 bits using { } operator
assign X = {3'b000, A[7:3]};
// Y = A is right-rotated 3 bits using { } operator
assign Y = {A[2:0], A[7:3]};
// Z = selecting and concatenating bits of A and B
assign Z = {A[5:4], B[6:3], A[1:0]};
endmodule

`timescale 10ns/1ns 
module Concatenate_test();
reg [7:0]A;
reg [7:0]B;
wire [7:0] X;
wire [7:0]Y,Z;
Concatenate test(A,B,X,Y,Z);
initial begin
	A=8'b1001_0001;
	B=8'b0011_1100;	
	#10
	A=8'b0001_1001;
	B=8'b0101_1100;	
	#10
	$stop;
end
endmodule


`timescale 10ns/1ns 
module Concatenate_test();
reg [7:0]A;
reg [7:0]B;
wire [7:0] X;
wire [7:0]Y,Z;
Concatenate test(A,B,X,Y,Z);
initial begin
	A=8'b1001_0001;
	B=8'b0011_1100;	
	#10
	A=8'b0001_1001;
	B=8'b0101_1100;	
	#10
	$stop;
end
endmodule
