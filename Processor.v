`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2022 14:17:23
// Design Name: 
// Module Name: Processor
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


module Processor(
input clk,
input reset
    );
    wire [31:0] Instr_code, Read_data1, Read_data2, ALU_result, Imm, Mux_result;
    wire Reg_write, ALU_src, Choose_reg;
    wire [1:0] Sign;
    wire [3:0] ALU_con;
    wire zero;
    
    Instr_fetch I(clk, reset, Instr_code);
    Control C(Instr_code[31:26], Instr_code[5:0], Sign, ALU_src, ALU_con, Reg_write, Choose_reg);
    Sign_extend S(Sign, Instr_code, Imm);
    Reg_file R1(reset, 1'b0, clk, Choose_reg, Instr_code[20:16], Instr_code[15:11], Instr_code[25:21], ALU_result, Read_data1, Read_data2); 
    //here reg write is 0 cause we only want o read the data from source registers
    Mux21 M(Read_data2, Imm, ALU_src, Mux_result);
    ALU A(Read_data1, Mux_result, ALU_con, ALU_result, zero);
    Reg_file R2(reset, Reg_write, clk, Choose_reg, Instr_code[20:16], Instr_code[15:11], Instr_code[25:21], ALU_result, Read_data1, Read_data2);
    
endmodule
