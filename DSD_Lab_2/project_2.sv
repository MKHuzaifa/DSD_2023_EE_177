`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2025 06:56:19 PM
// Design Name: 
// Module Name: project_2
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
module project_2( output x,y , 
      input a,s,d );
 logic not_c,or_1,nand_ad,xor_1; 
assign not_d = ~d;
assign or_1 = a|s;
assign nand_ad = ~(a&d);
assign xor_1 = (or_1 ^ nand_ad);
assign y = (or_1 & xor_1);
assign x =(not_d ^ or_1);
endmodule
