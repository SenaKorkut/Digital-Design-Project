`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2019 03:26:18 PM
// Design Name: 
// Module Name: controller
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


module controller( 
                   input logic clk, 
                   input logic reset, 
                   input logic [3:0]button,
                   input logic lt_50,
                   input logic lt_200,
                   output logic ld,
                   output logic clr, 
                   output logic display,
                   output logic reg_clr,
                   output logic inc,
                   output logic S_1,
                   output logic S_0,
                   output logic loadInputs
                   );              
      typedef enum {S0, S1, S2, S3, S4, S5,S6,S7,S8,S9} states;
      states current_state, next_state;  
      //State Register
      logic select0;
      logic select1;
      
      always@ (posedge clk)
      begin
      if( reset) 
            current_state <= S0;
        else
             current_state <= next_state;
             
      case(current_state)
       S0:            
            next_state <= S1;
       S1: 
           if( button == 4'b0001) 
                 next_state <= S2;
           else if( button == 4'b0010) 
                 next_state <= S3;
           else if( button == 4'b0100) 
                 next_state <= S4;
           else if( button == 4'b1000 ) 
                 next_state <= S5;
           else
                next_state <= S1;                  
       S2:  
             begin
                //select0 <= 0;
                //select1 <= 0;
                //r <= A+B;
                next_state <= S6;
             end
       S3:
             begin
                // select0 <= 1;
                 //select1 <= 0;
                 //r <= A*B;
                 next_state <= S6;
             end 
       S4: 
            begin
            //select0 <= 0;
            //select1 <= 1;
           // r <= A/B;
            next_state <= S6;
            end
       S5: 
            begin
            //select0 <= 1;
            //select1 <= 1;
           // r <= A%B;
            next_state <= S6;
            end
       S6:
            begin 
                    next_state <= S7;
            end  
            
       S7: 
            begin 
                    next_state <= S8;
            end
       S8:
            begin
                if(lt_50)
                    next_state <= S8;
                else if ( ~lt_50 ) 
                    next_state <= S9;
            end
       S9:
            begin
                if (lt_200)
                     next_state <= S9;    
                else if ( ~lt_200 )
                    next_state <= S7;
            end
      endcase
      end
      
      assign ld = (current_state == S6);
      assign display = ( current_state != S9);  
      assign reg_clr = (current_state == S0);
      assign clr = ( current_state == S7);  
      assign inc = ( current_state == S8)|(current_state == S9);      
      assign S_0 = select0;
      assign S_1 = select1; 
      assign loadInputs = ( current_state == S0);    
      always@ ( posedge clk )
      begin 
      if(current_state == S2)
      begin
        select0 <= 1'b0;
        select1 <= 1'b0;
        end
      else if ( current_state == S3) 
      begin
        select0 <= 1'b1;
        select1 <= 1'b0;
        end
      else if ( current_state == S4 ) 
      begin
        select0 <= 1'b0;
        select1 <= 1'b1;
        end
      else if ( current_state == S5 ) 
      begin
        select0 <= 1'b1;
        select1 <= 1'b1;
        end
      else 
      begin
        select0 <= 1'b0;
        select1 <= 1'b0;
        end
      end        
endmodule

