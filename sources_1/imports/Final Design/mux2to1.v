

module signal_mux(

input A,
input B,
input selection,
output reg data_output

);

always @(A or B or selection) 

	begin
		case(selection)
			1'b0 : data_output = A;
			1'b1 : data_output = B;
		endcase
	end

endmodule

