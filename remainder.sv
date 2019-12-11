`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2019 01:00:38 PM
// Design Name: 
// Module Name: remainder
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


module remainder(input clk,
             input signed [7:0]A, 
             input signed [7:0]B,
             output logic signed [15:0]R,
             output logic sign
             );
logic [15:0] result;
assign result = A%B;             
always@ ( posedge clk )
case (result[15] )
1'b0:
begin
R <= result;
end
1'b1:
begin
R<= result;
end
endcase
endmodule
