module ALU(
    input [7:0] A, //rs
    input [7:0] B,//immediate value
    input [1:0] ALU_con, //from control block
    output reg [7:0] ALU_Result,
    output reg Zero
    );
    always @(A or ALU_con)
        begin
            case(ALU_con) 
            2'b01: ALU_Result = A + A;//add operation
            2'b00: ALU_Result = B; //li operation
            2'b11: ALU_Result = 7'b00; // unconditional jump
            endcase
        end
        always @(ALU_Result)
        begin
        if(ALU_Result == 0)
        assign Zero = 1'b1;
        else
        assign Zero = 1'b0;
        end
endmodule