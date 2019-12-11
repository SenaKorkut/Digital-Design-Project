`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2019 03:18:04 PM
// Design Name: 
// Module Name: upCounter
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


module upCounter( input clk,
                  input clr,
                  input inc,
                  output [29:0] count
                );
logic [29:0]counter; 
always @(posedge clk)
    begin
    if(clr)
        counter <= 29'b0;
    else
        counter <= counter + 29'b1;
    end 

assign count = counter;
endmodule
