`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2025 11:34:42 PM
// Design Name: 
// Module Name: exp_7tb
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

module exp_7tb;
    logic clk, reset, write;
    logic [2:0] sel;
    logic [3:0] num;
    logic [6:0] seg;
    logic [7:0] anode;
    logic [3:0] expected_mem [7:0];
    logic [6:0] expected_seg;
    integer i;

    exp_7 dut (
        .clk(clk),
        .reset(reset),
        .write(write),
        .sel(sel),
        .num(num),
        .seg(seg),
        .anode(anode)
    );
    always #5 clk = ~clk;

    function logic [6:0] expected_segment(input logic [3:0] value);
        case (value)
            4'h0: expected_segment = 7'b1000000; 
            4'h1: expected_segment = 7'b1111001; 
            4'h2: expected_segment = 7'b0100100; 
            4'h3: expected_segment = 7'b0110000; 
            4'h4: expected_segment = 7'b0011001;
            4'h5: expected_segment = 7'b0010010;
            4'h6: expected_segment = 7'b0000010; 
            4'h7: expected_segment = 7'b1111000; 
            4'h8: expected_segment = 7'b0000000; 
            4'h9: expected_segment = 7'b0010000; 
            4'hA: expected_segment = 7'b0001000;
            4'hB: expected_segment = 7'b0000011; 
            4'hC: expected_segment = 7'b1000110;
            4'hD: expected_segment = 7'b0100001; 
            4'hE: expected_segment = 7'b0000110; 
            4'hF: expected_segment = 7'b0001110;
            default: expected_segment = 7'b1111111;
        endcase
    endfunction

    initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;
        write = 0;
        sel = 3'b000;
        num = 4'b0000;
        expected_mem = '{default:4'b0000};
        
        #10 reset = 0; // Release reset after 10 ns

        // Write values to different segments and store expected values
        write = 1;
        for (i = 0; i < 8; i = i + 1) begin
            sel = i[2:0];
            num = i[3:0];
            expected_mem[i] = num;
            #10;
        end
        
        write = 0; // Disable writing
        
        // Check memory values and segment display
        repeat (20) begin
            #10;
            if (expected_mem[sel] !== num) begin
                $display("Memory Mismatch at sel=%b: Expected %h, Got %h", sel, expected_mem[sel], num);
                $stop;
            end
            expected_seg = expected_segment(expected_mem[sel]);
            if (expected_seg !== seg) begin
                $display("Segment Mismatch at sel=%b: Expected %b, Got %b", sel, expected_seg, seg);
                $stop;
            end
        end

        $display("Test Passed Successfully");
        $stop; // Stop simulation
    end
endmodule
