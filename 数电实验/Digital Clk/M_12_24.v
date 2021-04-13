`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/05 21:56:42
// Design Name: 
// Module Name: 12_24_change
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


module M_12_24_change(
    input Ctl,
    input [3:0] CH,
    input [3:0] CL,
    output reg [3:0] New_CH,
    output reg [3:0] New_CL
    );
    
    always @ (*) begin
            if(Ctl) begin
                case({CH,CL})
                    'b00000000: {New_CH,New_CL} = 'b00010010;   //0
                    'b00000001: {New_CH,New_CL} = 'b00000001;   //1
                    'b00000010: {New_CH,New_CL} = 'b00000010;   //2
                    'b00000011: {New_CH,New_CL} = 'b00000011;   //3
                    'b00000100: {New_CH,New_CL} = 'b00000100;   //4
                    'b00000101: {New_CH,New_CL} = 'b00000101;   //5
                    'b00000110: {New_CH,New_CL} = 'b00000110;   //6
                    'b00000111: {New_CH,New_CL} = 'b00000111;   //7
                    'b00001000: {New_CH,New_CL} = 'b00001000;   //8
                    'b00001001: {New_CH,New_CL} = 'b00001001;   //9
                    'b00010000: {New_CH,New_CL} = 'b00010000;   //10
                    'b00010001: {New_CH,New_CL} = 'b00010001;   //11
                    'b00010010: {New_CH,New_CL} = 'b00010010;   //12
                    'b00010011: {New_CH,New_CL} = 'b00000001;   //13
                    'b00010100: {New_CH,New_CL} = 'b00000010;   //14
                    'b00010101: {New_CH,New_CL} = 'b00000011;   //15
                    'b00010110: {New_CH,New_CL} = 'b00000100;   //16
                    'b00010111: {New_CH,New_CL} = 'b00000101;   //17
                    'b00011000: {New_CH,New_CL} = 'b00000110;   //18
                    'b00011001: {New_CH,New_CL} = 'b00000111;   //19
                    'b00100000: {New_CH,New_CL} = 'b00001000;   //20
                    'b00100001: {New_CH,New_CL} = 'b00001001;   //21
                    'b00100010: {New_CH,New_CL} = 'b00010000;   //22
                    'b00100011: {New_CH,New_CL} = 'b00010001;   //23
                    'b00100100: {New_CH,New_CL} = 'b00000000;   //24
                    default: {New_CH,New_CL} = 'b00000000;
                endcase
            end
            else if (!Ctl) begin
                {New_CH,New_CL} <= {CH,CL};
            end
        end
endmodule
