module  counter(//可逆计数器
		//system signals
        input clk_1hz,//分频器输出的时钟频率
		
        //function key
        input clr_n,//clr_n=0时，清零（异步）
        input stop_n,//stop_n=0时，暂停计数（异步）
        input M,//M=1时，递增计数;M=0时，递减计数

		//led output
        output reg [2:0] counter,
        );

    //counter，它的输出将被输入到译码器中
    always  @(posedge clk_1hz or negedge rst_n or negedge clr_n or negedge stop_n) begin
            if(rst_n == 1'b0)//系统复位
                counter <= 3'b000;
            else if(clr_n == 1'b0)
                counter <= 3'b000;//clr_n=0时，清零（异步）
            else if(stop_n == 1'b0) //stop_n=0时，暂停计数（异步）
            counter <= counter;
            else if(M == 1'b1)  //M=1时，递增计数
            counter <= counter + 1'b1;
            else                //M=0时，递减计数
            counter <= counter - 1'b1; 
    end
endmodule