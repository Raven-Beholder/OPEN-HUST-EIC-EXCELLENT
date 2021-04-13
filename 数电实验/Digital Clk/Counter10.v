`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/30 14:11:01
// Design Name: 
// Module Name: Counter10
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


module Counter10(
    input CP,nCR,En,
    output reg [3:0] Q
    );
    initial 
        begin
            Q <= 4'b0000;
        end
    always @ (posedge CP or negedge nCR) 
        begin
            if(~nCR)    
                Q <= 4'b0000;
            else if(~En)    
                Q <= Q;
            else if(Q == 4'b1001)    
                 Q <= 4'b0000;
            else    
                Q <= Q + 1'b1;
        end
endmodule
