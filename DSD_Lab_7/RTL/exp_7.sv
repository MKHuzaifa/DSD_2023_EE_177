`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2025 10:14:52 PM
// Design Name: 
// Module Name: exp_7
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

module exp_7 (
    input logic clk, reset, write, 
    input logic [2:0] sel, 
    input logic [3:0] num, 
    output logic [6:0] seg,
    output logic [7:0] anode
);
logic slow_clk;
logic [19:0]count;
always_ff @(posedge clk or posedge reset) begin
     if (reset)
         count <= 0;
     else
         count = count + 1;
end


always_ff @(posedge clk or posedge reset) begin
    if (reset)
        slow_clk <= 0;
    else
        slow_clk <= count[19];
end


logic [2:0] dis_sel;
always_ff @(posedge slow_clk or posedge reset) begin
     if (reset)
         dis_sel <= 3'b000;
     else
         dis_sel = dis_sel + 1;
end


assign anode = ~(8'b00000001 << dis_sel);


logic [3:0] mem [7:0];
always_ff @(posedge clk or posedge reset) begin
    if (reset)
        mem <= '{default:4'b0000}; 
    else if (write)
        mem[sel] <= num;  
end


/* always_comb begin
    anode = 8'b11111111;
    case (sel)
        3'b000: anode = 8'b11111110; 
        3'b001: anode = 8'b11111101; 
        3'b010: anode = 8'b11111011;
        3'b011: anode = 8'b11110111; 
        3'b100: anode = 8'b11101111; 
        3'b101: anode = 8'b11011111; 
        3'b110: anode = 8'b10111111; 
        3'b111: anode = 8'b01111111; 
    endcase
end
*/
assign seg = segment(mem[dis_sel]);
function logic [6:0] segment(input logic [3:0] value);
    case (value)
        4'h0: segment = 7'b1000000; 
        4'h1: segment = 7'b1111001; 
        4'h2: segment = 7'b0100100; 
        4'h3: segment = 7'b0110000; 
        4'h4: segment = 7'b0011001;
        4'h5: segment = 7'b0010010;
        4'h6: segment = 7'b0000010; 
        4'h7: segment = 7'b1111000; 
        4'h8: segment = 7'b0000000; 
        4'h9: segment = 7'b0010000; 
        4'hA: segment = 7'b0001000;
        4'hB: segment = 7'b0000011; 
        4'hC: segment = 7'b1000110;
        4'hD: segment = 7'b0100001; 
        4'hE: segment = 7'b0000110; 
        4'hF: segment = 7'b0001110;
        default: segment = 7'b1111111;
    endcase
endfunction
endmodule