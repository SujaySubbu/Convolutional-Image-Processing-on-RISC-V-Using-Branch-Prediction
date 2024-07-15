`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2021 15:54:13
// Design Name: 
// Module Name: alu
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


module alu(
input [31:0] in1,in2, 
input id_ex_enable,
input[3:0] id_ex_alu_control,

output reg [31:0] alu_result,
    output reg zero_flag
    );
    always @(*)
    
    begin
    
    if(id_ex_enable)
    begin
        // Operating based on control input
        case(id_ex_alu_control)

        4'b0000: alu_result = in1+in2; //add
        4'b0001: alu_result = in1-in2; //sub
        4'b0010: alu_result = in1|in2; //Bitwise OR
        4'b0011: alu_result = in1&in2; //Bitwise AND
        4'b0100: begin 
            if(in1<in2) 					  //set on less than	
            alu_result = 1;
            else
            alu_result = 0;
        end
        4'b0101: alu_result = in1<<in2; //shift left logical
        4'b0110: alu_result = in1>>in2; //shift rigt logical
		  4'b0111: begin 
            if(in1>in2) 					  //set on greater than	
            alu_result = 1;
            else
            alu_result = 0;
        end
        4'b1000: alu_result = in1^in2;  //xor
		  default: alu_result=32'hz;

        endcase

        // Setting Zero_flag if ALU_result is zero
        if (alu_result == 0)
            zero_flag = 1'b1;
        else
            zero_flag = 1'b0;
        
    end
else
begin
alu_result = 32'hz;
zero_flag = 1'bz;
end
end


endmodule

    

