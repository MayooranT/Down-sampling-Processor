`timescale 1ns / 1ps

module DRAM_tb();

reg clk;
reg[1:0] state;
reg enable;


reg write_file;
reg read_file;
reg selection;

wire [7:0] dataout_file;
wire [15:0] address_bus;
wire [7:0] data_in_bus;
wire [7:0] data_out_bus;
wire write;
wire read;
wire clka;
wire finish;

reg[15:0] data_addr_file=16'b1111111111111111;
reg [7:0] data_file;
reg [7:0] data;
reg finished_reading=1'd0;

integer input_file;
integer output_file ;
integer scan_file;


reg[200:0] output_file_name="DRAM_OUTPUT.txt";

 always begin //clk defined
        #10 clk = !clk;
 end
 
 initial begin
        clk<=1'b0;
        enable<=1'b0;
        selection <=1'b0;
        read_file<=1'b0;
        state<=2'b00; //write to memroy
         input_file = $fopen("C:/Users/USER/Desktop/downsampling_CPU/input.txt", "r");
         output_file = $fopen(output_file_name, "w");

  end

clock_gen clock(

.clk_in(clk),
.clk_out(clka)
);
  
downsampling_CPU downsampling_CPU(
.clka(clka),
.enable(enable),
.data_in(data_file),
.add_in(data_addr_file),
.data_write(write_file),
.data_read(read_file),
.selection(selection),
.finish(finish),
.data_out(dataout_file)
 );


 always @(posedge clka) begin
      if (state==2'b00)begin //merory_write
          write_file<=1'b1;
          scan_file = $fscanf(input_file, "%d\n", data);
          if (!$feof(input_file) && finished_reading==1'd0) begin
              data_file<=data;
              data_addr_file<=data_addr_file+1'd1;
          end
          else if(finished_reading==1'd0) begin
               data_file<=data;
               data_addr_file<=data_addr_file+1'd1;
               finished_reading<=1'd1;  
          end
               

          if (( finished_reading)==1'd1)begin
               state<=2'b10; 
               write_file<=1'b0;
               data_addr_file<=16'b0;
               read_file<=1'b1;
               $display("finished");
          end
      end


      if (state==2'b10)begin
          if(data_addr_file<=16'd89999)begin
              data_addr_file<=data_addr_file+1'd1;
              $fwrite(output_file, "%d\n", dataout_file);
          end
          else begin
              //$fclose(output_file);
              //#100;
              $stop;
          end
          
      end
  end 
 

endmodule