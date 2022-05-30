module ID_EX_Reg(
input Reg_Write_Control,
input [1:0]ALU_con_Control,
input ALU_src_Control,
input [7:0] Data1_RegFile, Data2_RegFile, Imm_Sign,
input [2:0] Write_Reg_Instr,
input clk,
input reset,
output reg Reg_Write_ID_EX,
output reg [1:0]ALU_con_ID_EX,
output reg ALU_src_ID_EX,
output reg [7:0] Data1_ID_EX, Data2_ID_EX, Imm_ID_EX,
output reg [2:0] Write_Reg_ID_EX
    );
    
    always @(posedge clk,negedge reset)
        begin
        if(reset == 0)
            begin
            Reg_Write_ID_EX = 1'b0;
            ALU_con_ID_EX = 2'b00;
            ALU_src_ID_EX = 1'b0;
            Data1_ID_EX = 8'h00;
            Data2_ID_EX = 8'h00;
            Imm_ID_EX = 8'b00;
            Write_Reg_ID_EX = 3'b00;
            end        
        else
            begin
            Reg_Write_ID_EX=Reg_Write_Control;
            ALU_con_ID_EX=ALU_con_Control;
            ALU_src_ID_EX = ALU_src_Control;
            Data1_ID_EX = Data1_RegFile;
            Data2_ID_EX = Data2_RegFile;
            Imm_ID_EX = Imm_Sign;
            Write_Reg_ID_EX = Write_Reg_Instr;
            end    
        end
    
endmodule
