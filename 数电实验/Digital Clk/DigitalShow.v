`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/30 14:27:11
// Design Name: 
// Module Name: DigitalShow
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


module DigitalShow(
    input [3:0] data,
    output [7:0] seg
);
    reg dp,cg,cf,ce,cd,cc,cb,ca;
    assign seg = {dp, cg, cf, ce, cd, cc, cb, ca}; //低有效
    always @ (data) 
        begin
            case(data)
                 4'h0: {ca, cb, cc, cd, ce, cf, cg, dp} = 8'b0000_0011;
                 4'h1: {ca, cb, cc, cd, ce, cf, cg, dp} = 8'b1001_1111;
                 4'h2: {ca, cb, cc, cd, ce, cf, cg, dp} = 8'b0010_0101;
                 4'h3: {ca, cb, cc, cd, ce, cf, cg, dp} = 8'b0000_1101;
                 4'h4: {ca, cb, cc, cd, ce, cf, cg, dp} = 8'b1001_1001;
                 4'h5: {ca, cb, cc, cd, ce, cf, cg, dp} = 8'b0100_1001;
                 4'h6: {ca, cb, cc, cd, ce, cf, cg, dp} = 8'b0100_0001;
                 4'h7: {ca, cb, cc, cd, ce, cf, cg, dp} = 8'b0001_1111;
                 4'h8: {ca, cb, cc, cd, ce, cf, cg, dp} = 8'b0000_0001;
                 4'h9: {ca, cb, cc, cd, ce, cf, cg, dp} = 8'b0001_0001;
                 default: {ca, cb, cc, cd, ce, cf, cg, dp} = 8'b1111_1111; //灭灯
            endcase
        end
endmodule
