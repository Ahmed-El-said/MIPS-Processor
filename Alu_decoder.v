module Alu_decoder (
    input wire [5:0] funct,
    input wire [1:0] Alu_op,
    output reg [2:0] Alu_control
);
  
always @(*)
    begin
        case (Alu_op)
            2'b00: Alu_control=3'b010;
            2'b01: Alu_control=3'b100;
            2'b10:
                begin
                    case (funct)
                        6'b100000: Alu_control=3'b010;
                        6'b100010: Alu_control=3'b100;
                        6'b101010: Alu_control=3'b110;
                        6'b011100: Alu_control=3'b101;
                        default: Alu_control=3'b010;
                    endcase
                end
            default: Alu_control=3'b010;
        endcase
    end
endmodule