module IRAM(

input clk,
input [7:0] addr,
output reg [7:0] dout 

);

reg [7:0] ROM [120:0];

// Assembly Instructions

parameter FETCH = 8'd0;
parameter NOP = 8'd2;
parameter LDAC = 8'd3;
parameter STAC = 8'd5;
parameter CLAC = 8'd7;
parameter INAC = 8'd8;
parameter DEAC = 8'd9;
parameter ADDT = 8'd10;
parameter ADDL = 8'd11;
parameter SUBE = 8'd12;
parameter SUBL = 8'd13;
parameter DIV  = 8'd14;
parameter MUL2 = 8'd15;
parameter MUL4 = 8'd16;
parameter MUL256 = 8'd17;
parameter MVACMAR = 8'd18;
parameter MVACCV = 8'd19;
parameter MVACC = 8'd20;
parameter MVACDCV = 8'd21;
parameter MVACX = 8'd22;
parameter MVACY = 8'd23;
parameter MVACZ = 8'd24;
parameter MVCV = 8'd25;
parameter MVC = 8'd26;
parameter MVDCV = 8'd27;
parameter MVZ = 8'd28;
parameter MVX = 8'd29;
parameter JUMP = 8'd30;
parameter JMPZ = 8'd33;
parameter JMNZ = 8'd38;
parameter L1 = 8'd120;
parameter L2 = 8'd21;


always @(posedge clk)
	begin
		dout <= ROM[addr];
	end
	
initial 
begin

// ROM[0] = CLAC; 
// ROM[1] = MVACMAR;
// ROM[2] = LDAC;
// ROM[3] = INAC;
// ROM[4] = MVACX;
// ROM[5] = MVX;
// ROM[6] = INAC;
// ROM[7] = INAC; 
// ROM[8] = MVACCV;
// ROM[9] = CLAC;
// ROM[10] = INAC;
// ROM[11] = MVACDCV;
// ROM[12] = CLAC;
// ROM[13] = INAC;
// ROM[14] = INAC;
// ROM[15] = MVACC;
 
// ROM[16] = MVX;
// ROM[17] = DEAC; 
// ROM[18] = DEAC;
// ROM[19] = MUL256; 
// ROM[20] = MVACY;

// ROM[21] = CLAC;
// ROM[22] = MVACZ;
// ROM[23] = MVCV; 
// ROM[24] = SUBL; 
// ROM[25] = DEAC;  
// ROM[26] = MVACMAR; 
// ROM[27] = LDAC; 
// ROM[28] = ADDT;
// ROM[29] = MVACZ;  
// ROM[30] = MVCV;  
// ROM[31] = SUBL;  
// ROM[32] = MVACMAR; 
// ROM[33] = LDAC;
// ROM[34] = MUL2;
// ROM[35] = ADDT; 
// ROM[36] = MVACZ; 
// ROM[37] = MVCV; 
// ROM[38] = SUBL; 
// ROM[39] = INAC;
// ROM[40] = MVACMAR; 
// ROM[41] = LDAC;
// ROM[42] = ADDT;
// ROM[43] = MVACZ;
// ROM[44] = MVCV;
// ROM[45] = DEAC;
// ROM[46] = MVACMAR;
// ROM[47] = LDAC;
// ROM[48] = MUL2; 
// ROM[49] = ADDT;
// ROM[50] = MVACZ; 
// ROM[51] = MVCV;
// ROM[52] = MVACMAR;
// ROM[53] = LDAC;
// ROM[54] = MUL4;
// ROM[55] = ADDT;
// ROM[56] = MVACZ;
// ROM[57] = MVCV;
// ROM[58] = INAC; 
// ROM[59] = MVACMAR; 
// ROM[60] = LDAC;
// ROM[61] = MUL2;
// ROM[62] = ADDT;
// ROM[63] = MVACZ;
// ROM[64] = MVCV;
// ROM[65] = ADDL; 
// ROM[66] = DEAC;
// ROM[67] = MVACMAR; 
// ROM[68] = LDAC; 
// ROM[69] = ADDT; 
// ROM[70] = MVACZ;
// ROM[71] = MVCV;
// ROM[72] = ADDL;
// ROM[73] = MVACMAR;
// ROM[74] = LDAC;
// ROM[75] = MUL2; 
// ROM[76] = ADDT; 
// ROM[77] = MVACZ; 
// ROM[78] = MVCV; 
// ROM[79] = ADDL;  
// ROM[80] = INAC; 
// ROM[81] = MVACMAR; 
// ROM[82] = LDAC; 
// ROM[83] = ADDT; 
// ROM[84] = MVACZ; 

// ROM[85] = MVZ; 
// ROM[86] = DIV; 
// ROM[87] = MVDCV;
// ROM[88] = MVACMAR;
// ROM[89] = STAC; 

// ROM[90] = MVDCV; 
// ROM[91] = INAC;  
// ROM[92] = MVACDCV;  
// ROM[93] = MVC; 
// ROM[94] = INAC;
// ROM[95] = INAC; 
// ROM[96] = MVACC; 
// ROM[97] = MVCV; 
// ROM[98] = INAC; 
// ROM[99] = INAC; 
// ROM[100] = MVACCV; 

// ROM[101] = MVCV; 
// ROM[102] = SUBE; 
// ROM[103] = JMPZ;
// ROM[104] = L1;

// ROM[105] = MVC; 
// ROM[106] = SUBL;  
// ROM[107] = JMNZ;  
// ROM[108] = L2; 
// ROM[109] = MVCV; 
// ROM[110] = ADDL; 
// ROM[111] = INAC; 
// ROM[112] = INAC; 
// ROM[113] = MVACCV; 
// ROM[114] = CLAC;
// ROM[115] = INAC; 
// ROM[116] = INAC; 
// ROM[117] = MVACC; 
// ROM[118] = JUMP; 
// ROM[119] = L2;

// ROM[120] = NOP; 

// Assembly code for shifting


// ROM[0] = CLAC; 
// ROM[1] = MVACMAR;
// ROM[2] = LDAC;
// ROM[3] = MUL2;
// ROM[4] = MVACX;
// ROM[5] = CLAC;
// ROM[6] = INAC;
// ROM[7] = MVACMAR;

// ROM[8] = MVX; 
// ROM[9] = CLAC;
// ROM[10] = STAC;

// ROM[11] = NOP;

// Assembly code for adding

// ROM[0] = CLAC; 
// ROM[1] = MVACMAR;
// ROM[2] = LDAC;
// ROM[3] = MVACX;
// ROM[4] = CLAC;
// ROM[5] = INAC;
// ROM[6] = MVACMAR;
// ROM[7] = LDAC; 
// ROM[8] = ADDL;
// ROM[9] = MVACZ;
// ROM[10] = CLAC;
// ROM[11] = INAC;
// ROM[12] = INAC;
// ROM[11] = MVACMAR;
// ROM[12] = MVZ;
// ROM[13] = STAC;
 
// ROM[14] = NOP;

// Assembly code for division

ROM[0] = CLAC;
ROM[1] = MVACMAR;
ROM[2] = LDAC;
ROM[3] = MVACX;
ROM[4] = CLAC;
ROM[5] = INAC;
ROM[6] = MVACMAR;
ROM[7] = LDAC;
ROM[8] = ADDL;
ROM[9] = MVACZ;
ROM[10] = CLAC;
ROM[11] = MVACMAR;
ROM[12] = CLAC;
ROM[13] = MVZ;
ROM[14] = STAC;
 
ROM[15] = NOP;

end
endmodule


