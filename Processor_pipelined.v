module Processor(
input clk,
input reset
    );
    wire [7:0]Instruction_code, Instruction_code_IF_ID;
    wire [7:0] Read_data1, Read_data1_ID_EX, Data1;
    wire [7:0] Read_data2, Read_data2_ID_EX, Data2;
    wire [7:0] Imm, Imm_ID_EX;
    wire RegWrite, RegWrite_ID_EX, RegWrite_EX_WB;
    wire Imm_sel;
    wire [1:0] ALU_con, ALU_con_ID_EX;
    wire ALU_src, ALU_src_ID_EX;
    wire [7:0] ALU_result, ALU_result_EX_WB;
    wire zero; 
    wire [2:0] Write_reg_ID_EX, Write_reg_EX_WB;
    wire forward;
    
    Instr_fetch B1(reset, clk, Instruction_code); // instruction fetch 
    IF_ID_Reg R0(Instruction_code, reset, clk, Instruction_code_IF_ID); // pipelined register for IF and ID
    
    Control B2(Instruction_code_IF_ID[7:6], RegWrite, ALU_con, Imm_sel, ALU_src); // control unit
    Sign_extend B3(Imm_sel, Instruction_code_IF_ID, Imm); // sign extend block
    ID_EX_Reg R1(RegWrite, ALU_con, ALU_src, Read_data1, Read_data2, Imm, Instruction_code_IF_ID[5:3], clk, reset, RegWrite_ID_EX, ALU_con_ID_EX, ALU_src_ID_EX, Read_data1_ID_EX, Read_data2_ID_EX, Imm_ID_EX, Write_reg_ID_EX);
    // pipelined register for ID and EX stage
    
    // forwarding
    Forwarding F(clk,Instruction_code_IF_ID[2:0], Write_reg_EX_WB, forward); // forward unit
    Mux21 M1(Read_data1_ID_EX, ALU_result_EX_WB,forward, Data1); //to check if forwarding is to be done or not
    Mux21 M2(Read_data2_ID_EX, Imm_ID_EX, ALU_src_ID_EX, Data2); // to selct either the immediate data or data from the register
    ALU B5(Data1, Data2, ALU_con_ID_EX, ALU_result, zero); // ALU unit
    EX_WB_Reg R2(RegWrite_ID_EX, ALU_result, Write_reg_ID_EX, clk, reset, RegWrite_EX_WB, ALU_result_EX_WB, Write_reg_EX_WB); // pipelined register for WB and EX stage
    
    Reg_file B6(reset, RegWrite_EX_WB, Instruction_code_IF_ID[2:0], Instruction_code_IF_ID[5:3], Write_reg_EX_WB, ALU_result_EX_WB, Read_data1_ID_EX, Read_data2_ID_EX);
    //regfile is instantiated to write back 
endmodule