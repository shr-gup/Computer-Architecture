`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2022 14:16:27
// Design Name: 
// Module Name: Instr_fetch
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


module Instr_fetch(
    input clk,
    input reset,
    output [31:0] Instr_code
    );
    
    reg [31:0] PC;
    Instr_mem X0(reset,PC,Instr_code);//instantiation of instruction_memory block
    always @(posedge clk,negedge reset)
    begin
        if(reset == 0)
        PC<=0;
        else
        PC<=PC+4;
    end
endmodule
