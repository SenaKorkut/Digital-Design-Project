`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2019 04:33:16 PM
// Design Name: 
// Module Name: datapath
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


module datapath(input logic signed[7:0]A, 
                input logic signed[7:0]B,
                input logic S_1,
                input logic S_0,
                input logic clk,
                input logic clr,
                input logic inc,
                input logic ld,
                input logic reg_clr,
                output logic lt_50,
                output logic lt_200,
                output logic signed [15:0]R,
                output logic sign
                );
    logic signed [15:0] result; 
    decoder dec(clk, S_1, S_0, A, B, result,sign );
    register reg_(clk, reg_clr, ld, result, R);
    
    
    //For counting and blinking
    logic [29:0] count;
    logic lt50;
    logic lt200;
    upCounter up_c(clk, clr, inc, count);
    comparator c1 (count, 50000000, lt50); 
    comparator c2 (count, 200000000, lt200);
    assign lt_50 = lt50;
    assign lt_200 = lt200;

    
endmodule
