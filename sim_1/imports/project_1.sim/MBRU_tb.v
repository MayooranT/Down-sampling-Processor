`timescale 1ns / 1ps


module MBRU_tb();

reg clk=1'b0;
reg fetch = 1'b1;
reg [7:0] ins_in=8'b0; //This connects to IRAM 
wire [7:0] ins_out;   

always begin //clk defined
        
        #10 clk = !clk;
end


clock_gen clock(
  
  .clk_in(clk),
  .clk_out(clka)
  
  );
  
MBRU MBRU(
    .clk(clka),
    .fetch(fetch),
    .ins_in(ins_in),
    .ins_out(ins_out)
);

always@(posedge clka)
	begin	
	ins_in <= ins_in + 1;
	end 

endmodule
