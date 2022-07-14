
module Processor(

input enable,
input clk,
input [7:0] din,
output [15:0] addr_out,
output [7:0] dout,
output finish,
output read,
output write

);

wire [7:0] ins_address;
wire [7:0] ins_in;
wire [7:0] ins_out;
wire [29:0] MIR;
wire [15:0] A_bus;
wire [15:0] B_bus;
wire [15:0] C_bus;
wire Z_flag;
wire [15:0] X_bus;
wire [15:0] Y_bus;
wire [15:0] Z_bus;
wire [15:0] CV_bus;
wire [15:0] Counter_bus;
wire [15:0] DCV_bus;
wire [7:0] MDR_bus;
wire finish_flag;

assign read = MIR[6];
assign write = MIR[5];

assign finish = finish_flag;

//Define the Control Store 

control_unit CTRL_UNIT(
.enable(enable),
.clk(clk),
.Z_flag(Z_flag),
.addr(MIR[29:22]),
.MBRU(ins_out),
.MIR(MIR),
.finish(finish_flag)

);


PC PC(
.enable(enable),
.clk(clk),
.inc(MIR[4]),
.C_bus(C_bus),
.finish(finish_flag),
.ins_address(ins_address),
.load(MIR[15])
);


IRAM IRAM(
.clk(clk),
.addr(ins_address),
.dout(ins_in)
);


MBRU MBRU(
.clk(clk),
.fetch(MIR[7]),
.ins_in(ins_in),
.ins_out(ins_out)
);


GPR X(
.clk(clk),
.load(MIR[14]),
.C_bus(C_bus),
.data_out(X_bus)
);



GPR CV( //CURRENT VALUE
.clk(clk),
.load(MIR[13]),
.C_bus(C_bus),
.data_out(CV_bus)
);



GPR C( //COUNTER
.clk(clk),
.load(MIR[12]),
.C_bus(C_bus),
.data_out(Counter_bus)
);



GPR DCV(//DOWNSAMPLED CURRENT VALUE
.clk(clk),
.load(MIR[11]),
.C_bus(C_bus),
.data_out(DCV_bus)
);



GPR Z(
.clk(clk),
.load(MIR[10]),
.C_bus(C_bus),
.data_out(Z_bus)
);



GPR Y(
.clk(clk),
.load(MIR[9]),
.C_bus(C_bus),
.data_out(Y_bus)
);



GPR AC(
.clk(clk),
.load(MIR[8]),
.C_bus(C_bus),
.data_out(A_bus)
);



MDR MDR(
.clk(clk),
.load(MIR[16]),
.read(MIR[6]),
.write(MIR[5]),
.C_bus(C_bus[7:0]),
.data_in_DRAM(din),
.data_out_DRAM(dout),
.data_out_Bbus(MDR_bus)
);


MAR MAR(
.clk(clk),
.load(MIR[17]),
.C_bus(C_bus[15:0]),
.data_address(addr_out)
);


ALU ALU(
.A_bus(A_bus),
.B_bus(B_bus),
.operation(MIR[21:18]),
.C_bus(C_bus),
.enable(enable),
.clk(clk),
.Z_flag(Z_flag)
);


decoder decoder(
.X(X_bus),
.CV(CV_bus),
.C(Counter_bus),
.DCV(DCV_bus),
.Z(Z_bus),
.Y(Y_bus),
.PC(ins_address),
.MDR(MDR_bus),
.MBRU(ins_out),
.B_bus_ctrl(MIR[3:0]),
.B_bus(B_bus)
);

endmodule











