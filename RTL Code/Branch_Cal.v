`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.05.2021 18:52:23
// Design Name: 
// Module Name: Branch_Cal
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


module Branch_Cal(
input [31:0] if_id_PC,
input [31:0] sign_extend,
output reg [31:0] B_addr
    );
 always @(*)
 begin
 B_addr= if_id_PC+sign_extend;
 end
endmodule
