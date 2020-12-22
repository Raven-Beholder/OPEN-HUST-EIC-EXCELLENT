module Step_Motor(
    input M,CP,nCR, // Input Ports 
    input clr,
    output reg A,B,C // Output Ports
    );
    reg [2:0] current_state, next_state;
    // Parameter Declarations
    parameter [2:0] S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011,
              S4=3'b100, S5=3'b101, S6=3'b110, S7=3'b111;

    always @ (posedge CP or negedge clr) begin
	if (~clr) begin 
	    current_state <= S0;
	    {A,B,C} <= current_state;
	end
    end
    always @ (posedge CP or negedge nCR) begin
        if (~nCR) begin
            next_state <= current_state;
        end
        else if (nCR) begin
            case(current_state)
                S0: next_state <= S1;
                S1: if(M) next_state <= S3; else next_state <= S5;
                S2: if(M) next_state <= S6; else next_state <= S3;
                S3: if(M) next_state <= S2; else next_state <= S1;
                S4: if(M) next_state <= S5; else next_state <= S6;
                S5: if(M) next_state <= S1; else next_state <= S4;
                S6: if(M) next_state <= S4; else next_state <= S2;
                S7: next_state <= S6;
            endcase    
	    current_state <=next_state;
	    {A,B,C} <= current_state;
        end
    end
endmodule