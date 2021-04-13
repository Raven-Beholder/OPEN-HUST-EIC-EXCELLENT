`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/30 14:01:46
// Design Name: 
// Module Name: Freq_Div_1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Fre_Div_1(
	input CP,
    output reg clk
);
    parameter NO = 50_000_000;
    reg [31:0] count;
	always @(posedge CP) 
	   begin            
            if(count == NO) 
                begin
                    clk <= ~clk;
                    count <= 0;
                end            
            else 
                count <= count + 1;
        end
endmodule
