module Forwarding(
input clk,
    input [2:0] IF_ID_RS,
    input [2:0] EX_WB_RD,
    output reg forward
    );
    
    always @(posedge clk)
    begin
        if(IF_ID_RS == EX_WB_RD)
        forward = 1'b1;
        else 
        forward = 1'b0;
    end
endmodule
