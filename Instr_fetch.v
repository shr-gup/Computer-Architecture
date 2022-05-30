module Instr_fetch(
    input reset,
    input clk,
    output [7:0] Instruction_code //8-bit instr codes
    );
    reg [7:0] PC;
    Instr_mem X0(reset,PC,Instruction_code);
    wire [1:0] opcode;
    wire [5:0] imm;
    assign imm = Instruction_code[5:0];
    assign opcode  = Instruction_code[7:6]; 
        
    always @(posedge clk, negedge reset)
    begin
        if(reset == 0)
            PC<=0;
        else
            begin
                if(opcode == 2'b11)
                  PC<=PC+1+imm;
             else
                  PC<=PC+1;
            end
     end
    endmodule