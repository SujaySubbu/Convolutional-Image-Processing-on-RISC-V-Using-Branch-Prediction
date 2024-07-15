`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:41:50 03/27/2021 
// Design Name: 
// Module Name:    Data_mem 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Data_mem (
input reset,
	input wire [31:0] addr,          // Memory Address
	input wire [31:0] write_data,    // Memory Address Contents
	input wire memwrite, memread,
	input wire clk, wr_o,                 // clock
	output [31:0] read_data ,
	output reg wr_en, // Output of Memory Address Contents
	output   [31:0] output1,output2, output3, output4,output5, output6, output7,output8, output9
	
);

reg [7:0] MEM[0:255];  // 256 bytes

integer i;

assign output1 = {MEM[3], MEM[2], MEM[1], MEM[0]};
assign output2 = {MEM[7], MEM[6], MEM[5], MEM[4]};
assign output3 = {MEM[11], MEM[10], MEM[9], MEM[8]};
assign output4 = {MEM[15], MEM[14], MEM[13], MEM[12]};
assign output5 = {MEM[19], MEM[18], MEM[17], MEM[16]};
assign output6 = {MEM[23], MEM[22], MEM[21], MEM[20]};
assign output7 = {MEM[27], MEM[26], MEM[25], MEM[24]};
assign output8 = {MEM[31], MEM[30], MEM[29], MEM[28]};
assign output9 = {MEM[35], MEM[34], MEM[33], MEM[32]};
assign read_data = memread ?  {MEM[addr+3], MEM[addr+2], MEM[addr+1], MEM[addr]} : 32'bz;
always@(posedge clk)
begin
if(reset) begin
MEM[3]<=8'h00;
MEM[2]<=8'h00;
MEM[1]<=8'h00;
MEM[0]<=8'h00;
MEM[7]<=8'h00;
MEM[6]<=8'h00;
MEM[5]<=8'h00;
MEM[4]<=8'h00;
MEM[11]<=8'h00;
MEM[10]<=8'h00;
MEM[9]<=8'h00;
MEM[8]<=8'h00;
MEM[15]<=8'h00;
MEM[14]<=8'h00;
MEM[13]<=8'h00;
MEM[12]<=8'h00;
MEM[19]<=8'h00;
MEM[18]<=8'h00;
MEM[17]<=8'h00;
MEM[16]<=8'h00;
MEM[23]<=8'h00;
MEM[22]<=8'h00;
MEM[21]<=8'h00;
MEM[20]<=8'h00;
MEM[27]<=8'h00;
MEM[26]<=8'h00;
MEM[25]<=8'h00;
MEM[24]<=8'h00;
MEM[31]<=8'h00;
MEM[30]<=8'h00;
MEM[29]<=8'h00;
MEM[28]<=8'h00;
MEM[35]<=8'h00;
MEM[34]<=8'h00;
MEM[33]<=8'h00;
MEM[32]<=8'h00;
MEM[39]<=8'h00;
MEM[38]<=8'h00;
MEM[37]<=8'h00;
MEM[36]<=8'h00;
MEM[43]<=8'h00;
MEM[42]<=8'h00;
MEM[41]<=8'h00;
MEM[40]<=8'h00;
MEM[47]<=8'h00;
MEM[46]<=8'h00;
MEM[45]<=8'h00;
MEM[44]<=8'h00;
MEM[51]<=8'h00;
MEM[50]<=8'h00;
MEM[49]<=8'h00;
MEM[48]<=8'h00;
MEM[55]<=8'h00;
MEM[54]<=8'h00;
MEM[53]<=8'h00;
MEM[52]<=8'h00;
MEM[59]<=8'h00;
MEM[58]<=8'h00;
MEM[57]<=8'h00;
MEM[56]<=8'h00;
MEM[63]<=8'h00;
MEM[62]<=8'h00;
MEM[61]<=8'h00;
//MEM[60]<=8'h0c;
MEM[60]<=8'h19;
MEM[67]<=8'h00;
MEM[66]<=8'h00;
MEM[65]<=8'h00;
//MEM[64]<=8'h02;
MEM[64]<=8'h64;
MEM[71]<=8'h00;
MEM[70]<=8'h00;
MEM[69]<=8'h00;
//MEM[68]<=8'h13;
MEM[68]<=8'h7d;
MEM[75]<=8'h00;
MEM[74]<=8'h00;
MEM[73]<=8'h00;
MEM[72]<=8'h00;
MEM[79]<=8'h00;
MEM[78]<=8'h00;
MEM[77]<=8'h00;
MEM[76]<=8'h00;
MEM[83]<=8'h00;
MEM[82]<=8'h00;
MEM[81]<=8'h00;
//MEM[80]<=8'h07;
MEM[80]<=8'hde;
MEM[87]<=8'h00;
MEM[86]<=8'h00;
MEM[85]<=8'h00;
//MEM[84]<=8'h0a;
MEM[84]<=8'h96;
MEM[91]<=8'h00;
MEM[90]<=8'h00;
MEM[89]<=8'h00;
//MEM[88]<=8'h0b;
MEM[88]<=8'h0a;
MEM[95]<=8'h00;
MEM[94]<=8'h00;
MEM[93]<=8'h00;
MEM[92]<=8'h00;
MEM[99]<=8'h00;
MEM[98]<=8'h00;
MEM[97]<=8'h00;
MEM[96]<=8'h00;
MEM[103]<=8'h00;
MEM[102]<=8'h00;
MEM[101]<=8'h00;
//MEM[100]<=8'h2d;
MEM[100]<=8'hbe;
MEM[107]<=8'h00;
MEM[106]<=8'h00;
MEM[105]<=8'h00;
//MEM[104]<=8'h44;
MEM[104]<=8'h16;
MEM[111]<=8'h00;
MEM[110]<=8'h00;
MEM[109]<=8'h00;
//MEM[108]<=8'h15;
MEM[108]<=8'hc8;
MEM[115]<=8'h00;
MEM[114]<=8'h00;
MEM[113]<=8'h00;
MEM[112]<=8'h00;
MEM[119]<=8'h00;
MEM[118]<=8'h00;
MEM[117]<=8'h00;
MEM[116]<=8'h00;
MEM[123]<=8'h00;
MEM[122]<=8'h00;
MEM[121]<=8'h00;
MEM[120]<=8'h00;
MEM[127]<=8'h00;
MEM[126]<=8'h00;
MEM[125]<=8'h00;
MEM[124]<=8'h00;
MEM[131]<=8'h00;
MEM[130]<=8'h00;
MEM[129]<=8'h00;
MEM[128]<=8'h00;
MEM[135]<=8'h00;
MEM[134]<=8'h00;
MEM[133]<=8'h00;
MEM[132]<=8'h00;
MEM[139]<=8'h00;
MEM[138]<=8'h00;
MEM[137]<=8'h00;
MEM[136]<=8'h00;
MEM[143]<=8'hff;
MEM[142]<=8'hff;
MEM[141]<=8'hff;
MEM[140]<=8'hff;
MEM[147]<=8'h00;
MEM[146]<=8'h00;
MEM[145]<=8'h00;
MEM[144]<=8'h00;
MEM[151]<=8'hff;
MEM[150]<=8'hff;
MEM[149]<=8'hff;
MEM[148]<=8'hff;
MEM[155]<=8'h00;
MEM[154]<=8'h00;
MEM[153]<=8'h00;
MEM[152]<=8'h05;
MEM[159]<=8'hff;
MEM[158]<=8'hff;
MEM[157]<=8'hff;
MEM[156]<=8'hff;
MEM[163]<=8'h00;
MEM[162]<=8'h00;
MEM[161]<=8'h00;
MEM[160]<=8'h00;
MEM[167]<=8'hff;
MEM[166]<=8'hff;
MEM[165]<=8'hff;
MEM[164]<=8'hff;
MEM[171]<=8'h00;
MEM[170]<=8'h00;
MEM[169]<=8'h00;
MEM[168]<=8'h00;
MEM[175]<=8'h00;
MEM[174]<=8'h00;
MEM[173]<=8'h00;
MEM[172]<=8'h05;
MEM[179]<=8'h00;
MEM[178]<=8'h00;
MEM[177]<=8'h00;
MEM[176]<=8'h05;
MEM[183]<=8'h00;
MEM[182]<=8'h00;
MEM[181]<=8'h00;
MEM[180]<=8'h03;
MEM[187]<=8'h00;
MEM[186]<=8'h00;
MEM[185]<=8'h00;
MEM[184]<=8'h03;
MEM[191]<=8'h00;
MEM[190]<=8'h00;
MEM[189]<=8'h00;
MEM[188]<=8'h00;
MEM[195]<=8'h00;
MEM[194]<=8'h00;
MEM[193]<=8'h00;
MEM[192]<=8'h00;
MEM[199]<=8'h00;
MEM[198]<=8'h00;
MEM[197]<=8'h00;
MEM[196]<=8'h00;
MEM[203]<=8'h00;
MEM[202]<=8'h00;
MEM[201]<=8'h00;
MEM[200]<=8'h00;
MEM[207]<=8'h00;
MEM[206]<=8'h00;
MEM[205]<=8'h00;
MEM[204]<=8'h00;
MEM[211]<=8'h00;
MEM[210]<=8'h00;
MEM[209]<=8'h00;
MEM[208]<=8'h00;
end
else begin

if (memwrite == 1'b1)
    {MEM[addr+3], MEM[addr+2], MEM[addr+1], MEM[addr]} <= write_data;
end
end


endmodule
