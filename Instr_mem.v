`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2022 14:16:27
// Design Name: 
// Module Name: Instr_mem
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


module Instr_mem(
    input reset,
    input [31:0] PC,
    output [31:0] Instr_code
    );
    //add r0,r1,r2  00011020
    //sub r4,r5,r6  00853022
    //and r8,r9,r10 01095024
    //or r9,r8,r10  01285025
    //sll r11,r6,6  01660180
    //srl r13,r9,10 01A90282
    //li r1,13      FC20000D
    
    reg [7:0] Mem [35:0];
    assign Instr_code = {Mem[PC+3],Mem[PC+2],Mem[PC+1],Mem[PC]}; 
    always @(reset)
    begin
    if(reset==0)
    $readmemh("Reg_mem.mem",Mem);
    end
endmodule
