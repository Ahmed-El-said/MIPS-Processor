module sign_e (
    input wire [15:0] sign_i,
    output reg [31:0] sign_o
);
reg [15:0] extra;
always @(*)
    begin
        extra={16 {sign_i[15]}};
        sign_o={extra,sign_i};   

    end    
endmodule