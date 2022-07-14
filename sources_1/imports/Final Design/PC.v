
module PC(

input enable, 
input clk,
input finish,	
input load, //connects to PC Write signal (for tb 0)
input inc, //inc signal 
input [7:0] C_bus, 
output reg [7:0] ins_address //MBRU ins_in

);



reg start = 1'b0;
reg [1:0] state = 2'b0;

initial begin 
	ins_address <= 8'b0;
	
end

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
		if (finish) begin ins_address <= ins_address; end
		else if (enable) begin
		 if (load && state == 2'b11) begin 
				ins_address <= C_bus;
				end
			else if (inc && state == 2'b11) begin
				ins_address <= ins_address + 8'b00000001;
			end
			else begin
				ins_address <= ins_address;
		end
		end
	end

endmodule

			
