module comparator_8(//8位比较器
    input [7:0] A,
    input [7:0] B,
    input rst,
    input clk,

    output reg equal,
    output reg larger,
    output reg smaller
    );

    always @ (posedge clk or negedge rst) begin
        if (rst == 0) begin
            equal = 0; 
            larger = 0;
            smaller = 0;
        end

        else if (A > B) begin
            equal = 0; 
            larger = 1;
            smaller = 0;
        end

        else if (A == B) begin
            equal = 1; 
            larger = 0;
            smaller = 0;
        end

        else if (A < B) begin
            equal = 0; 
            larger = 0;
            smaller = 1;
        end

    end

endmodule