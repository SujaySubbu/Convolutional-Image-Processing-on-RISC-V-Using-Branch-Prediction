`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:36:57 03/27/2021 
// Design Name: 
// Module Name:    Processor 
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

module Processor(
    input clock,
	 input reset,
	 output wire  [31:0] output1,output2,output3,output4,output5,output6,output7,output8,output9);
	 wire stall;
      wire zero_flag;
	  wire[31:0] inst_code;
	  wire[31:0] PC;
	  wire pc_write;
	  wire if_id_write;
	  wire [31:0] if_id_pc, id_inst_code, id_ex_pc; 
	  wire [31:0] output_data1,output_data2,write_data1, write_data2;
	  wire [31:0]sign_extend, bit_extend, offset_u;
	  wire [4:0]rs1,rs2,rd,if_id_register_rs1,if_id_register_rs2;
	  wire [31:0]id_ex_output_data1,id_ex_output_data2,id_ex_sign_extend_immediate;
	  wire [4:0]id_ex_register_rs1,id_ex_register_rs2,id_ex_register_rd;
	  wire id_ex_memtoreg,id_ex_alusrc,id_ex_memread,id_ex_memwrite,id_ex_branch,id_ex_regwrite_control;
	  wire [3:0]id_ex_alu_control;
	  wire [31:0]alu_result, result_ex_mem, result_mem_wb;
	  wire [2:0]funct3;
	  wire [6:0] funct7, opcode;
	  wire [3:0] if_id_alu_control;
	  wire [10:0]control;
	  wire control_sel;
     wire if_id_branch_instr,id_ex_branch_instr,if_id_regwrite_control,if_id_memtoreg,if_id_alusrc,if_id_memread,if_id_memwrite,if_id_branch,if_id_branch2,if_id_jump;
	  wire zero_flag_ex_mem;
	  wire [4:0] ex_mem_register_rd, mem_wb_register_rd,ex_mem_register_rs2;
	  wire [31:0] ex_mem_output_data_1, ex_mem_output_data_2, read_data, read_data_mem_wb;
	  wire ex_mem_memtoreg,ex_mem_regwrite,ex_mem_memread,ex_mem_memwrite,ex_mem_branch,ex_mem_jump, mem_wb_memtoreg,mem_wb_regwrite;
	  wire [1:0]FWD_RS1,FWD_RS2 ,ex_mem_FWD_RS1, ex_mem_FWD_RS2;
	  wire [31:0]in1,in2,alu_mux;
	  wire pc_src,pc_src_1, id_ex_jump,ex_mem_branch2;
	  wire [31:0] next_address_branch, input_to_ifu, ex_mem_next_address_branch, next_address;
	  wire enable, br_taken;
    wire [31:0] result, ex_result, fp_result;
    wire flush;
	 wire [31:0] B_addr, J_addr;
	 wire [1:0] PCsrc;
	 		wire ex_mem_regwrite_control_float, mem_wb_regwrite_control_float;
	  wire float, rs1_sel, rs2_sel, if_id_regwrite_control_float, rd_sel;
	  wire id_ex_float, id_ex_regwrite_control_float;
	  wire id_ex_rs1_sel, id_ex_rs2_sel, id_ex_rd_sel, ex_mem_rd_sel, mem_wb_rd_sel;
	  wire [4:0] funct5;
	  		wire if_id_lui, id_ex_lui;	
	  wire pc_write_final = pc_write & (~stall);
	  IFU Instruction_fetch_module(clock, reset,pc_write_final,input_to_ifu, inst_code,PC);
	  
	   wire if_id_write_final = if_id_write & (~stall);
	  if_id IF_ID_register(reset,clock, if_id_write_final , flush,inst_code, PC, if_id_pc,id_inst_code,if_id_register_rs1,if_id_register_rs2);
	  
	   stall_unit s(id_ex_rd_sel, rs1_sel, rs2_sel,id_ex_memread,if_id_register_rs1,if_id_register_rs2,id_ex_register_rd,
	    pc_write,if_id_write,control_sel );
	  
	  Decoder decoder_module(op1_float, op2_float, rs1_sel, rs2_sel, clock, id_inst_code,mem_wb_register_rd, output_data1, output_data2, reset, 
									 write_data1, sign_extend, mem_wb_regwrite, mem_wb_regwrite_control_float,rs1,rs2,rd,funct3,funct7,opcode, funct5);
		wire [1:0] float_sel, id_ex_float_sel;

	  control control_module(funct5, funct7,funct3,opcode, control_sel,if_id_alu_control, float, float_sel, 
				 control,enable,rs1_sel, rs2_sel, rd_sel, if_id_regwrite_control_float, if_id_regwrite_control,if_id_memtoreg,if_id_alusrc,if_id_memread,if_id_memwrite,if_id_branch,if_id_branch2,if_id_jump, if_id_branch_instr, if_id_lui);

			  
	  id_ex ID_EX_register(if_id_lui, flush, if_id_branch_instr,rs1_sel, rs2_sel, rd_sel, stall, float_sel, rs1,rs2,rd,output_data1, output_data2, sign_extend, clock,if_id_regwrite_control_float, float, control, if_id_pc,enable,if_id_jump,
			id_ex_output_data1,id_ex_output_data2,id_ex_sign_extend_immediate,
			id_ex_register_rs1,id_ex_register_rs2,id_ex_register_rd,
			id_ex_memtoreg,id_ex_alusrc,id_ex_memread,id_ex_memwrite,id_ex_branch,id_ex_regwrite_control,id_ex_jump,
			id_ex_alu_control,id_ex_pc,id_ex_enable,if_id_branch2,id_ex_branch2, id_ex_regwrite_control_float, id_ex_float, id_ex_float_sel, id_ex_rs1_sel, id_ex_rs2_sel, id_ex_rd_sel, id_ex_branch_instr, id_ex_lui);
			
	  forwarding_unit forwarding_module(ex_mem_regwrite_control_float, mem_wb_regwrite_control_float,id_ex_rs1_sel, id_ex_rs2_sel, ex_mem_rd_sel, mem_wb_rd_sel,id_ex_register_rs1,id_ex_register_rs2,ex_mem_register_rd,
	   mem_wb_register_rd,ex_mem_regwrite,mem_wb_regwrite,
	  ex_mem_memwrite,ex_mem_register_rs2,FWD_RS1,FWD_RS2);
	  wire [31:0] in1_temp;
	  mux3 m1(FWD_RS1,id_ex_output_data1,result_ex_mem,write_data1,in1_temp);
	  assign in1 = id_ex_lui ? 0 : in1_temp;
	  
	  mux3 m2(FWD_RS2,id_ex_output_data2,result_ex_mem,write_data1,alu_mux);	//take alu_mux as the output of second mux3 to feed it to mux just before alu
	  
	  new_mux m3(id_ex_alusrc,alu_mux,id_ex_sign_extend_immediate,in2);
	  
	  adder Adder_module_branch(id_ex_pc, id_ex_sign_extend_immediate, next_address_branch);
	  
	  adder Adder_module(PC, 4, next_address); 
	  
	  execution_unit e(in1,in2, id_ex_enable, id_ex_alu_control, ex_result,zero_flag);
	  

	  assign result = id_ex_float ? fp_result : ex_result;
	  
	  reg jmp_instr;
	  always @(*)
	  begin
	  jmp_instr = 0;
	  if(inst_code[6:0] == 7'b1101111)
	   jmp_instr = 1;
	  end
	        wire ex_mem_br_taken;
	  assign PCsrc = {ex_mem_br_taken, jmp_instr};
	  jmp_addr_calc j1(inst_code, PC, J_addr);
	 
	 MuxPC address_mux( next_address,ex_mem_next_address_branch, J_addr,PCsrc,input_to_ifu);//

	  ex_mem EX_MEM_register(br_taken, ex_mem_br_taken, flush, id_ex_rd_sel, ex_mem_rd_sel, stall, clock, zero_flag, zero_flag_ex_mem,id_ex_register_rs2, ex_mem_register_rs2, id_ex_register_rd, ex_mem_register_rd, result, 
	  result_ex_mem,alu_mux,ex_mem_output_data_2, id_ex_memtoreg,id_ex_regwrite_control,id_ex_memread,id_ex_memwrite,id_ex_branch,
	  ex_mem_memtoreg,ex_mem_regwrite,ex_mem_memread,ex_mem_memwrite,ex_mem_branch,ex_mem_next_address_branch, next_address_branch,
	  id_ex_enable,
	   ex_mem_enable,id_ex_jump,ex_mem_jump,in1,ex_mem_output_data_1,FWD_RS1,FWD_RS2, ex_mem_FWD_RS1, ex_mem_FWD_RS2,
	    id_ex_branch2, ex_mem_branch2, id_ex_regwrite_control_float, ex_mem_regwrite_control_float); //id_ex_output_data2
	  
	  Data_mem Data_memory_module(reset,result_ex_mem, ex_mem_output_data_2, ex_mem_memwrite, ex_mem_memread, clock, wr_o,read_data,wr_en,
	   output1, output2, output3, output4,output5,output6,output7,output8,output9);
	  
	  mem_wb MEM_WB_register(ex_mem_rd_sel, mem_wb_rd_sel, clock, ex_mem_register_rd, mem_wb_register_rd, result_ex_mem, result_mem_wb ,read_data, read_data_mem_wb, ex_mem_memtoreg, ex_mem_regwrite, mem_wb_memtoreg,mem_wb_regwrite, ex_mem_regwrite_control_float, mem_wb_regwrite_control_float);
	  
	  mem_wb_mux Multiplexer_module(ex_mem_FWD_RS2,ex_mem_memwrite,ex_mem_output_data_2,mem_wb_memtoreg, read_data_mem_wb, result_mem_wb,write_data1);
	  
	  Branch_comparator b (id_ex_branch_instr, id_ex_branch, id_ex_branch2, in1,in2,id_ex_alu_control,br_taken);//
	  assign flush = ex_mem_br_taken;
	
	 
endmodule