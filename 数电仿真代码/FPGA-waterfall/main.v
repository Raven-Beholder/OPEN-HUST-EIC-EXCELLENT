module  waterfall_led(
        //system signals
        input clk,
        input rst_n,
        //使能及输入
        input g1,
        input g2,
        input g3,
	input clr_n,
	input stop_n,
        output wire [7:0] y 
    );
        wire [2:0] counter;

        freq_change freq_change_inst(
                .clk(clk),//50Mhz时钟频率
                .rst_n(rst_n),//置零信号
                .clk_1hz(clk_1hz)//1Hz时钟频率
        );

        counter counter_inst(
        .rst_n(rst_n),
        .clk_1hz(clk_1hz),
        .clr_n(clr_n),
        .stop_n(stop_n),
        .M(M),
        //led output
        .counter(counter)
    );

    decoder3_8  decoder3_8_inst(
            .a(counter),//输入端口a,[2:0]表示位宽
            .g1(g1),
            .g2(g2),
            .g3(g3),
            .y(y)//输出端口y，[7:0]表示位宽
    );

endmodule
