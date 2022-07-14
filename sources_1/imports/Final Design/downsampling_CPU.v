`timescale 1ns / 1ps

module downsampling_CPU(

input clka,
input enable,
input [7:0] data_in,
input [15:0] add_in,
input data_write,
input data_read,
input selection,
output finish,
output [7:0] data_out 
);

//define busses

wire [15:0] address_bus;
wire [7:0] data_in_bus;
wire [7:0] data_out_bus;
wire [7:0] dram_in_bus;
wire [15:0] dram_addr;
wire [7:0] dram_out;
wire write;
wire read;
wire dram_write;
wire dram_read;


Processor Processor(

.din(data_out_bus),
.enable(enable),
.clk(clka),
.dout(data_in_bus),
.addr_out(address_bus),
.finish(finish),
.write(write),
.read(read)

);

DRAM DRAM(

.addr(dram_addr),
.din(dram_in_bus),
.read(dram_read),
.write(dram_write),
.clk(clka),
.dout(dram_out)

);

mux21_8bit data_mux(
.B(data_in_bus),
.A(data_in),
.selection(selection),
.data_output(dram_in_bus)

);

signal_mux write_mux(
.A(data_write),
.B(write),
.selection(selection),
.data_output(dram_write)
);

signal_mux read_mux(
.A(data_read),
.B(read),
.selection(selection),
.data_output(dram_read)
);

mux21_16bit address_mux(
.B(address_bus),
.A(add_in),
.selection(selection),
.data_output(dram_addr)

);

 demux12_8bit data_demux (
 .data_input(dram_out),
 .selection(selection),
 .A(data_out),
 .B(data_out_bus)
 
 );


endmodule
