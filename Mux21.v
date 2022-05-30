module Mux21(
    input [7:0] I0,
    input [7:0] I1,
    input S0,
    output reg [7:0] Out_21
    );
    
    always @(S0 or I0 or I1 )
          begin
            case(S0)
            1'b0:
            Out_21=I0;
            1'b1:
            Out_21=I1;
            endcase 
          end
endmodule
