
module mux21_16bit(

input [15:0] A,
input [15:0] B,
input selection,
output reg [15:0] data_output

);

always @(A or B or selection) 
	begin
		case(selection)
			1'b0 : data_output = A;
			1'b1 : data_output = B;
		endcase
	end

endmodule

