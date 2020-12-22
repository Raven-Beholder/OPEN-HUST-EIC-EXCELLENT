module  counter_auto(
    input clr_n ,
    input stop_n ,
	input clk_1hz,
    output reg [2:0] counter 
);
reg flag ; 

always @(posedge clk_1hz or negedge clr_n) begin
    if(clr_n == 1'b0)
        flag <= 1'b1;
    else if(counter == 'd6)//notation blocking 
        flag <= 1'b0;
    else if(counter == 'd1)
        flag <= 1'b1;//注意这个地方的6和1，因为是非阻塞型赋值
end

//counter
always  @(posedge clk_1hz or negedge clr_n or negedge stop_n) begin
        if(clr_n == 1'b0)
            counter <= 3'b000;
        else if(stop_n == 1'b0) 
           counter <= counter;
        else if(flag == 1'b1) 
           counter <= counter + 1'b1;
        else if(flag == 1'b0)
           counter <= counter - 1'b1; 
end
endmodule