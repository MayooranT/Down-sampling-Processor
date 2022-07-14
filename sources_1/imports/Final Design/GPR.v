

module GPR(

input clk,
input load,
input [15:0] C_bus, //connects to the MIR load signal
output reg [15:0] data_out //connects to the B_bus (MUX)

);

always@(posedge clk)
	begin 
		if (load) data_out <= C_bus;
	end

endmodule 


	