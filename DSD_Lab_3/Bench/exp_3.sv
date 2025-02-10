`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2025 11:32:35 AM
// Design Name: 
// Module Name: exp_3
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


module exp_3();
    reg a,s,d;
    wire x,y;
    
    project_2 UUT(
        .a(a),
        .s(s),
        .d(d),
        .x(x),
        .y(y)
    );
    
    initial begin
    a = 0; s = 0; d = 0;
    #10;
    a = 0; s = 0; d = 1;
    #10;
    a = 0; s = 1; d = 0;
    #10;
    a = 0; s = 1; d = 1;
    #10;
    a = 1; s = 0; d = 0;
    #10;
    a = 1; s = 0; d = 1;
    #10;
    a = 1; s = 1; d = 0;
    #10;
    a = 1; s = 1; d = 1;
    #10;
    
    $finish;
   end
endmodule
