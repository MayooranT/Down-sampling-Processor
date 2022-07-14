`timescale 1ns / 1ps


module MDR_tb(
    );
    
reg clk = 1'b0;
reg load;
reg read ;
reg write;
reg [7:0] C_bus;
reg [7:0] data_in_DRAM;
wire [7:0] data_out_Bbus;
wire [7:0] data_out_DRAM;
wire clka;
always begin //clk defined
        
        #10 clk = !clk;
end


clock_gen clock(
  
  .clk_in(clk),
  .clk_out(clka)
  
  );
 
 MDR MDR(
    .clk(clka),
    .load(load),
    .read(read),
    .write(write),
    .C_bus(C_bus),
    .data_in_DRAM(data_in_DRAM),
    .data_out_Bbus(data_out_Bbus),
    .data_out_DRAM(data_out_DRAM)
 );
 
 
 initial begin
     @(posedge clka);
     load <=1'b0;
     #160 
     @(posedge clk);
     load <= 1'b1;
     C_bus <= 8'd5;
     
     #100
     @(posedge clk);
     load <= 1'b0;
     read <= 1'b1;
     data_in_DRAM <= 8'd43;
    
    #160
     @(posedge clk);
      read <= 1'b0;
      write <= 1'b1;
      C_bus <= 8'd50;

 end
endmodule
