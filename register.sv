`timescale 1ns / 1ps

module register( input logic clk,clr,ld, input signed[15:0] result, output signed [15:0] out ); 
       logic signed [15:0] stored_value;
        always@(posedge clk)               
             if (clr)
                   stored_value<= 16'b0;
             else if (ld)
                   stored_value <= result;
              else
                   stored_value <= stored_value;
             assign out = stored_value;   
endmodule