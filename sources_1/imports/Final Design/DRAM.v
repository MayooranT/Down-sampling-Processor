
module DRAM(

input clk,
input write,
input read,
input [7:0] din,
input [15:0] addr,
output reg [7:0] dout,dataout_file

);

reg [7:0] RAM [65535:0];
integer i;

always @(posedge clk)
	begin
		if (write) begin RAM[addr] <= din; 
		 end
		if (read) dout <= RAM[addr]; 
	end

	
endmodule

	