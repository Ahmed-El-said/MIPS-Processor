module shift_Lft_2 #(
    parameter IN_length=32,
    parameter Out_length=32
) ( 
    input wire [IN_length-1:0] shift_i,
    output wire [Out_length-1:0] shift_o

);
//assign shift_o={shift_i,2'b0};
assign shift_o=shift_i<<2;   

endmodule
