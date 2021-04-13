`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/30 14:30:38
// Design Name: 
// Module Name: FreshDisplay
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


module FreshDisplay(
    input clk1000Hz,
    output reg [2:0] Q
    );
    initial 
        begin
            Q <= 3'b000; 
    end
    always @ (posedge clk1000Hz )  
        begin
          if (Q == 3'b111) 
            Q <= 3'b000;
          else  
            Q <= Q + 1;
    end 
endmodule
