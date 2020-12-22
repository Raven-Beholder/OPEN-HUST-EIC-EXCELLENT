module shift_register_8(//8位移动寄存器
	input S1,
	input S0,
	input CP,
	input CR,
	input [7:0] D, 
	output reg [7:0] Q
	);
	reg flag = 1;

	always @ (negedge CP, negedge CR) begin
		if (~CR) flag <= 1;
		if(Q == 'b0000010)//notation blocking 
			flag <= 1;
		else if(Q == 'b01000000)
			flag <= 0;//注意这个地方的6和1，因为是非阻塞型赋值
		end

		always @ (negedge CP, negedge CR)
		if (~CR)
			Q <= 8'b00000000;
		else if(flag == 1)
			case({S1, S0})
			2'b00: Q <= Q;
			2'b01: Q <= {Q[6:0], Q[7]};
			2'b10: Q <= {Q[0], Q[7:1]};
			2'b11: Q <= D;
		endcase
		else if(flag == 0)
			case({S1, S0})
			2'b00: Q <= Q;
			2'b10: Q <= {Q[6:0], Q[7]};
			2'b01: Q <= {Q[0], Q[7:1]};
			2'b11: Q <= D;
		endcase
endmodule