`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2022 14:16:27
// Design Name: 
// Module Name: Reg_file
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


module Reg_file(
    input reset,
    input Reg_write,
    input clk,
    input Choose_reg, //if this is enabled then RS1 data will be read else it will be assigned 0
    input [4:0] Read_reg1, //register number of first source
    input [4:0] Read_reg2, //register number of second source
    input [4:0] Write_reg, //register number of destination register
    input [31:0] Write_data,
    output reg [31:0] Read_data1,
    output reg [31:0] Read_data2
    );
    
    reg [31:0] RegMemory [31:0]; // 32-bit 32 registers
    integer i;
    initial begin
    for(i=0; i<=31; i=i+1)
        begin
            RegMemory[i]=i; // initialising all the resgiters to some value
        end
    end
     
    always @(*)
        begin
        Read_data1 = RegMemory[Read_reg1];
                if(Choose_reg == 1'b1)
                    Read_data2 = RegMemory[Read_reg2];
                else
                    Read_data2 = 32'h00;
              end
              always@(*)
              begin 
        if(Reg_write == 1'b1)
        RegMemory[Write_reg] = Write_data;
       
         end
    endmodule