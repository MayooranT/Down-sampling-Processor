module ALU(

input [15:0] A_bus,
input [15:0] B_bus,
input [3:0] operation,
input enable,
input clk,
output reg [15:0] C_bus,
output reg Z_flag

);

//Define the ALU operations

parameter ADD = 4'b0001;
parameter SUB = 4'b0010;
parameter PASSATOC = 4'b0011;
parameter PASSBTOC = 4'b0100;
parameter INCAC = 4'b0101;
parameter DECAC = 4'b0110;
parameter LSHIFT1 = 4'b0111;
parameter LSHIFT2 = 4'b1000;
parameter LSHIFT8 = 4'b1001;
parameter RSHIFT4 = 4'b1010;
parameter RESET = 4'b1011;

initial begin
	C_bus = 16'b0;
	Z_flag = 1'b0;
end

reg [1:0] state = 2'b0;
reg start = 1'b0;

always@(posedge enable)
	start <= 1'b1;

always@(negedge clk)
	begin
		if (start) begin
             state = state+ 2'b01;
		end
	end

always@(posedge clk)
	begin
	if (start) begin
	if (state == 2'b11) begin
	case(operation)
		ADD : C_bus <= A_bus + B_bus;
		
		SUB : begin
		C_bus = A_bus - B_bus;
		Z_flag = (C_bus == 16'b0) ? 1'b1 : 1'b0;
		end
		
		PASSATOC : C_bus <= A_bus;
		
		PASSBTOC : C_bus <= B_bus;
		
		INCAC : C_bus <= A_bus + 1;
		
		DECAC : C_bus <= A_bus - 1;
		
		LSHIFT1 : C_bus <= A_bus << 1;
		
		LSHIFT2 : C_bus <= A_bus << 2;
		
		LSHIFT8 : C_bus <= A_bus << 8;
		
		RSHIFT4 : C_bus <= A_bus >> 4;
		
		RESET : C_bus <= 16'b0;
		
	endcase 
	end
	end
	end
endmodule


