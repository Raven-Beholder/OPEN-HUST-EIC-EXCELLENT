`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/30 14:16:38
// Design Name: 
// Module Name: Counter24
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


module Counter24(
    input CP,nCR,En,
    output reg [3:0] CH ,CL
    );
    initial 
        begin
            CH <= 4'b0000;
            CL <= 4'b0000;
        end
    always @ (posedge CP or negedge nCR) 
            begin
                if(~nCR) 
                    {CH,CL} <= 8'h00;
                else if(~En) 
                    {CH,CL} <= {CH,CL};
                else if((CH > 4'h2)||(CL > 4'h9)||(CH == 4'h2)&&(CL >= 4'h3)) 
                    {CH,CL} <= 8'h00;
                else if((CH == 4'h2)&&(CL < 4'h3))
                    begin 
                        CH <= CH;
                        CL <= CL + 1'b1; 
                    end
                else if(CL == 4'h9)
                    begin 
                        CH <= CH + 1'b1;
                        CL <= 4'b0000; 
                    end
                else 
                    begin 
                        CH <= CH;
                        CL <= CL + 1'b1; 
                    end
            end
endmodule
