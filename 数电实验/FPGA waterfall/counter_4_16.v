`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/10 14:08:58
// Design Name: 
// Module Name: counter_4_16
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


module counter_4_16(
    input reset,
    input mode,
    input clk100MHz,
    output reg [3:0] Y,
    output reg clk
    );
    
   parameter COUNTER_WIDTH = 4;
   reg [26: 0] clk_cnt;
// reg [COUNTER_WIDTH-1:0] Q = {COUNTER_WIDTH{1'b0}};

    always  @(posedge clk100MHz or negedge reset) begin
            if(reset == 1'b0)
                clk_cnt <= 'd0;
            else if(clk_cnt == 'd49_999_999)
                clk_cnt <= 'd0;
            else
                clk_cnt <= clk_cnt + 1'b1;
    end
    
    //clk_1hz
    always @(posedge clk100MHz or negedge reset) begin
            if(reset == 1'b0)
                clk <= 1'b0;
            else if(clk_cnt == 'd49_999_999)
                clk <= ~clk;
    end

    always @(posedge clk or negedge reset)
        if (!reset)
            Y <= {COUNTER_WIDTH{1'b0}};
        else
            if (mode)
                Y <= Y + 1'b1;
            else
                Y <= Y - 1'b1;
endmodule
