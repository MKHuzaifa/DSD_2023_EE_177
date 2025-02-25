`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2025 07:26:36 PM
// Design Name: 
// Module Name: exp_5B
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


module exp_5B(
input logic [3:0] num,
input logic [2:0] sel,
output logic [6:0] segment,
output logic [7:0] anode
 );
   always @(*) begin
   case (num)
   4'h0 : segment = 7'b0000001;
   4'h1 : segment = 7'b1001111;
   4'h2 : segment = 7'b0010010;
   4'h3 : segment = 7'b0001100;
   4'h4 : segment = 7'b1001100;
   4'h5 : segment = 7'b0100100;
   4'h6 : segment = 7'b0100000;
   4'h7 : segment = 7'b0001111;
   4'h8 : segment = 7'b0000000;
   4'h9 : segment = 7'b0000100;
   4'hA : segment = 7'b0001000;
   4'hB : segment = 7'b1100000;
   4'hC : segment = 7'b0110001;
   4'hD : segment = 7'b1000010;
   4'hE : segment = 7'b0110000;
   4'hF : segment = 7'b0111000;
   default: segment = 7'b1111111;
   endcase 
   end
   
   always @(*) begin
   case (sel)
   3'b000 : anode = 8'b11111110;
   3'b001 : anode = 8'b11111101;
   3'b010 : anode = 8'b11111011;
   3'b011 : anode = 8'b11110111;
   3'b100 : anode = 8'b11101111;
   3'b101 : anode = 8'b11011111;
   3'b110 : anode = 8'b10111111;
   3'b111 : anode = 8'b01111111;
   default : anode = 8'b11111111;
   endcase
   end
  
   endmodule
