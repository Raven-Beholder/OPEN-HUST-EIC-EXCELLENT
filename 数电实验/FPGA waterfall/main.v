`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/10 16:09:07
// Design Name: 
// Module Name: main
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


module main(
    input rst_n,
    input clk100MHz,
    input reset,
    input mode,
    output wire [15:0] Q
    );
    
    wire clk;
    wire [3:0] Y;
    
    counter_4_16 counter_4_16_inst(reset, mode, clk100MHz, Y, clk);
    decoder_4_16 decoder_4_16_inst(clk, Y, rst_n, Q);
    
endmodule
