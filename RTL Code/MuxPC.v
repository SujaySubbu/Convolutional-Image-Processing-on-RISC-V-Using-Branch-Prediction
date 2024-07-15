`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.05.2021 19:09:45
// Design Name: 
// Module Name: MuxPC
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


module MuxPC(
input [31:0] next_address,
input [31:0] B_addr,
input [31:0] J_addr,
input [1:0] PCsrc,
output reg [31:0] input_to_ifu
    );
    always @(*)
    begin
    case (PCsrc)
    2'b00 : input_to_ifu = next_address;
    2'b01 : input_to_ifu = J_addr;
    2'b10 : input_to_ifu = B_addr;
    default: input_to_ifu = next_address;
    endcase
    end
endmodule
