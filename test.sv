`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2019 06:13:35 PM
// Design Name: 
// Module Name: test
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


module test();
 logic S_1;
             logic S_0;
            logic signed [7:0] A;
            logic signed [7:0] B;
             logic signed [15:0]R;
             
             decoder dec(S_1, S_0, A, B, R);
             
             initial begin 
             S_1 = 0; S_0 = 0; A = 5; B = 3; #100;
             S_1 = 1; #100;
             S_0 = 1; #100;
             S_1 = 0; 
             
             
             end
//logic clk;
//logic button, reset;
//logic signed [7:0]a;
//logic signed [7:0]b;
//logic signed [15:0]out; 
//logic  [6:0]seg;
//logic [3:0] an;

//top uut( clk, reset, button, a,b, out,seg,,an);
//initial 
//    begin 
//       clk = 1;
//       b = 8'b11101000;
//       a = 8'b11100101;   
//       reset = 0;
//       #20;
//       #20;
//       b1 = 0;
//       b2 = 0;
//       b3 = 1;
//       b4 = 0;       
//       #20;
//       b1 = 0;
//       b2 = 0;
//       b3 = 0;
//       b4 = 0; 
//       #20;
//       #20;
//       b = 8'b01111000;
//       a = 8'b01100101; 
       
//       #100;
//       reset = 1; 
//       #20;
//       reset = 0; 
//       #20;
//       b1 = 0;
//       b2 = 0;
//       b3 = 0;
//       b4 = 1;   
//       #20;
//       b3=0;
//       #20;
//       #20;
       
//        clk = 1;
//       b = 8'b11101000;
//       a = 8'b11100101;   
//       reset = 0;
//       #20;
//       #20;
//       b1 = 0;
//       b2 = 0;
//       b3 = 1;
//       b4 = 0;       
//       #20;
//         #20;
//           #20;
//       b1 = 0;
//       b2 = 1;
//       b3 = 0;
//       b4 = 0; 
//       #20;
//       #20;
//        clk = 1;
//       b = 8'b11101000;
//       a = 8'b11100101;   
//       reset = 0;
//       #20;
//       #20;
//       b1 = 0;
//       b2 = 0;
//       b3 = 1;
//       b4 = 0;       
//       #20;
//     end       
//always
//        #10 clk = ~clk;

endmodule
