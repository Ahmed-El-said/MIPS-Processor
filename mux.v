module mux #(
    parameter Length_in=32,
    parameter Length_out=32

 )(
    input wire [Length_in-1:0] mux_i1,
    input wire [Length_in-1:0] mux_i2,
    input wire        sel,
    output reg [Length_out-1:0] mux_o
);

always @(*)
    begin
        if (!sel)
        begin
            mux_o=mux_i1;
        end
        else
            mux_o=mux_i2;
    end


endmodule