`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:22:31 03/27/2021 
// Design Name: 
// Module Name:    address_fetch 
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
module address_fetch(
    input [31:0] next_pc,
    output reg [31:0] inst_address,
    input clock,
    input reset
    );	 
	// integer check = 0;
	 
	 always @(posedge clock)
	 begin
		if(reset == 1)
			begin
			inst_address = -4;
			
			end
			
		// branch instructions
		/*
		else if(inst_code[6:0] == 7'b1100011 && check == 1)
		begin
			if(inst_code[31] == 1)
			inst_address = inst_address - {inst_code[7]+inst_code[30:25]+inst_code[12:8]};
			else
			inst_address = inst_address + {inst_code[7]+inst_code[30:25]+inst_code[12:8]};
		end
		*/
		
	/*	else if(check <= 4 && check !=0) begin
		inst_address = inst_address + 4;
		check = check+1;
		end  */
		else
		inst_address = next_pc;
end
endmodule
