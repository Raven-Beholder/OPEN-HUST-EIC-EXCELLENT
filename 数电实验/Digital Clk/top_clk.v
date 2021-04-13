`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/30 14:32:39
// Design Name: 
// Module Name: top_clk
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


module top_clk(
    input CP,nCR,En,AM,AH,Ctl,
    output [7:0]sel,seg,
    output ledr,ledg,ledb
    );
    wire [7:0]Hour,Minute,Second;
    wire [7:0]New_Hour,New_Minute,New_Second;
    wire clk_1Hz,clk_1000Hz;
    wire Sec_En,MinH_En,MinL_En,Hour_En;
    wire [2:0]num;
    wire [3:0]display_num;
    
    //分频器
    Fre_Div_1 F1 (CP,clk_1Hz);
    Fre_Div_1000 F2 (CP,clk_1000Hz);
    
    //秒计数
    Counter10 U1 (clk_1Hz,nCR,En,Second[3:0]);
    assign Sec_En = (((Second[3:0]==4'h9)?1:0)&&En);
    Counter6  U2 (clk_1Hz,nCR,Sec_En,Second[7:4]);
    
     //分计数
    assign MinL_En = (AM ? 1:(Second==8'h59));
    Counter10 U3 (clk_1Hz,nCR,MinL_En,Minute[3:0]);
    assign MinH_En = (AM && (Minute[3:0]==4'h9)||(Minute[3:0]==4'h9)&&(Second==8'h59));
    Counter6  U4 (clk_1Hz,nCR,MinH_En,Minute[7:4]);
    
    //时计数
    assign Hour_En = AH ? 1:(Minute==8'h59&&(Second==8'h59));
    Counter24 U5 (clk_1Hz,nCR,Hour_En,Hour[7:4],Hour[3:0]);
    M_12_24_change U6(Ctl,Hour[7:4],Hour[3:0],New_Hour[7:4],New_Hour[3:0]);
    
    //计数显示
    FreshDisplay P1 (clk_1000Hz,num);
    selector_8 P2 (num,New_Hour,Minute,Second,display_num,sel);
    DigitalShow P3 (display_num,seg);
    
    timer P4 (New_Hour,Minute,Second,ledr,ledg,clk_1Hz);
    endmodule
