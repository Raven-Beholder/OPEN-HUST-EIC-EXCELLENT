`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/06 14:55:03
// Design Name: 
// Module Name: timer
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

module timer(
    input [7:0]hour,
	input [7:0]minute,
	input [7:0]second,
    output reg ledr,
    output reg ledg,
    input clk
    );
	
	reg  [5:0]i=0;
	reg  [5:0]n_hour;
	//reg  blink=0;
	
	always@(posedge clk)begin
	    if(minute==8'h59&&second==8'h51)
        begin
            ledr <= 'b1;
            ledg <= 'b0;
        end
        if(minute==8'h59&&second==8'h52)
        begin
            ledr <= 'b0;
            ledg <= 'b0;
        end
        if(minute==8'h59&&second==8'h53)
        begin
            ledr <= 'b1;
            ledg <= 'b0;
        end
        if(minute==8'h59&&second==8'h54)
        begin
            ledr <= 'b0;
            ledg <= 'b0;
        end
        if(minute==8'h59&&second==8'h55)
        begin
            ledr <= 'b1;
            ledg <= 'b0;
        end
        if(minute==8'h59&&second==8'h56)
        begin
            ledr <= 'b0;
            ledg <= 'b0;
        end
        if(minute==8'h59&&second==8'h57)
            begin
                ledr <= 'b1;
                ledg <= 'b0;
            end
        if(minute==8'h59&&second==8'h58)
            begin
                ledr <= 'b0;
                ledg <= 'b0;
            end
        if(minute==8'h59&&second==8'h59)
            begin
                ledr <= 'b0;
                ledg <= 'b1;
            end
        if(minute==8'h00&&second==8'h00)
            begin
                ledr <= 'b0;
                ledg <= 'b0;
            end

	    
		if (minute==0&&second==0)begin
			case(hour)
				8'b00000000:  n_hour=12;
				8'b00000001:  n_hour=1;
				8'b00000010:  n_hour=2;
				8'b00000011:  n_hour=3;
				8'b00000100:  n_hour=4;
				8'b00000101:  n_hour=5;
				8'b00000110:  n_hour=6;
				8'b00000111:  n_hour=7;
				8'b00001000:  n_hour=8;
				8'b00001001:  n_hour=9;
				8'b00010000:  n_hour=10;
				8'b00010001:  n_hour=11;
				8'b00010010:  n_hour=12;
				8'b00010011:  n_hour=1;
				8'b00010100:  n_hour=2;
				8'b00010101:  n_hour=3;
				8'b00010110:  n_hour=4;
				8'b00010111:  n_hour=5;
				8'b00011000:  n_hour=6;
				8'b00011001:  n_hour=7;
				8'b00100000:  n_hour=8;
				8'b00100001:  n_hour=9;
				8'b00100010:  n_hour=10;
				8'b00100011:  n_hour=11;
				default:n_hour=0;
			endcase
		end
		if (i==0)begin
			ledg<=0;
			i=i+1'b1;
		end
		else if(i<=n_hour)begin
				ledg<=~ledg;
				if (ledg)  i=i+1'b1;
		end
		else begin
			ledg<=0;
			i<=0; 
			n_hour<=0;
		end
	end	
endmodule