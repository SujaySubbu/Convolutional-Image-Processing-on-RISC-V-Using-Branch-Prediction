`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:31:21 03/27/2021 
// Design Name: 
// Module Name:    id_ex 
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
/*
module id_ex(
	input wire[4:0]if_id_register_rs1,if_id_register_rs2,if_id_register_rd,
	input	wire[31:0]if_id_output_data_1,if_id_output_data_2,if_id_sign_extend_immediate,
	input wire clk,if_id_memtoreg,if_id_alusrc,if_id_memread,if_id_memwrite,if_id_branch,
	input wire [3:0]if_id_alu_control,
	output reg [31:0]id_ex_output_data1,id_ex_output_data_2,id_ex_sign_extend_immediate,
	output reg	[4:0]id_ex_register_rs1,id_ex_register_rs2,id_ex_register_rd,
	output reg	id_ex_memtoreg,id_ex_alusrc,id_ex_memread,id_ex_memwrite,id_ex_branch,
	output reg [3:0]id_ex_alu_control
	
    );
always @(posedge clk) begin
	
	id_ex_output_data1<=if_id_output_data_1;
	id_ex_output_data_2<=if_id_output_data_2;
	id_ex_sign_extend_immediate<=if_id_sign_extend_immediate;
	
	id_ex_register_rs1<=if_id_register_rs1;
	id_ex_register_rs2<=if_id_register_rs2;
	id_ex_register_rd<=if_id_register_rd;
	
	id_ex_memtoreg<=if_id_memtoreg;
	id_ex_alusrc<=if_id_alusrc;
	id_ex_memread<=if_id_memread;
	id_ex_memwrite<=if_id_memwrite;
	id_ex_branch<=if_id_branch;
	id_ex_alu_control<=if_id_alu_control;
	
	
	
end
endmodule
*/

module id_ex(
    input wire if_id_lui, flush,
    input wire if_id_branch_instr,
    input wire if_id_rs1_sel, if_id_rs2_sel, if_id_rd_sel,
    input wire stall,
    input wire [1:0] if_id_float_sel,
	input wire[4:0]if_id_register_rs1,if_id_register_rs2,if_id_register_rd,
	input wire[31:0]if_id_output_data_1,if_id_output_data_2,if_id_sign_extend_immediate,
	input wire clk, if_id_regwrite_control_float,if_id_float,
	input wire [10:0]control,
	input wire [31:0] if_id_pc,
	input wire enable,if_id_jump,
	output reg [31:0]id_ex_output_data1,id_ex_output_data_2,id_ex_sign_extend_immediate,
	output reg	[4:0]id_ex_register_rs1,id_ex_register_rs2,id_ex_register_rd,
	output reg	id_ex_memtoreg,id_ex_alusrc,id_ex_memread,id_ex_memwrite,id_ex_branch,id_ex_regwrite_control,id_ex_jump,
	output reg [3:0]id_ex_alu_control,
	output reg [31:0] id_ex_pc,
	output reg id_ex_enable,
	input wire if_id_branch2,
	output reg id_ex_branch2, id_ex_regwrite_control_float, id_ex_float,
	output reg [1:0] id_ex_float_sel,
	output reg id_ex_rs1_sel, id_ex_rs2_sel, id_ex_rd_sel, id_ex_branch_instr, id_ex_lui
    );
always @(posedge clk) begin
//if(reset)
//id_ex_enable=0;
//else
//begin

    if(flush) begin
    id_ex_output_data1<=0;
	id_ex_output_data_2<=0;
	id_ex_sign_extend_immediate<=0;
	
	id_ex_register_rs1<=id_ex_register_rs1;
	id_ex_register_rs2<=id_ex_register_rs2;
	id_ex_register_rd<=id_ex_register_rd;
	
	id_ex_memtoreg <= 0;
	id_ex_alusrc <= 0;
	id_ex_memread <= 0;
	id_ex_memwrite <= 0;
	id_ex_branch <= 0;
	id_ex_alu_control <= 0;
	id_ex_regwrite_control <=0;
	id_ex_pc <= id_ex_pc;
	id_ex_enable <= 0;
	id_ex_jump <= 0;
	id_ex_branch2 <= 0;
	id_ex_regwrite_control_float <= 0;
	id_ex_float <= 0;
	id_ex_float_sel <= 0;
	id_ex_rs1_sel <= 0;
	id_ex_rs2_sel <= 0;
	id_ex_rd_sel <= 0;
	id_ex_branch_instr <= 0;
	id_ex_lui <= 0;
    end
    else begin
	if(stall) begin
	id_ex_output_data1<=id_ex_output_data1;
	id_ex_output_data_2<=id_ex_output_data_2;
	id_ex_sign_extend_immediate<=id_ex_sign_extend_immediate;
	
	id_ex_register_rs1<=id_ex_register_rs1;
	id_ex_register_rs2<=id_ex_register_rs2;
	id_ex_register_rd<=id_ex_register_rd;
	
	id_ex_memtoreg <= id_ex_memtoreg;
	id_ex_alusrc <= id_ex_alusrc;
	id_ex_memread <= id_ex_memread;
	id_ex_memwrite <= id_ex_memwrite;
	id_ex_branch <= id_ex_branch;
	id_ex_alu_control <= id_ex_alu_control;
	id_ex_regwrite_control <= id_ex_regwrite_control;
	id_ex_pc <= id_ex_pc;
	id_ex_enable <= id_ex_enable;
	id_ex_jump <= id_ex_jump;
	id_ex_branch2 <= id_ex_branch2;
	id_ex_regwrite_control_float <= id_ex_regwrite_control_float;
	id_ex_float <= id_ex_float;
	id_ex_float_sel <= id_ex_float_sel;
	id_ex_rs1_sel <= id_ex_rs1_sel;
	id_ex_rs2_sel <= id_ex_rs2_sel;
	id_ex_rd_sel <= id_ex_rd_sel;
	id_ex_branch_instr <= id_ex_branch_instr;
	id_ex_lui <= id_ex_lui;
	end
	else begin
	id_ex_output_data1<=if_id_output_data_1;
	id_ex_output_data_2<=if_id_output_data_2;
	id_ex_sign_extend_immediate<=if_id_sign_extend_immediate;
	
	id_ex_register_rs1<=if_id_register_rs1;
	id_ex_register_rs2<=if_id_register_rs2;
	id_ex_register_rd<=if_id_register_rd;
	
	id_ex_memtoreg <= control[0];
	id_ex_alusrc <= control[4];
	id_ex_memread <= control[3];
	id_ex_memwrite <= control[2];
	id_ex_branch <= control[1];
	id_ex_alu_control <= control[8:5];
	id_ex_regwrite_control <= control[9];
	id_ex_pc <= if_id_pc;
	id_ex_enable <= control[10];
	id_ex_jump <= if_id_jump;
	id_ex_branch2 <= if_id_branch2;
	id_ex_regwrite_control_float <= if_id_regwrite_control_float;
	id_ex_float <= if_id_float;
	id_ex_float_sel <= if_id_float_sel;
	id_ex_rs1_sel <= if_id_rs1_sel;
	id_ex_rs2_sel <= if_id_rs2_sel;
	id_ex_rd_sel <= if_id_rd_sel;
	id_ex_branch_instr <= if_id_branch_instr;
	id_ex_lui <= if_id_lui;
	end
	end
end
//end
endmodule


