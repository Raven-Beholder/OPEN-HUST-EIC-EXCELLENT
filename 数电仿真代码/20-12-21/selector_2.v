module Mux2to1(
    input [7:0] D0,
    input [7:0] D1,
    input S, 
    output reg [7:0] Y
    );
    always @ (D0 or D1 or S) begin
    if (S == 0)
        Y = D0;
    else if (S == 1)
        Y = D1;
    end
endmodule