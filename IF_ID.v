module IF_ID_Reg(
input [7:0] Instruction_code_InstMem,
input reset,
input clk,
output reg [7:0] Instruction_code_IF_ID
    );
    
    always @(posedge clk,negedge reset)
        begin
        if(reset == 0)
        begin
        Instruction_code_IF_ID = 8'h00;
        end
        
        else
            begin
            Instruction_code_IF_ID = Instruction_code_InstMem;
            end    
        end
endmodule
