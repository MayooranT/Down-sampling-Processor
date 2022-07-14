
module MAR(

input clk,
input load,
input [15:0] C_bus,
output reg [15:0] data_address

);

always@(posedge clk)
	begin 
		if (load) data_address <= C_bus;
	end

endmodule

	