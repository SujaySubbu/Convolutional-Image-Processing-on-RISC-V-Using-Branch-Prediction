`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.09.2021 11:51:34
// Design Name: 
// Module Name: riscv_test
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


module riscv_test();

reg clock, reset;
wire [31:0] output1,output2,output3;
Processor p1(clock, reset, output1,output2,output3); 
always #5 clock <= ~clock;

initial begin
clock = 0;
reset = 1;

#100
reset = 0;

repeat(50) @(posedge clock);

end

endmodule
