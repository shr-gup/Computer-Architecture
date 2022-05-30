module Instr_mem(
input reset, 
input[7:0] PC,
output [7:0] Instruction_code
    );    
    reg [7:0] Mem [7:0]; //8 blocks of 8-bit memory 
    assign Instruction_code = Mem[PC]; 
    always @(reset)
    begin
    if(reset==0)
    $readmemh("Instruction.mem",Mem);
end 
endmodule

//li R3,3
//add R3,R3
//add R3,R3
//j L1
//li R3,4
//L1: add R3,R3