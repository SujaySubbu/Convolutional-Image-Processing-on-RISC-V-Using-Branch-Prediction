`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:32:40 04/11/2021 
// Design Name: 
// Module Name:    new_mux 
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
module new_mux(
input alusrc,
input [31:0] output_data2,
input [31:0] imm_val,
output reg [31:0] input_alu
);

always @(*) begin
	if(alusrc == 1)
	input_alu = imm_val;
	else 
	input_alu = output_data2;
end
endmodule
