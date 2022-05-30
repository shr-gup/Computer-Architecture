`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2022 14:16:27
// Design Name: 
// Module Name: Mux21
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


module Mux21(
    input [31:0] I0,
    input [31:0] I1,
    input S0,
    output reg [31:0] Out_21
    );
    
    always @(S0 or I0 or I1 )
          begin
            case(S0)
            1'b0:
            Out_21=I0;
            1'b1:
            Out_21=I1;
            endcase 
          end
endmodule
