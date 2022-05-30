module Control(
    input [1:0] opcode,
    output reg RegWrite,
    output reg [1:0] ALU_con,
    output reg Imm_sel,
    output reg ALU_src
    );
        
    always @(*)
    begin
        case(opcode)
        4'b00: //li
        begin
        RegWrite = 1'b1;
        ALU_con = 2'b00;
        Imm_sel = 1'b1;
        ALU_src = 1'b1;
        end
        
        4'b01: //add
        begin
        RegWrite = 1'b1;
        ALU_con = 2'b01;
        Imm_sel = 1'b0;
        ALU_src = 1'b0;
        end
        
        4'b11: //unconditional jump
        begin
        RegWrite = 1'b0;
        ALU_con = 2'b11;
        Imm_sel = 1'b0;
        ALU_src = 1'b0;
        end
        endcase
    end    
endmodule