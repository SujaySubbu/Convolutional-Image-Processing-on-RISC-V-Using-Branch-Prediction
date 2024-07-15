`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:33:37 03/27/2021 
// Design Name: 
// Module Name:    mem_wb 
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
 module mem_wb(ex_mem_rd_sel, mem_wb_rd_sel, clk,ex_mem_register_rd,mem_wb_register_rd, result_ex_mem,result_mem_wb,read_data,read_data_mem_wb,	ex_mem_memtoreg,ex_mem_regwrite, mem_wb_memtoreg,mem_wb_regwrite, ex_mem_regwrite_control_float, mem_wb_regwrite_control_float);
	
	input clk, ex_mem_rd_sel;
	input wire 	ex_mem_memtoreg,ex_mem_regwrite, ex_mem_regwrite_control_float;
	input wire [4:0] ex_mem_register_rd;
	
	input wire [31:0] result_ex_mem;
	input wire [31:0] read_data;
	output reg [4:0] mem_wb_register_rd;
	output reg [31:0] result_mem_wb;
	output reg [31:0] read_data_mem_wb;
	output reg  mem_wb_memtoreg,mem_wb_regwrite, mem_wb_regwrite_control_float, mem_wb_rd_sel;
	
	always @(posedge clk)
	begin
	mem_wb_register_rd<= ex_mem_register_rd;
	result_mem_wb<= result_ex_mem;
	read_data_mem_wb<= read_data;
	mem_wb_memtoreg<=ex_mem_memtoreg;
   mem_wb_regwrite<= ex_mem_regwrite;	 
   mem_wb_regwrite_control_float <= ex_mem_regwrite_control_float;
   mem_wb_rd_sel <= ex_mem_rd_sel;
	end
  


endmodule