module EX_WB_Reg(
input RegWrite_ID_EX,
input [7:0] ALU_result_ALU,
input [2:0] Write_reg_ID_EX,
input clk,
input reset,
output reg RegWrite_EX_WB,
output reg [7:0] ALU_result_EX_WB,
output reg [2:0] Write_reg_EX_WB
    );
    
    always @(posedge clk,negedge reset)
        begin
        if(reset == 0)
        begin
        RegWrite_EX_WB = 1'b0;
        ALU_result_EX_WB = 7'h00;
        Write_reg_EX_WB = 3'h00;
        end
        
        else
            begin
            RegWrite_EX_WB = RegWrite_ID_EX;
            ALU_result_EX_WB = ALU_result_ALU;
            Write_reg_EX_WB = Write_reg_ID_EX;
            end    
        end
endmodule
