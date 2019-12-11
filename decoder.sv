`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2019 04:54:59 PM
// Design Name: 
// Module Name: decoder
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

module decoder(input logic clk,
            input logic S_1,
            input logic S_0,
            input signed [7:0] A,
            input signed [7:0] B,
            output logic signed [15:0]R,
            output logic  sign
            );
            logic [3:0] sign1;
  logic [1:0]S;
  assign S[0] = S_0;
  assign S[1] = S_1; 
  logic [15:0] a,b,c,d;
  adder add(clk,A,B,a,sign1[0]);
  multiplier mult(clk,A,B,b,sign1[1]);
  divider div(clk,A,B,c,sign1[2]);
  remainder rem(clk,A,B,d,sign1[3]);
  
  always@(posedge clk) 
  case( S ) 
    2'b00: 
    begin
      R <= a;
      sign <= sign1[0];
    end
    2'b01:   
    begin
    R <= b;
    sign <= sign1[1];
    end
    2'b10:   
    begin
   sign <= sign1[2];
    R <= c;
    end
    2'b11:  
    begin
    sign <= sign1[3];
     R <= d;
     end
    default: 
    begin
    R <= 16'b0;
    end
 endcase
 
endmodule

