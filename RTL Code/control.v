`timescale 1ns / 1ps

module control(
    input [4:0] funct5,
    input [6:0] funct7,
    input [2:0] funct3,
    input [6:0] opcode,
    input control_sel,
	 //input [11:0] immI,
    output reg [3:0] if_id_alu_control,
    output reg float,
    output reg [1:0] float_sel,
	 output [10:0]control,
	 output reg enable, fs1_sel, fs2_sel,fd_sel,
	 output reg if_id_regwrite_control_float,
    output reg if_id_regwrite_control,if_id_memtoreg,if_id_alusrc,if_id_memread,if_id_memwrite,if_id_branch,if_id_branch2,if_id_jump,
    output reg if_id_branch_instr, if_id_lui
    );
	 
always @(*)
    begin
   
     if(control_sel==0)
    begin
                if_id_regwrite_control = 0;
                if_id_regwrite_control_float = 0;
                if_id_memtoreg=0;
				if_id_alusrc=0;
				if_id_memread=0;
				if_id_memwrite=0;
				if_id_branch=0;
				if_id_branch2=0;
				if_id_alu_control =0;
				float = 0;
				enable=0;
				fs1_sel = 0;
				fs2_sel = 0;
				float_sel = 0;
				fd_sel = 0;
				if_id_branch_instr = 0;
				if_id_lui = 0;
    end
    
    else if(control_sel)
    begin
        if_id_regwrite_control = 0;
        if_id_regwrite_control_float = 0;
        if_id_memtoreg=0;
        if_id_alusrc=0;
        if_id_memread=0;
        if_id_memwrite=0;
        if_id_branch=0;
        if_id_branch2=0;
        if_id_branch_instr = 0;
         enable =0;
         float = 0;
         fs1_sel = 0;
         fs2_sel = 0;
         if_id_alu_control = 4'd0;
         float_sel = 0;
         fd_sel = 0;
         if_id_lui = 0;
        if (opcode == 7'b0110011 && funct7 == 7'b0000001 ) // M instructions
            begin
            if_id_regwrite_control = 1;
				if_id_memtoreg=0;
				if_id_alusrc=0;
				if_id_memread=0;
				if_id_memwrite=0;
				if_id_branch=0;
				if_id_branch2=0;
                 enable =0;
				      
				      if(funct3 ==3'b000)
                         if_id_alu_control = 4'b0000; // MUL
                      else if(funct3 == 3'b001)
                         if_id_alu_control = 4'b0001; // MULH
                      else if(funct3 == 3'b010)
                        if_id_alu_control = 4'b0010; // MULHSU
                      else if(funct3 == 3'b011)
                         if_id_alu_control = 4'b0011; // MULHU
                      else if(funct3 == 3'b100)
                         if_id_alu_control = 4'b0100; // DIV
                      else if(funct3 == 3'b101)
                         if_id_alu_control = 4'b0101; // DIVU
                       else if(funct3 == 3'b110)
                         if_id_alu_control = 4'b0110; // REM
                        else if(funct3 == 3'b111)
                         if_id_alu_control = 4'b0111; // REMU
			  end
		
		 if (opcode == 7'b0110011 && funct7 != 7'b0000001) begin // R-type instructions
             
		     enable=1;
            if_id_regwrite_control = 1;
				if_id_memtoreg=0;
				if_id_alusrc=0;
				if_id_memread=0;
				if_id_memwrite=0;
				if_id_branch=0;	    
				if_id_branch2=0;
				if_id_jump =0;  
				
            case (funct3)
                0: begin
                    if(funct7 == 0)
                    if_id_alu_control = 4'b0000; // ADD
                    else if(funct7 == 32)
                    if_id_alu_control = 4'b0001; // SUB
                end
                6: if_id_alu_control = 4'b0010; // OR
                7: if_id_alu_control = 4'b0011; // AND
                1: if_id_alu_control = 4'b0101; // SLL
                5: begin 
							if(funct7==0)
							if_id_alu_control = 4'b0110; // SRL
							else if(funct7==32)
							if_id_alu_control = 4'b0110	;  //SRA
					    end
				2: if_id_alu_control = 4'b0100; // SLT
				3: if_id_alu_control = 4'b0100; // SLTU
				4: if_id_alu_control = 4'b1000; // XOR
				default: if_id_alu_control=4'b1111;
            endcase
			end
			
			if (opcode==7'b0010011) begin //I-type instructions
				 
		     enable=1;
				if_id_regwrite_control=1;
				if_id_memtoreg=0;
				if_id_alusrc=1;
				if_id_memread=0;
				if_id_memwrite=0;
				if_id_branch=0;
				if_id_branch2=0;
				if_id_jump =0;
				
				case (funct3)
					0: if_id_alu_control = 4'b0000; // ADDI
					2: if_id_alu_control = 4'b0100; // STLI
					3: if_id_alu_control = 4'b0100; // STLIU
					4: if_id_alu_control = 4'b1000; // XORI
					6: if_id_alu_control = 4'b0010; // ORI
					7: if_id_alu_control = 4'b0011; // ANDI
					1: if_id_alu_control = 4'b0101; // SLLI
					5: begin
						if (funct7==0)
						if_id_alu_control = 4'b0110; // SRLI 
					   else if (funct7==32)
						if_id_alu_control = 4'b0110; // SRAI
						end
					default: if_id_alu_control=4'b1111;
				endcase
         end
			
			if (opcode==7'b0000011) begin // Load - Instructions
		      
		     enable=1;
				if_id_regwrite_control=1;	
				if_id_memtoreg=1;
				if_id_alusrc=1;
				if_id_memread=1;
				if_id_memwrite=0;
				if_id_branch=0;
				if_id_branch2=0;
				if_id_jump=0;
				if_id_alu_control = 4'b0000; //load
					
			end
			
			if (opcode==7'b0100011) begin // STORE - Instructions
				
		    enable=1;
				if_id_regwrite_control=0;
				if_id_memtoreg=1'bx;
				if_id_alusrc=1;
				if_id_memread=0;
				if_id_memwrite=1;
				if_id_branch=0;
				if_id_branch2=0;
				if_id_jump=0;
				if_id_alu_control = 4'b0000; // store
					
			end
			
			if (opcode==7'b1100011) begin // B - Instructions
			if_id_branch_instr = 1;	
		     enable=1;
				if_id_regwrite_control=0;
				if_id_memtoreg=1'b0;
				if_id_alusrc=0;
				if_id_memread=0;
				if_id_memwrite=0;
			//	if_id_branch=1;
				if_id_jump=0;
				
				case (funct3)
					0: begin if_id_alu_control = 4'b0001; if_id_branch=1;  if_id_branch2=0; end // beq
					
					1: begin if_id_alu_control = 4'b0001; if_id_branch=0;if_id_branch2=1; end // bne
					4: if_id_alu_control = 4'b0100; // blt
					5: if_id_alu_control = 4'b0111; // bge
					6: if_id_alu_control = 4'b0100; // bltu
					7: if_id_alu_control = 4'b0111; // bgeu
					default: if_id_alu_control=4'b1111;
				endcase
			end
			
			if (opcode==7'b1001111)begin
			     
		     enable=1;
				if_id_regwrite_control=1;
				if_id_memtoreg=1'bx;
				if_id_alusrc=1;
				if_id_memread=1;
				if_id_memwrite=0;
				if_id_branch=0;
				if_id_branch2=0;
				if_id_jump=1;
				if_id_alu_control = 4'b0000; // jalr 
				end
			if (opcode==7'b1101111) begin
			    
		     enable=1;
				if_id_regwrite_control=1;
				if_id_memtoreg=1'bx;
				if_id_alusrc=1;
				if_id_memread=1;
				if_id_memwrite=0;
				if_id_branch=0;
				if_id_branch2=0;
				if_id_jump=1;
				if_id_alu_control = 4'b0000; // jal
				end
			if (opcode==7'b0110111) begin
				if_id_lui = 1;
			    enable=1;
				if_id_regwrite_control=1;
				if_id_memtoreg=0;
				if_id_alusrc=1;
				if_id_memread=0;
				if_id_memwrite=0;
				if_id_branch=0;
				if_id_branch2=0;
				if_id_jump =0;
				if_id_alu_control = 4'b0000;
				// lui
				end
			if (opcode==7'b0010111) begin
			    
		     enable=1;
				if_id_regwrite_control=1;
				if_id_memtoreg=1'bx;
				if_id_alusrc=1;
				if_id_memread=1;
				if_id_memwrite=0;
				if_id_branch=0;
				if_id_branch2=0;
				if_id_jump=0;
				if_id_alu_control = 4'b0000; // auipc
				end
				if (opcode==7'b1110011) begin
			    
		     enable=1;
				if_id_regwrite_control=0;
				if_id_memtoreg=1'b0;
				if_id_alusrc=0;
				if_id_memread=0;
				if_id_memwrite=0;
				if_id_branch=0;
				if_id_jump=0;
				if_id_branch2=0;
				if_id_alu_control = 4'b0000; // ecall
				end
				
		      if (opcode== 7'b0000111) begin //flw
		          fs1_sel = 0; //rs1 coming from int file
		          fs2_sel = 0; //rs2 not needed
		          float = 0;
                 enable=1;
				if_id_regwrite_control=0;	
				if_id_regwrite_control_float=1;	
				if_id_memtoreg=1;
				if_id_alusrc=1;
				if_id_memread=1;
				if_id_memwrite=0;
				if_id_branch=0;
				if_id_branch2=0;
				if_id_jump=0;
				if_id_alu_control = 4'b0000; //load
				float_sel = 2'b00;
				fd_sel = 1;
		      end
		      
		      if (opcode==7'b0100111) begin //fsw
		        fs1_sel = 0;//rs1 coming from int
		        fs2_sel = 1; //rs2 coming from float
		        float = 0;
		        enable=1;
				if_id_regwrite_control=0;
				if_id_regwrite_control_float= 0;
				if_id_memtoreg=1'bx;
				if_id_alusrc=1;
				if_id_memread=0;
				if_id_memwrite=1;
				if_id_branch=0;
				if_id_branch2=0;
				if_id_jump=0;
				if_id_alu_control = 4'b0000; // store
				float_sel = 2'b00;
				fd_sel = 0;
		      end
		      
		      if(opcode== 7'b1010011) begin //fadd,fsub,fmul,fdiv
		          fs1_sel = 1;
		          fs2_sel = 1; //both coming from float file
		          		     enable=0;
            if_id_regwrite_control = 0;
            if_id_regwrite_control_float = 1;
            float = 1;
            fd_sel = 1;
				if_id_memtoreg=0;
				if_id_alusrc=0;
				if_id_memread=0;
				if_id_memwrite=0;
				if_id_branch=0;	    
				if_id_branch2=0;
				if_id_jump =0;
			    if(funct5 == 5'b00000) begin
			     float_sel = 2'b00;
			    end
			    else if(funct5 == 5'b00001) begin
			     float_sel = 2'b01;
			    end 
			    else if(funct5 == 5'b00010) begin
			     float_sel = 2'b10;
			    end
			    else if(funct5 == 5'b00011) begin
			     float_sel = 2'b11;
			    end
			    else begin
			     float_sel = 2'bxx;
			    end 	
		      end
    end
 end  
//end
assign control={enable,if_id_regwrite_control,if_id_alu_control,if_id_alusrc,if_id_memread,if_id_memwrite,if_id_branch,if_id_memtoreg};//9,{8,7,6,5},4,3,2,1,0

endmodule