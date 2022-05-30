`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2022 14:16:27
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] A0,
    input [31:0] A1,
    input [3:0] ALU_con,
    output reg [31:0] ALU_result,
    output reg zero
    );
    
    always @(A0 or A1 or ALU_con)
            begin
                case(ALU_con) 
                4'b0000: ALU_result = A0 & A1;
                4'b0001: ALU_result = A0 | A1;
                4'b0010: ALU_result = A0 + A1;
                4'b0100: ALU_result = A0 - A1;
                4'b1000: ALU_result = A0 << A1;//sll
                4'b1100: ALU_result = A0 >> A1; //for srl
                4'b1110: ALU_result = A1; //for li A0 will be written into register
                endcase
            end
            always @(ALU_result)
            begin
            if(ALU_result == 0)
            assign zero = 1'b1;
            else
            assign zero = 1'b0;
            end
    
endmodule
