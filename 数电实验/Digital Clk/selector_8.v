`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/30 14:23:19
// Design Name: 
// Module Name: selector_8
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


module selector_8(
    input [2:0] select,
    input [7:0] hour,minute,second,
    output reg [3:0]display_num,
    output reg [7:0]sel
    );  
    always @ (select) 
    begin
        case(select)
            3'd0:begin sel = #10000000 8'b11111110;display_num = 4'b0000; end
            3'd1:begin sel = #10000000 8'b11111101;display_num = 4'b0000; end
            3'd2:begin sel = #10000000 8'b11111011;display_num = second[3:0]; end
            3'd3:begin sel = #10000000 8'b11110111;display_num = second[7:4]; end
            3'd4:begin sel = #10000000 8'b11101111;display_num = minute[3:0]; end
            3'd5:begin sel = #10000000 8'b11011111;display_num = minute[7:4]; end
            3'd6:begin sel = #10000000 8'b10111111;display_num = hour[3:0]; end
            3'd7:begin sel = #10000000 8'b01111111;display_num = hour[7:4]; end
            default:begin sel = 8'b11111111;display_num = 4'b0000; end
        endcase
    end
endmodule
