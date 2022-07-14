
module decoder(

input [15:0] X,CV,C,DCV,Z,Y,
input [7:0] PC,
input [7:0] MDR, 
input [7:0] MBRU,
input [3:0] B_bus_ctrl,
output reg [15:0] B_bus

);

always@( B_bus_ctrl or X or CV or C or DCV or Z or Y or PC or MBRU or MDR)
	begin 
		case(B_bus_ctrl)
		
			4'b0001 : B_bus <= {16'b0,MDR};
			
			4'b0010 : B_bus <= {16'b0,PC};
			
			4'b0011 : B_bus <= {16'b0, MBRU};
			
			4'b0100 : B_bus <= X;
			
			4'b0101 : B_bus <= CV;
			
			4'b0110 : B_bus <= C;
			
			4'b0111 : B_bus <= DCV;
			
			4'b1000 : B_bus <= Z;
			
			4'b1001 : B_bus <= Y;
			
			default : B_bus <= 16'b0;
			
		endcase
	end
	
endmodule

