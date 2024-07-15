`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:58:11 04/05/2021 
// Design Name: 
// Module Name:    mux3 
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
module mux3(
input [1:0]sel,
input [31:0]id_ex_output_data1,
input [31:0]ex_forwarding,
input [31:0]mem_forwarding,
output reg [31:0]alu_in

    );
always @(*) begin
	if(sel == 2'b00)
	alu_in = id_ex_output_data1;
	else if(sel == 2'b01)
	alu_in = ex_forwarding;
	else if(sel == 2'b10)
	alu_in= mem_forwarding;
	
end

endmodule