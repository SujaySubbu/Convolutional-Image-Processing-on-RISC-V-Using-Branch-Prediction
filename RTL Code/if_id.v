`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:30:54 03/27/2021 
// Design Name: 
// Module Name:    if_id 
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
module if_id(
	input reset, clk,if_id_write,IF_Flush,
	input wire[31:0]if_Instruction_Code,
	input wire[31:0]if_pc,
	output reg [31:0]id_pc,
	output reg [31:0]id_Instruction_Code,
	output [4:0]if_id_register_rs1,
	output [4:0]if_id_register_rs2);
	assign if_id_register_rs1 = id_Instruction_Code[19:15];
    assign if_id_register_rs2 = id_Instruction_Code[24:20];

always @(posedge clk) begin
    if (reset ==1)
    begin 
    id_Instruction_Code <= 0;
    id_pc <= 0;
    end  
    else 
    if ( IF_Flush ==1) 
    begin
     id_pc<=0;
    id_Instruction_Code <= 32'h0;
    end 
    else if  ( if_id_write ==0) //careful
    begin
    id_pc<=id_pc;
    id_Instruction_Code <= id_Instruction_Code;
	end
	else begin
            id_pc<=if_pc;
			id_Instruction_Code<=if_Instruction_Code;
    end
    
    end
    endmodule
    
    
    
    
    /*    if ( IF_Flush ==1) begin
       // id_pc<=32'b0;
			id_Instruction_Code<=32'b0;
			if_id_register_rs1 <= id_Instruction_Code[19:15];
			if_id_register_rs2 <= id_Instruction_Code[24:20];
			end
		
		else  if(if_id_write == 0 ) begin
			id_pc<=32'b0;
			id_Instruction_Code<=32'b0;
			if_id_register_rs1 <= id_Instruction_Code[19:15];
			if_id_register_rs2 <= id_Instruction_Code[24:20];
		end
		else  
		//if(if_id_write ) 
			 begin
			id_pc=if_pc;
			id_Instruction_Code<=if_Instruction_Code;
			if_id_register_rs1 <= id_Instruction_Code[19:15];
			if_id_register_rs2 <= id_Instruction_Code[24:20];
			end
		/*	else   begin
			id_pc=32'b0;
			id_Instruction_Code<=32'b0;
			if_id_register_rs1 <= id_Instruction_Code[19:15];
			if_id_register_rs2 <= id_Instruction_Code[24:20];
		end  
	end

endmodule */
