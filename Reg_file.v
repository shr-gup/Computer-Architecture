module Reg_file(
    input reset,
    input RegWrite,
    input [2:0] Read_reg1,
    input [2:0] Read_reg2,
    input [2:0] Write_reg,
    input [7:0] Write_data,
    output [7:0] Read_data1,
    output [7:0] Read_data2
    );
    reg [7:0] RegMemory [7:0]; // 8-bit 8 registers
    integer i;
    initial begin
    for(i=0; i<=7; i=i+1)
        RegMemory[i]=i; // initialising all the resgiters to their register value
    end 
    assign Read_data1=RegMemory[Read_reg1];
    assign Read_data2=RegMemory[Read_reg2];
     
    always @(*)
        begin
            if(reset==1)
            begin
            if(RegWrite==1)
             RegMemory[Write_reg]=Write_data;
           end
        end
    endmodule