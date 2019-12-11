`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2019 12:59:33 PM
// Design Name: 
// Module Name: top
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
/////////////////////////////////////////////////////////////////////////////////
module top(input logic clk,
           input logic reset,
           input [3:0] button,
           input signed [7:0]A,
           input signed [7:0]B,
           output [7:0] seg,
           output [15:0] LED,
           output [3:0] an
           );
           logic sign;
    logic signed [15:0]R;
    logic lt_50, lt_200;
    logic clr;
    logic display;
    logic reg_clr;
    logic inc;
    logic S_1, S_0;
    logic ld;
    logic signed [7:0] aReg;
    logic signed [7:0] bReg;
    logic loadInputs;
    always@(posedge clk)
    begin
    
     
    if(loadInputs)
    begin
    aReg <= A;
    bReg <= B;
    end
    end
    
    //assign LED[15:8] = A;
    //assign LED[7:0] = B;
    controller c( clk, reset, button, lt_50, lt_200, ld, clr, display, reg_clr, inc, S_1, S_0,loadInputs);
    datapath dtp( aReg, bReg, S_1, S_0, clk, clr, inc, ld, reg_clr, lt_50, lt_200, R, sign);   
    assign R = LED;
    SevSeg segment( clk, display,sign, R%16, (R/16)%16, (R/256)%16, (R/4096)%16, seg, an);
         
endmodule
