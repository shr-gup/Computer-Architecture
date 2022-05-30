`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2022 14:16:27
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
input [1:0] Sign,
input [31:0] Instr_code,
output reg [31:0] Imm

    );
    always@(*)
    begin
    if(Sign == 2'b00) // no sign extend needed
        Imm = 32'h00;
    else if(Sign == 2'b10) //I-type instructions
        Imm<=$signed(Instr_code[20:0]);
    else if(Sign == 2'b11) //srl and sll type instructions
        Imm<=$signed(Instr_code[10:6]);
    end
endmodule
