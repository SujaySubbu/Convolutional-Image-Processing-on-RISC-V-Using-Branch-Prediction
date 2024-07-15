`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:32:37 03/27/2021 
// Design Name: 
// Module Name:    ex_mem 
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
module ex_mem(id_ex_br_taken, ex_mem_br_taken, flush, id_ex_rd_sel, ex_mem_rd_sel, stall, clk,zero_flag_alu,zero_flag_ex_mem,id_ex_register_rs2,ex_mem_register_rs2,id_ex_register_rd,ex_mem_register_rd,result,result_ex_mem,id_ex_output_data_2,
ex_mem_output_data_2, id_ex_memtoreg,id_ex_regwrite,id_ex_memread,id_ex_memwrite,id_ex_branch,ex_mem_memtoreg,
ex_mem_regwrite,ex_mem_memread,ex_mem_memwrite,ex_mem_branch,ex_mem_next_address_branch, next_address_branch,
id_ex_enable,ex_mem_enable,id_ex_jump, ex_mem_jump,
id_ex_output_data_1,ex_mem_output_data_1,FWD_RS1,FWD_RS2,ex_mem_FWD_RS1, ex_mem_FWD_RS2, id_ex_branch2, ex_mem_branch2, id_ex_regwrite_control_float, ex_mem_regwrite_control_float);
	
	input clk, stall, id_ex_rd_sel, flush, id_ex_br_taken;
	input wire zero_flag_alu;
	input wire id_ex_memtoreg,id_ex_regwrite,id_ex_memread,id_ex_memwrite,id_ex_branch, id_ex_regwrite_control_float;
	input wire [4:0] id_ex_register_rd,  id_ex_register_rs2;
	input wire [31:0] id_ex_output_data_2;
	input wire [31:0] result;
	input wire [31:0] next_address_branch;
	output reg zero_flag_ex_mem;
	output reg [31:0] result_ex_mem;
	output reg [4:0] ex_mem_register_rd,ex_mem_register_rs2;
	output reg [31:0] ex_mem_output_data_2;
	output reg ex_mem_memtoreg,ex_mem_regwrite,ex_mem_memread,ex_mem_memwrite,ex_mem_branch, ex_mem_regwrite_control_float;
	output reg [31:0]ex_mem_next_address_branch;
	input wire id_ex_enable;
	output reg ex_mem_enable;
	input wire id_ex_jump;
	output reg ex_mem_jump;
	input wire [31:0] id_ex_output_data_1;
	output reg [31:0] ex_mem_output_data_1;
	input wire [1:0] FWD_RS1, FWD_RS2;
	output reg [1:0]  ex_mem_FWD_RS1, ex_mem_FWD_RS2;
	input wire id_ex_branch2;
	output reg ex_mem_branch2, ex_mem_rd_sel, ex_mem_br_taken;
	
always @(posedge clk)
		begin
		if(flush) begin
		zero_flag_ex_mem<=zero_flag_alu;
		result_ex_mem<=result;
		ex_mem_register_rd<=id_ex_register_rd;
		ex_mem_output_data_2<= id_ex_output_data_2;
		ex_mem_memtoreg<=0;
		ex_mem_regwrite<=0;
		ex_mem_memread<=0;
		ex_mem_memwrite<=0;
		ex_mem_branch<=0;
		ex_mem_next_address_branch<= 0;
		ex_mem_enable <= 0;
		ex_mem_jump <= 0;
		ex_mem_output_data_1 <= id_ex_output_data_1;
		ex_mem_register_rs2<=id_ex_register_rs2;
		ex_mem_FWD_RS1 <= FWD_RS1;
		ex_mem_FWD_RS2<=FWD_RS2;
		ex_mem_branch2 <= 0;
		ex_mem_regwrite_control_float <= 0;
		ex_mem_rd_sel <= id_ex_rd_sel;
		ex_mem_br_taken <= 0;
		end
		else begin
		if(stall) begin
		zero_flag_ex_mem<=zero_flag_alu;
		result_ex_mem<=result;
		ex_mem_register_rd<=id_ex_register_rd;
		ex_mem_output_data_2<= id_ex_output_data_2;
		ex_mem_memtoreg<=0;
		ex_mem_regwrite<=0;
		ex_mem_memread<=0;
		ex_mem_memwrite<=0;
		ex_mem_branch<=0;
		ex_mem_next_address_branch<= 0;
		ex_mem_enable <= 0;
		ex_mem_jump <= 0;
		ex_mem_output_data_1 <= id_ex_output_data_1;
		ex_mem_register_rs2<=id_ex_register_rs2;
		ex_mem_FWD_RS1 <= FWD_RS1;
		ex_mem_FWD_RS2<=FWD_RS2;
		ex_mem_branch2 <= 0;
		ex_mem_regwrite_control_float <= 0;
		ex_mem_rd_sel <= id_ex_rd_sel;
		ex_mem_br_taken <= 0;
		end
		else begin
		zero_flag_ex_mem<=zero_flag_alu;
		result_ex_mem<=result;
		ex_mem_register_rd<=id_ex_register_rd;
		ex_mem_output_data_2<= id_ex_output_data_2;
		ex_mem_memtoreg<=id_ex_memtoreg;
		ex_mem_regwrite<=id_ex_regwrite;
		ex_mem_memread<=id_ex_memread;
		ex_mem_memwrite<=id_ex_memwrite;
		ex_mem_branch<=id_ex_branch;
		ex_mem_next_address_branch<= next_address_branch;
		ex_mem_enable <= id_ex_enable;
		ex_mem_jump <= id_ex_jump;
		ex_mem_output_data_1 <= id_ex_output_data_1;
		ex_mem_register_rs2<=id_ex_register_rs2;
		ex_mem_FWD_RS1 <= FWD_RS1;
		 ex_mem_FWD_RS2<=FWD_RS2;
		  ex_mem_branch2 <=  id_ex_branch2;
		  ex_mem_regwrite_control_float <= id_ex_regwrite_control_float;
		  ex_mem_rd_sel <= id_ex_rd_sel;
		  ex_mem_br_taken <= id_ex_br_taken;
		end
        end
        end
endmodule