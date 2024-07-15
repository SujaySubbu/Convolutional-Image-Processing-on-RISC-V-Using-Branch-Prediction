`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.05.2021 18:59:42
// Design Name: 
// Module Name: Address_select
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


module Address_select(
input [31:0] Instruction_code,
input IF_Flush,
input PC,
output reg [31:0]  J_addr,
output reg [1:0] PCsrc
    );
    wire [19:0] Imm={Instruction_code[31],Instruction_code[19:12],Instruction_code[20],Instruction_code[30:21]};
    wire [19:0] Shft_2=Imm<<2;
    wire [31:0] X={{12{Shft_2[19]}},Shft_2};
    always @(*)
    begin
    if (IF_Flush ==1)
    PCsrc = 2'b10;
    else if (Instruction_code[6:0] == 7'b1101111) begin
    J_addr = X+PC;
    PCsrc = 2'b01;
    end
    else
    PCsrc = 2'b00;
    end
endmodule
