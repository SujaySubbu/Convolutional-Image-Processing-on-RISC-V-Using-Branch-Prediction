`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.05.2021 18:20:31
// Design Name: 
// Module Name: Branch_comparator
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


module Branch_comparator(
input wire id_ex_branch_instr, id_ex_branch, id_ex_branch2,
input [31:0] Read_Data1,
input [31:0] Read_Data2,
input [3:0] id_ex_alu_control,
output reg br_taken
    );
    always@(*)
    begin
    if ((Read_Data1 == Read_Data2) && id_ex_branch_instr && (id_ex_alu_control == 4'b0001) && id_ex_branch)
        br_taken =1;
    else if  ((Read_Data1 != Read_Data2) && id_ex_branch_instr && (id_ex_alu_control == 4'b0001) && id_ex_branch2)
        br_taken =1;
    else if  ((Read_Data1 < Read_Data2) && id_ex_branch_instr && (id_ex_alu_control == 4'b0100))
        br_taken =1;
    else
        br_taken =0;    
    end
endmodule
