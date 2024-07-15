`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:20:22 03/27/2021 
// Design Name: 
// Module Name:    Inst_mem_integrated 
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

// This is used to bring together the instruction memory and the immediate value storage unit(constants.v)
module Inst_mem_integrated(input clk,
input reset,
input [31:0] inst_add,
output [31:0] inst_code
);

//wire [11:0] const;
//wire [20:1] const_20;
//wire [31:0] const_32;
wire [31:0]inst_code1;
//constants const_mod(reset, inst_add, const, const_20, const_32);


inst_mem inst_mem_mod(clk,inst_add, reset,  inst_code);
//assign inst_code = inst_code1;

endmodule