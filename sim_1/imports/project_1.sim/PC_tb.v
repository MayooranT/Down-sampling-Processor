`timescale 1ns / 1ps

module PC_tb();

reg clk = 1'b0;
reg enable;
reg finish;
reg load;
reg inc;
reg [23:0] C_bus = 24'b0;
wire [7:0] ins_address;
wire clka;
reg state=1'b0;
reg stop=1'b1;


always begin //clk defined
        
        #160 clk = !clk;
end



PC PC(
    .enable(enable),
    .clk(clka),
    .finish(finish),
    .load(load),
    .inc(inc),
    .C_bus(C_bus),
    .ins_address(ins_address)
 );      
//always @(posedge clka) begin   
initial begin
    @(posedge clka);
    C_bus <= C_bus + 1'd1;
    enable <= 1'b1;
    finish <= 1'b0;
    load <= 1'b1;
    inc <= 1'b0;  
    
    #20
    @(posedge clka);
    C_bus <= C_bus + 24'd5;
    enable <= 1'b1;
    finish <= 1'b0;
    load <= 1'b0;
    inc <= 1'b1;
    //state <= 1'b1;
   

    #1000
    @(posedge clka);
    //if (state == stop) begin
    C_bus <= C_bus + 24'd5;
        enable <= 1'b1;
        finish <= 1'b1;
        load <= 1'b0;
        inc <= 1'b1;
      //end 

end 


endmodule
