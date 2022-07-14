`timescale 1ns / 1ps


module MAR_tb();
    
reg clk = 1'b0;
reg load = 1'b1;
reg [15:0] C_bus = 16'b0;
wire [15:0] data_address;
wire clka;

always begin 
        
        #160 clk = !clk;
end



  
MAR MAR(
     .clk(clk),
     .load(load),
     .C_bus(C_bus),
     .data_address(data_address)
);

always@(posedge clk)
	begin
	C_bus <= C_bus + 1;
	if (C_bus == 16'd4)begin
	load <= 1'b0;
	end
    
	end 

endmodule
