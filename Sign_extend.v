`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2022 13:02:23
// Design Name: 
// Module Name: Sign_extend
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


module Sign_extend(
input Imm_sel,
input [7:0] Instr_code,
output reg [7:0] Imm
    );
    
    always@(*)
        begin
        if(Imm_sel == 1'b0) // no sign extend needed
            Imm = 8'h00;
        else //li
            Imm<=$signed(Instr_code[2:0]);
        end
endmodule
