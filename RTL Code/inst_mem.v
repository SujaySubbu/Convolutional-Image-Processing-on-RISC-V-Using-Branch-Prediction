
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:18:15 03/27/2021 
// Design Name: 
// Module Name:    inst_mem 
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
`timescale 1ns / 1ps

module inst_mem(input clk,
    input [31:0]inst_add,
    input reset,
    
    output[31:0] inst_code
);

// byte addressable memory with 32 locations
reg [7:0] Memory [731:0];
//wire [4:0] shamt = imm_val;

// r-type instructions: add, sub, sll, slt, sltu, xor, srl, sra, or, and
always @(posedge clk)
    begin
        if(reset == 1)
        begin
/*
Memory[3]<=8'h00;
Memory[2]<=8'h31;
Memory[1]<=8'h70;
Memory[0]<=8'hd3;
Memory[7]<=8'h10;
Memory[6]<=8'h30;
Memory[5]<=8'hf1;
Memory[4]<=8'h53;
*/      
Memory[3]<=8'h00;
Memory[2]<=8'h40;
Memory[1]<=8'h07;
Memory[0]<=8'h13;
Memory[7]<=8'h0b;
Memory[6]<=8'hc0;
Memory[5]<=8'h24;
Memory[4]<=8'h03;
Memory[11]<=8'h0b;
Memory[10]<=8'h00;
Memory[9]<=8'h24;
Memory[8]<=8'h83;
Memory[15]<=8'h0b;
Memory[14]<=8'h80;
Memory[13]<=8'h29;
Memory[12]<=8'h03;
Memory[19]<=8'h0b;
Memory[18]<=8'h40;
Memory[17]<=8'h29;
Memory[16]<=8'h83;
Memory[23]<=8'h0a;
Memory[22]<=8'hc0;
Memory[21]<=8'h2a;
Memory[20]<=8'h03;
Memory[27]<=8'h00;
Memory[26]<=8'h10;
Memory[25]<=8'h02;
Memory[24]<=8'h93;
Memory[31]<=8'h00;
Memory[30]<=8'h10;
Memory[29]<=8'h03;
Memory[28]<=8'h13;
Memory[35]<=8'h00;
Memory[34]<=8'h03;
Memory[33]<=8'hf3;
Memory[32]<=8'hb3;
Memory[39]<=8'h00;
Memory[38]<=8'h04;
Memory[37]<=8'h74;
Memory[36]<=8'h33;
Memory[43]<=8'h00;
Memory[42]<=8'h0e;
Memory[41]<=8'h7e;
Memory[40]<=8'h33;
Memory[47]<=8'h00;
Memory[46]<=8'h72;
Memory[45]<=8'h8e;
Memory[44]<=8'hb3;
Memory[51]<=8'hff;
Memory[50]<=8'hfe;
Memory[49]<=8'h8e;
Memory[48]<=8'h93;
Memory[55]<=8'h02;
Memory[54]<=8'h9e;
Memory[53]<=8'h8e;
Memory[52]<=8'hb3;
Memory[59]<=8'h01;
Memory[58]<=8'hc3;
Memory[57]<=8'h0f;
Memory[56]<=8'hb3;
Memory[63]<=8'hff;
Memory[62]<=8'hff;
Memory[61]<=8'h8f;
Memory[60]<=8'h93;
Memory[67]<=8'h01;
Memory[66]<=8'hfe;
Memory[65]<=8'h8e;
Memory[64]<=8'hb3;
Memory[71]<=8'h02;
Memory[70]<=8'hee;
Memory[69]<=8'h8e;
Memory[68]<=8'hb3;
Memory[75]<=8'h02;
Memory[74]<=8'h40;
Memory[73]<=8'h0f;
Memory[72]<=8'h13;
Memory[79]<=8'h01;
Memory[78]<=8'hdf;
Memory[77]<=8'h0f;
Memory[76]<=8'h33;
Memory[83]<=8'h02;
Memory[82]<=8'h79;
Memory[81]<=8'h0e;
Memory[80]<=8'hb3;
Memory[87]<=8'h01;
Memory[86]<=8'hce;
Memory[85]<=8'h8e;
Memory[84]<=8'hb3;
Memory[91]<=8'h02;
Memory[90]<=8'hee;
Memory[89]<=8'h8e;
Memory[88]<=8'hb3;
Memory[95]<=8'h00;
Memory[94]<=8'h0f;
Memory[93]<=8'h2f;
Memory[92]<=8'h03;
Memory[99]<=8'h08;
Memory[98]<=8'h80;
Memory[97]<=8'h0f;
Memory[96]<=8'h93;
Memory[103]<=8'h01;
Memory[102]<=8'hfe;
Memory[101]<=8'h8e;
Memory[100]<=8'hb3;
Memory[107]<=8'h00;
Memory[106]<=8'h0e;
Memory[105]<=8'hae;
Memory[104]<=8'h83;
Memory[111]<=8'h00;
Memory[110]<=8'h1e;
Memory[109]<=8'h0e;
Memory[108]<=8'h13;
Memory[115]<=8'h03;
Memory[114]<=8'hdf;
Memory[113]<=8'h0f;
Memory[112]<=8'h33;
Memory[119]<=8'h01;
Memory[118]<=8'he4;
Memory[117]<=8'h04;
Memory[116]<=8'h33;
Memory[123]<=8'hfb;
Memory[122]<=8'h2e;
Memory[121]<=8'h1a;
Memory[120]<=8'he3;
Memory[127]<=8'h00;
Memory[126]<=8'h13;
Memory[125]<=8'h83;
Memory[124]<=8'h93;
Memory[131]<=8'hfb;
Memory[130]<=8'h33;
Memory[129]<=8'h94;
Memory[128]<=8'he3;
Memory[135]<=8'hff;
Memory[134]<=8'he4;
Memory[133]<=8'h8e;
Memory[132]<=8'h93;
Memory[139]<=8'hff;
Memory[138]<=8'hf2;
Memory[137]<=8'h8f;
Memory[136]<=8'h13;
Memory[143]<=8'h03;
Memory[142]<=8'hdf;
Memory[141]<=8'h0f;
Memory[140]<=8'h33;
Memory[147]<=8'hff;
Memory[146]<=8'hf3;
Memory[145]<=8'h0f;
Memory[144]<=8'h93;
Memory[151]<=8'h01;
Memory[150]<=8'hff;
Memory[149]<=8'h0f;
Memory[148]<=8'h33;
Memory[155]<=8'h02;
Memory[154]<=8'hef;
Memory[153]<=8'h0f;
Memory[152]<=8'h33;
Memory[159]<=8'h00;
Memory[158]<=8'h00;
Memory[157]<=8'h0e;
Memory[156]<=8'h93;
Memory[163]<=8'h01;
Memory[162]<=8'hdf;
Memory[161]<=8'h0f;
Memory[160]<=8'h33;
Memory[167]<=8'h00;
Memory[166]<=8'h8f;
Memory[165]<=8'h20;
Memory[164]<=8'h23;
Memory[171]<=8'h00;
Memory[170]<=8'h13;
Memory[169]<=8'h03;
Memory[168]<=8'h13;
Memory[175]<=8'hff;
Memory[174]<=8'hf4;
Memory[173]<=8'h8e;
Memory[172]<=8'h93;
Memory[179]<=8'hf7;
Memory[178]<=8'hd3;
Memory[177]<=8'h18;
Memory[176]<=8'he3;
Memory[183]<=8'h00;
Memory[182]<=8'h12;
Memory[181]<=8'h82;
Memory[180]<=8'h93;
Memory[187]<=8'hff;
Memory[186]<=8'hfa;
Memory[185]<=8'h0f;
Memory[184]<=8'h93;
Memory[191]<=8'hf7;
Memory[190]<=8'hf2;
Memory[189]<=8'h90;
Memory[188]<=8'he3;
Memory[195]<=8'h00;
Memory[194]<=8'h00;
Memory[193]<=8'h03;
Memory[192]<=8'h33;
Memory[199]<=8'h02;
Memory[198]<=8'h80;
Memory[197]<=8'h03;
Memory[196]<=8'h93;
Memory[203]<=8'h0f;
Memory[202]<=8'hf0;
Memory[201]<=8'h0e;
Memory[200]<=8'h93;
Memory[207]<=8'h00;
Memory[206]<=8'h03;
Memory[205]<=8'h22;
Memory[204]<=8'h83;
Memory[211]<=8'h02;
Memory[210]<=8'h02;
Memory[209]<=8'hc0;
Memory[208]<=8'h63;
Memory[215]<=8'h01;
Memory[214]<=8'hd2;
Memory[213]<=8'hc8;
Memory[212]<=8'h63;
Memory[219]<=8'h01;
Memory[218]<=8'hd2;
Memory[217]<=8'h86;
Memory[216]<=8'h63;
Memory[223]<=8'h00;
Memory[222]<=8'h0e;
Memory[221]<=8'h8e;
Memory[220]<=8'h33;
Memory[227]<=8'h01;
Memory[226]<=8'hc3;
Memory[225]<=8'h20;
Memory[224]<=8'h23;
Memory[231]<=8'h00;
Memory[230]<=8'h43;
Memory[229]<=8'h03;
Memory[228]<=8'h13;
Memory[235]<=8'hfe;
Memory[234]<=8'h73;
Memory[233]<=8'h12;
Memory[232]<=8'he3;
Memory[239]<=8'h00;
Memory[238]<=8'h00;
Memory[237]<=8'h06;
Memory[236]<=8'h63;
Memory[243]<=8'h00;
Memory[242]<=8'h03;
Memory[241]<=8'h20;
Memory[240]<=8'h23;
Memory[247]<=8'hfc;
Memory[246]<=8'h00;
Memory[245]<=8'h0c;
Memory[244]<=8'he3;



/*
                    Memory[3] = 8'h00;
                    Memory[2] = 8'h10;
                    Memory[1] = 8'h03;
                    Memory[0] = 8'h13;
                    
                    Memory[7] = 8'h00;
                    Memory[6] = 8'h50;
                    Memory[5] = 8'h03;
                    Memory[4] = 8'h93;                   

                    Memory[11] = 8'h00;
                    Memory[10] = 8'h40;
                    Memory[9] = 8'h0e;
                    Memory[8] = 8'h13;

                    Memory[15] = 8'hff;
                    Memory[14] = 8'hf3;
                    Memory[13] = 8'h83;
                    Memory[12] = 8'h93;

                    Memory[19] = 8'h02;
                    Memory[18] = 8'h63;
                    Memory[17] = 8'h03;
                    Memory[16] = 8'h33;
                    
                    Memory[23] = 8'h01;
                    Memory[22] = 8'hc3;
                    Memory[21] = 8'h03;
                    Memory[20] = 8'h33;
                    
                    Memory[27] = 8'hfe;
                    Memory[26] = 8'h03;
                    Memory[25] = 8'h9a;
                    Memory[24] = 8'he3;

                    Memory[31] = 8'hfe;
                    Memory[30] = 8'h6e;
                    Memory[29] = 8'h4c;
                    Memory[28] = 8'he3;
*/                    
/*                    
                    Memory[3] = 8'h00;
                    Memory[2] = 8'h31;
                    Memory[1] = 8'h70;
                    Memory[0] = 8'hd3;
                    
                    Memory[7] = 8'h03;
                    Memory[6] = 8'hc3;
                    Memory[5] = 8'h03;
                    Memory[4] = 8'hb3;
                    
                    Memory[11] = 8'h00;
                    Memory[10] = 8'h73;
                    Memory[9] = 8'h0e;
                    Memory[8] = 8'h33;

                    Memory[15] = 8'h10;
                    Memory[14] = 8'h30;
                    Memory[13] = 8'hf1;
                    Memory[12] = 8'h53;
                    
                    Memory[19] = 8'h18;
                    Memory[18] = 8'h11;
                    Memory[17] = 8'h71;
                    Memory[16] = 8'hd3;
                    
                    Memory[23] = 8'h00;
                    Memory[22] = 8'h25;
                    Memory[21] = 8'h20;
                    Memory[20] = 8'h27;
                    
                    Memory[27] = 8'h00;
                    Memory[26] = 8'h05;
                    Memory[25] = 8'h21;
                    Memory[24] = 8'h87;   

                    Memory[31] = 8'h00;
                    Memory[30] = 8'h00;
                    Memory[29] = 8'h00;
                    Memory[28] = 8'h13;

                    Memory[35] = 8'h00;
                    Memory[34] = 8'h31;
                    Memory[33] = 8'h70;
                    Memory[32] = 8'hd3;                       
*/                                                                                      
/*        
        Memory[7] = 8'h40;
        Memory[6] = 8'h6e;
        Memory[5] = 8'h8f;
        Memory[4] = 8'h33;
        
        Memory[11] = 8'h00;
        Memory[10] = 8'h53;
        Memory[9] = 8'h03;
        Memory[8] = 8'hb3;
*/        
/*                    Memory[3] = 8'h00;    //multiply rs1 and rs2 and result rs5
                    Memory[2] = 8'h04;
                    Memory[1] = 8'ha2;
                    Memory[0] = 8'h83;
                    
                    Memory[7] = 8'h01;
                    Memory[6] = 8'hc3;
                    Memory[5] = 8'h83;
                    Memory[4] = 8'h33;
                    
                    Memory[11] = 8'hfe;
                    Memory[10] = 8'h63;
                    Memory[9] = 8'h0c;
                    Memory[8] = 8'he3;
  */                  
        
        
/*        
                    Memory[3] = 8'h00;    //multiply rs1 and rs2 and result rs5
                    Memory[2] = 8'h04;
                    Memory[1] = 8'ha2;
                    Memory[0] = 8'h83;
                    
                    Memory[7] = 8'h01;
                    Memory[6] = 8'hc3;
                    Memory[5] = 8'h83;
                    Memory[4] = 8'h33;
                    
                    Memory[11] = 8'h02;
                    Memory[10] = 8'h62;
                    Memory[9] = 8'h83;
                    Memory[8] = 8'hb3;

                    Memory[15] = 8'h02;
                    Memory[14] = 8'h53;
                    Memory[13] = 8'h0e;
                    Memory[12] = 8'h33;
*/                
/*                    


                    Memory[11] = 8'h02;
                    Memory[10] = 8'h53;
                    Memory[9] = 8'h0e;
                    Memory[8] = 8'h33;
                    
                    Memory[15] = 8'h01;
                    Memory[14] = 8'hc4;
                    Memory[13] = 8'ha0;
                    Memory[12] = 8'h23;  
*/                                      
/*                  Memory[7] = 8'h02;
                    Memory[6] = 8'h72;
                    Memory[5] = 8'h83;
                    Memory[4] = 8'h33; 
                    
                    Memory[7] = 8'h00;
                    Memory[6] = 8'h54;
                    Memory[5] = 8'ha0;
                    Memory[4] = 8'h23; 
*/            			
                end
            end
            
            assign inst_code = {Memory[inst_add+3], Memory[inst_add+2], Memory[inst_add+1], Memory[inst_add]};
 /*always @(*)
                begin
                 //extend[20:1] <= {{8{imm_val[11]}},imm_val[11:0]}; 
                 if(reset)
                 inst_code=32'h00;
                 else begin
                    case(inst_add)
                      // R-type instructions
                       0: inst_code = {Memory[inst_add+3], Memory[inst_add+2], Memory[inst_add+1], Memory[inst_add]};
                    4: inst_code = {Memory[inst_add+3], Memory[inst_add+2], Memory[inst_add+1], Memory[inst_add]};
                    8: inst_code = {Memory[inst_add+3], Memory[inst_add+2], Memory[inst_add+1], Memory[inst_add]};
                
             12: inst_code = {Memory[inst_add+3], Memory[inst_add+2], Memory[inst_add+1], Memory[inst_add]};
                    16: inst_code = {Memory[inst_add+3], Memory[inst_add+2], Memory[inst_add+1], Memory[inst_add]};
                    20: inst_code = {Memory[inst_add+3], Memory[inst_add+2], Memory[inst_add+1], Memory[inst_add]}; 
                24: inst_code = {Memory[inst_add+3], Memory[inst_add+2], Memory[inst_add+1], Memory[inst_add]};
                        28: inst_code = {Memory[inst_add+3], Memory[inst_add+2], Memory[inst_add+1], Memory[inst_add]};
                    32: inst_code = {Memory[inst_add+3], Memory[inst_add+2], Memory[inst_add+1], Memory[inst_add]};
                        36: inst_code = {Memory[inst_add+3], Memory[inst_add+2], Memory[inst_add+1], Memory[inst_add]}; 
                        default: inst_code=32'h0;
                          endcase
                                end
                           end       
*/                      
                      endmodule                   
                   
                // Setting 32-bit instruction: addi s0,zero,10
                   /* Memory[3] = 8'h00;
                    Memory[2] = 8'hA0;
                    Memory[1] = 8'h04;
                    Memory[0] = 8'h13;
        Memory[3] = 8'h00;
            Memory[2] = 8'hA0;
            Memory[1] = 8'h04;
            Memory[0] = 8'h13;
            
             Memory[7] = 8'h00;
            Memory[6] = 8'h04;
            Memory[5] = 8'h10;
            Memory[4] = 8'h63; 
        // Setting 32-bit instruction: addi s0,zero,10
            Memory[3] = 8'h00;
            Memory[2] = 8'hA0;
            Memory[1] = 8'h04;
            Memory[0] = 8'h13; 
          // Setting 32-bit instruction: addi s1,s1,1
            Memory[7] = 8'h00;
            Memory[6] = 8'h14;
            Memory[5] = 8'h84;
            Memory[4] = 8'h93;
           // Setting 32-bit instruction : lw t0, 0(s1)
            Memory[11] = 8'h00;
            Memory[10] = 8'h04;
            Memory[9] = 8'ha2;
            Memory[8] = 8'h83;
            // beq s0,zero,exit
            Memory[15] = 8'h00;
            Memory[14] = 8'h80;
            Memory[13] = 8'h06;
            Memory[12] = 8'h63; 
            // addi t0,t0,5
            Memory[19] = 8'h00;
				Memory[18] = 8'h52;
				Memory[17] = 8'h82;
				Memory[16] = 8'h93;
				//sw t0,0(s1)
				Memory[23] = 8'h00;
            Memory[22] = 8'h54;
            Memory[21] = 8'ha0;
            Memory[20] = 8'h23;
			
      // Setting 32-bit instruction:  addi, s1,s1,1
            Memory[27] = 8'h00;
            Memory[26] = 8'h14;
            Memory[25] = 8'h84;
            Memory[24] = 8'h93; 
            //addi s0,s0,-1
				Memory[31] = 8'hff;
				Memory[30] = 8'hf4;
				Memory[29] = 8'h04;
				Memory[28] = 8'h13;
				//bne zero,s0,loop
				Memory[35] = 8'hfe;
				Memory[34] = 8'h04;
				Memory[33] = 8'h1a;
				Memory[32] = 8'he3;
				//beq s0,s0,exit
				Memory[39] = 8'h04;
				Memory[38] = 8'h84;
				Memory[37] = 8'h04;
				Memory[36] = 8'h63;
				
				//end of program 
          // Setting 32-bit instruction: 13: addi t0,t0,5
            Memory[19] = 8'h00;
            Memory[18] = 8'h52;
            Memory[17] = 8'h82;
            Memory[16] = 8'h93;  
           // Setting 32-bit instruction: 15: sw t0,0(s1)
            Memory[19] = 8'h00;
            Memory[18] = 8'h54;
            Memory[17] = 8'ha0;
            Memory[16] = 8'h23;
           
			                  // 16 addi s1,s1,1
				Memory[23] = 8'h00;
            Memory[22] = 8'h14;
            Memory[21] = 8'ha4;
            Memory[20] = 8'h93;
            // 17 addi s0,s0,-1
            Memory[31] = 8'hff;
            Memory[30] = 8'hf4;
            Memory[29] = 8'h04;
            Memory[28] = 8'h13;
	    // 18 bne zero,s0,loop
				Memory[35] = 8'h00;
				Memory[34] = 8'h80;
				Memory[33] = 8'h18;
				Memory[32] = 8'h63;
				//19 exit : beq s0,s0,exit
				Memory[15] = 8'h00;
				Memory[14] = 8'h84;
				Memory[13] = 8'h0c;
				Memory[12] = 8'h63;
				//21 bne zero,s0,loop
				Memory[43] = 8'hfe;
				Memory[42] = 8'h80;
				Memory[41] = 8'h14;
				Memory[40] = 8'he3;
				// 22 exit:ecall
				Memory[47] = 8'h00;
				Memory[46] = 8'h00;
				Memory[45] = 8'h00;
				Memory[44] = 8'h73; */ 
				

	
	
    // making instruction code
    
			/* 40: inst_code = {Memory[inst_add+3], Memory[inst_add+2], Memory[inst_add+1], Memory[inst_add]};
			44: inst_code = {Memory[inst_add+3], Memory[inst_add+2], Memory[inst_add+1], Memory[inst_add]}; 
			//48: inst_code = {Memory[inst_add+3], Memory[inst_add+2], Memory[inst_add+1], Memory[inst_add]};
			//52: inst_code = {Memory[inst_add+3], Memory[inst_add+2], Memory[inst_add+1], Memory[inst_add]}; */
			
			
		
	/*	//I-type instructions
			  140: inst_code = {imm_val,5'b01000,3'b000,5'b00101,7'b0010011}; //addi t0, s0, imm 
			  144: inst_code = {imm_val,5'b00101,3'b010,5'b00110,7'b0010011}; //slti t1, s1, imm
			  148: inst_code = {imm_val,5'b10010,3'b011,5'b00111,7'b0010011}; //sltiu t2, s2, imm 
			  152: inst_code = {imm_val,5'b10011,3'b100,5'b11100,7'b0010011}; //ori t3, s3, imm
			  56: inst_code = {imm_val,5'b10100,3'b110,5'b11101,7'b0010011}; //xori t4, s4, imm
			  60: inst_code = {imm_val,5'b10101,3'b111,5'b11110,7'b0010011}; //andi t5, s5, imm
			  64: inst_code = {7'b0000000,shamt,5'b01010,3'b001,5'b10111,7'b0010011}; //slli s7, a0
			  68: inst_code = {7'b0000000,shamt,5'b01011,3'b101,5'b11000,7'b0010011}; //srli s8, a1
			  72: inst_code = {7'b0100000,shamt,5'b01100,3'b101,5'b11001,7'b0010011}; //srai s9, a2
			  
			  
			 76: inst_code = {imm_val[11:5],5'b00101,5'b00100,3'b010,imm_val[4:0],7'b0100011}; //sw t0, s3, imm = 12
			  80: inst_code = {imm_val,5'b00100,3'b010,5'b00110,7'b0000011}; // lw t1, s3, imm = 12
			
			
			  84: inst_code = {imm_val[11],imm_val[10:5],5'b00110,5'b00101,3'b001,imm_val[4:1],imm_val[11],7'b1100011}; //bne t1,s1,imm  */
/*			  
			//S-type instructions
			  76: inst_code = {imm_val[11:5],5'b11100,5'b10011,3'b010,imm_val[4:0],7'b0100011};//sw s3, t3, imm
			  80: inst_code = {imm_val[11:5],5'b11100,5'b10011,3'b001,imm_val[4:0],7'b0100011}; //sh s3, t3, imm
			  84: inst_code = {imm_val[11:5],5'b11100,5'b10011,3'b000,imm_val[4:0],7'b0100011}; //sb s3, t3, imm */
			
		/*	//Jump instructions
			  88: inst_code = {imm_val, 5'b00111, 3'b000, 5'b10010, 7'b1100111}; //jalr t2, s2, imm
			  92: inst_code = {imm_20[20],imm_20[10:1],imm_20[11],imm_20[19:12],5'b00111,7'b1101111}; //jal t2, imm */
			
		/*	//Load instructions
			  96: inst_code = {imm_val,5'b00101,3'b000,5'b00100,7'b0000011}; // lb 
			  100: inst_code = {imm_val,5'b00101,3'b001,5'b00100,7'b0000011}; // lh
			  104: inst_code = {imm_val,5'b00101,3'b010,5'b00100,7'b0000011}; // lw
			  108: inst_code = {imm_val,5'b00101,3'b100,5'b00100,7'b0000011}; // lbu
			  112: inst_code = {imm_val,5'b00101,3'b101,5'b00100,7'b0000011}; // lhu */
			
			// branch instructions
			  //0: inst_code = {imm_val[11],imm_val[9:4],5'b00110,5'b00101,3'b000,imm_val[3:0],imm_val[10],7'b1100011}; //beq t1,s1,imm
			 // 120: inst_code = {imm_val[11],imm_val[9:4],5'b00110,5'b00101,3'b001,imm_val[3:0],imm_val[10],7'b1100011}; //bne t1,s1,imm
			//  124: inst_code = {imm_val[11],imm_val[9:4],5'b00110,5'b00101,3'b010,imm_val[3:0],imm_val[10],7'b1100011}; //blt t1,s1,imm
   		//  128: inst_code = {imm_val[11],imm_val[9:4],5'b00110,5'b00101,3'b100,imm_val[3:0],imm_val[10],7'b1100011}; //bge t1,s1,imm
			//  132: inst_code = {imm_val[11],imm_val[9:4],5'b00110,5'b00101,3'b101,imm_val[3:0],imm_val[10],7'b1100011}; //bltu t1,s1,imm
			//  136: inst_code = {imm_val[11],imm_val[9:4],5'b00110,5'b00101,3'b110,imm_val[3:0],imm_val[10],7'b1100011}; //bgeu t1,s1,imm
			
		/*	// U-type instructions
			  140: inst_code = {imm_32[31:12],5'b00111,7'b0110111}; //lui t2, imm
			  144: inst_code = {imm_32[31:12],5'b00111,7'b0010111}; //auipc t2, imm
	*/
				
		
