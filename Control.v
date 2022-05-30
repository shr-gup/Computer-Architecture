`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2022 14:16:27
// Design Name: 
// Module Name: Control
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
module Control(
input [5:0] opcode,
input [5:0] func,
output reg [1:0] Sign,
output reg ALU_src,
output reg [3:0] ALU_con,
output reg Reg_write,
output reg Choose_reg
    );
    always @(*)
    begin
        Reg_write = 1'b1; //for all the instructions reg_write is enabled
        if(opcode == 6'b000000) //R-type instructions
        begin
           Choose_reg = 1'b1; //RS1 will be read with this signal
           if(func[5:2] == 4'b0000) //for srl and sll
            begin
                ALU_src = 1'b1; //mux preceding ALU will select the immediate data
                Sign = 2'b11; //sign extend block will be enanbled
                case(func[1:0])
                2'b00:  ALU_con = 4'b1000; //sll
                2'b10:  ALU_con = 4'b1100; //srl
                endcase
            end
           else //for other R-type instructions
            begin
                ALU_src = 1'b0; //mux will select the data from RS2
                Sign = 2'b00; //sign extend is not needed for these instructions
                case(func)
                6'b100000:  ALU_con = 4'b0010; //add
                6'b100010:  ALU_con = 4'b0100; //sub
                6'b100100:  ALU_con = 4'b0000; //and
                6'b100101:  ALU_con = 4'b0001; //or
                endcase
            end
        end
        else if(opcode == 6'b111111) //I-type instruction
        begin
            Choose_reg = 1'b0; //RS1 will be read with this signal
            ALU_src = 1'b1; //mux preceding ALU will select the immediate data
            Sign = 2'b10; //sign extend block will be enanbled
            ALU_con = 4'b1110;
        end    
    end 
endmodule