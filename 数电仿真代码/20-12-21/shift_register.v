module shift_register_8(input S1, S0, CP, CR, input [7:0] D, output reg [7:0] Q);
  always @ (negedge CP, negedge CR)
    if (~CR)
      Q <= 8'b0000_0000;
    else
      case({S1, S0})
        2'b00: Q <= Q;
        2'b01: Q <= {Q[0], Q[7:1]};
        2'b10: Q <= {Q[6:0], Q[7]};
        2'b11: Q <= D;
      endcase
endmodule