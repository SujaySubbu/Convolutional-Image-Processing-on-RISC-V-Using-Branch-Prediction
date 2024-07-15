`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2021 15:48:55
// Design Name: 
// Module Name: execution_unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module execution_unit(input [31:0] in1,in2, 
input id_ex_enable,
input[3:0] id_ex_alu_control,

output  [31:0] result,
    output  zero_flag
    );
    wire [31:0] alu_result;
    wire [31:0] mul_result;
  execute e2(in1,in2,id_ex_enable,id_ex_alu_control,alu_result,mul_result,zero_flag);
  execute_mux m11( alu_result, mul_result, id_ex_enable, result);
   
endmodule

module execute_mux(input [31:0] alu_result,
input [31:0] mul_result,
input id_ex_enable,
output reg [31:0] result);

always @(*) begin
	if(id_ex_enable == 1)
	result= alu_result;
	else if(id_ex_enable == 0)
	result = mul_result;
	end
endmodule
