`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2022 19:34:25
// Design Name: 
// Module Name: Processor_test
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


module Processor_test(

    );
    reg clk,reset;
    Processor X0(clk,reset);
    initial begin
        clk=0;
        repeat(13)
        #5
        clk=~clk;
        $finish;
    end
    initial begin
    reset=1;
    #1
    reset=0;
    #2
    reset=1;
    end
    
endmodule
