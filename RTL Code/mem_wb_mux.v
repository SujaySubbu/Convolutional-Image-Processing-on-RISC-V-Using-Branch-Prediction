`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:11:32 04/06/2021 
// Design Name: 
// Module Name:    mem_wb_mux 
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
module mem_wb_mux(

input [1:0]ex_mem_FWD_RS2,
input ex_mem_memwrite,
input [31:0] ex_mem_output_data_2,
input memtoreg,
input [31:0] read_data,
input [31:0] result,
output reg [31:0] write_data1
);

always @(*) begin
	if(memtoreg == 1)
	write_data1 = read_data;
	else
	write_data1 = result;
   
	
end

endmodule
