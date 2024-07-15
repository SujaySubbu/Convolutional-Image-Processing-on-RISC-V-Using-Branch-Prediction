`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:35:27 03/27/2021 
// Design Name: 
// Module Name:    forwarding_unit 
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
module forwarding_unit(
    input ex_mem_regwrite_control_float, mem_wb_regwrite_control_float,
    input id_ex_rs1_sel, id_ex_rs2_sel, ex_mem_rd_sel, mem_wb_rd_sel,
	input [4:0] ID_EX_RS1,           
	input [4:0] ID_EX_RS2,
	input [4:0] EX_MEM_RD,
	input [4:0] MEM_WB_RD,
	input  EX_MEM_RegWrite,
	input  MEM_WB_RegWrite,
	input  EX_MEM_MemWrite,
	input [4:0]EX_MEM_RS2 ,
	output reg [1:0] FWD_RS1,
	output reg [1:0] FWD_RS2
);

// output from forwarding unit is select lines for mux
/*
00 - no forwarding
01 - exec stage forwarding
10 - mem stage forwarding
*/
always@(*)
begin
	if((EX_MEM_RegWrite|ex_mem_regwrite_control_float) && EX_MEM_RD != 0 && EX_MEM_RD == ID_EX_RS1 && ex_mem_rd_sel == id_ex_rs1_sel)
			FWD_RS1 = 2'b01;
	else if((MEM_WB_RegWrite|mem_wb_regwrite_control_float) && MEM_WB_RD != 0 && MEM_WB_RD == ID_EX_RS1 && mem_wb_rd_sel == id_ex_rs1_sel)
			FWD_RS1 = 2'b10;
	else
		   FWD_RS1 = 2'b00;
	
	if((EX_MEM_RegWrite|ex_mem_regwrite_control_float) && EX_MEM_RD != 0 && EX_MEM_RD == ID_EX_RS2 && ex_mem_rd_sel == id_ex_rs2_sel)
			FWD_RS2 = 2'b01;
	else if(((MEM_WB_RegWrite|mem_wb_regwrite_control_float) && MEM_WB_RD != 0 && MEM_WB_RD == ID_EX_RS2) && mem_wb_rd_sel == id_ex_rs2_sel)
			FWD_RS2 = 2'b10;
	else
		   FWD_RS2 = 2'b00;
	
end
endmodule