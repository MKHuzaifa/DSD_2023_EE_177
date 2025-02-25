`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2025 09:05:27 PM
// Design Name: 
// Module Name: exp_5c
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


`timescale 1ns / 1ps


module exp_5c(
    input logic [3:0] num,
    input logic [2:0] sel,
    output logic [6:0] segment,
    output logic [7:0] anode
);
    always_comb
        begin
            //Cathodes
            segment[0] = (~num[3] & ~num[2] & ~num[1] & num[0]) | (~num[3] & num[2] & ~num[1] & ~num[0]) | 
                (num[3] & num[2] & ~num[1] & num[0]) | (num[3] & ~num[2] & num[1] & num[0]);
            segment[1] = (num[2] & num[1] & ~num[0]) | (num[3] & num[1] & num[0]) |
                (num[3] & num[2] & ~num[0]) | (~num[3] & num[2] & ~num[1] & num[0]);
            segment[2] = (~num[3] & ~num[2] & num[1] & ~num[0]) | (num[3] & num[2] & num[1]) |
                (num[3] & num[2] & ~num[0]);
            segment[3] = (~num[3] & num[2] & ~num[1] & ~num[0]) | (~num[3] & ~num[2] & ~num[1] & num[0]) |
                (num[2] & num[1] & num[0]) | (num[3] & ~num[2] & num[1] & ~num[0]);
            segment[4] = (~num[3] & num[0]) | (~num[2] & ~num[1] & num[0]) |
                (~num[3] & num[2] & ~num[1]);
            segment[5] = (~num[3] & ~num[2] & num[0]) | (~num[3] & ~num[2] & num[1]) |
                (~num[3] & num[1] & num[0]) | (num[3] & num[2] & ~num[1] & num[0]);
            segment[6] = (~num[3] & ~num[2] & ~num[1]) | (num[3] & num[2] & ~num[1] & ~num[0]) |
                (~num[3] & num[2] & num[1] & num[0]);
            
            //Anodes
            anode[0] = (sel[2] | sel[1] | sel[0]);
            anode[1] = (sel[2] | sel[1] | ~sel[0]);
            anode[2] = (sel[2] | ~sel[1] | sel[0]);
            anode[3] = (sel[2] | ~sel[1] | ~sel[0]);
            anode[4] = (~sel[2] | sel[1] | sel[0]);
            anode[5] = (~sel[2] | sel[1] | ~sel[0]);
            anode[6] = (~sel[2] | ~sel[1] | sel[0]);
            anode[7] = (~sel[2] | ~sel[1] | ~sel[0]);
        end
endmodule