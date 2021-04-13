`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/30 13:59:34
// Design Name: 
// Module Name: Freq_Div_1000
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


module Fre_Div_1000(
	input CP,
    output reg clk
);
    parameter NT = 50_000;
    reg [31:0] count;
	always @ (posedge CP)  
	   begin            
            if(count == NT) 
                begin
                    clk <= ~clk;
                    count <= 0;
                end            
            else 
                count <= count + 1;
        end
endmodule
