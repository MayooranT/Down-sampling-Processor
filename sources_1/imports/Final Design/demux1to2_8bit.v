
module demux12_8bit(

input [7:0] data_input,
input selection,
output reg [7:0] A,
output reg [7:0] B

);

always @(data_input or selection) 
    
	begin
		case(selection)
			1'b0 : A = data_input;
			1'b1 : B = data_input;
		endcase
	end

endmodule
