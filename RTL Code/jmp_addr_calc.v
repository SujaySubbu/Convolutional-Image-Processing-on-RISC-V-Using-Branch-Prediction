`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2021 13:57:08
// Design Name: 
// Module Name: jmp_addr_calc
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


module jmp_addr_calc(
    input [31:0] Instruction_code,
    input [31:0] PC,
    output [31:0] J_Addr
    );
    wire [19:0] Imm={Instruction_code[31],Instruction_code[19:12],Instruction_code[20],Instruction_code[30:21]};
    wire [19:0] Shft_2=Imm<<2;
    wire [31:0] X={{12{Shft_2[19]}},Shft_2};
    assign J_Addr = X + PC;
endmodule
