module  freq_change(//分频器
		//system signals
        input clk,//50Mhz 晶振频率
        input rst_n,//系统复位
		
        output reg  clk_1khz//1kHz时钟
        );
    
    reg [25: 0] clk_cnt;//时钟内部计数器，用于分频
    //占空比为50%，50MHz，则周期为20ns，10ns完成一次翻转
    always  @(posedge clk or negedge rst_n) begin
            if(rst_n == 1'b0)//如果rst_n为0，时钟计数清零
                clk_cnt <= 'd0;
            else if(clk_cnt == 'd24_999)//将50MHz分频为1kHz（24'900是因为占空比为50%）
                clk_cnt <= 'd0;
            else
                clk_cnt <= clk_cnt + 1'b1;//时钟内部计数器
    end

    // clk_1khz
    always @(posedge clk or negedge rst_n) begin
            if(rst_n == 1'b0)//检测置零信号
                 clk_1khz <= 1'b0;
            else if(clk_cnt == 'd24)
                 clk_1khz <= ~ clk_1khz;//反转
    end

endmodule

`timescale 10ns/1ns
module freq_change_test();
    reg clk, rst_n;
    wire  clk_1khz;

    freq_change freq_change_inst(clk,rst_n, clk_1khz);
    initial begin
        clk=0;
        rst_n=0;
        #2 rst_n=1;
        #200_0000 stop();
    end

    always begin
        #1 clk= ~clk;
    end
endmodule