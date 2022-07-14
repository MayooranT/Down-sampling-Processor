

module MBRU(

input clk,
input fetch, 
input [7:0] ins_in, 
output reg [7:0] ins_out 

);

always@(posedge clk)
	begin
	if (fetch) ins_out <= ins_in;
	end

endmodule

