module Main_decoder (
    input wire [5:0] opcode,
    output reg       jmp,
    output reg       mem_to_reg,
    output reg       mem_write,
    output reg       branch,
    output reg       Alu_src,
    output reg       reg_dst,
    output reg       reg_write,
    output reg [1:0] Alu_op
);

always @(*)
    begin
        case (opcode)
            6'b100011:
                begin
                    jmp=1'b0;
                    Alu_op=2'b0;
                    mem_write=1'b0;
                    reg_write=1'b1;
                    reg_dst=1'b0;
                    Alu_src=1'b1;
                    mem_to_reg=1'b1;
                    branch=1'b0;
                end 
            6'b101011:
                begin
                    jmp=1'b0;
                    Alu_op=2'b0;
                    mem_write=1'b1;
                    reg_write=1'b0;
                    reg_dst=1'b0;
                    Alu_src=1'b1;
                    mem_to_reg=1'b1;
                    branch=1'b0;
                end
            6'b000000:
                begin
                    jmp=1'b0;
                    Alu_op=2'b10;
                    mem_write=1'b0;
                    reg_write=1'b1;
                    reg_dst=1'b1;
                    Alu_src=1'b0;
                    mem_to_reg=1'b0;
                    branch=1'b0;
                end
            6'b001000:
                begin
                    jmp=1'b0;
                    Alu_op=2'b0;
                    mem_write=1'b0;
                    reg_write=1'b1;
                    reg_dst=1'b0;
                    Alu_src=1'b1;
                    mem_to_reg=1'b0;
                    branch=1'b0;
                end
            6'b000100:
                begin
                    jmp=1'b0;
                    Alu_op=2'b01;
                    mem_write=1'b0;
                    reg_write=1'b0;
                    reg_dst=1'b0;
                    Alu_src=1'b0;
                    mem_to_reg=1'b0;
                    branch=1'b1;
                end
            6'b000010:
                begin
                    jmp=1'b1;
                    Alu_op=2'b0;
                    mem_write=1'b0;
                    reg_write=1'b0;
                    reg_dst=1'b0;
                    Alu_src=1'b0;
                    mem_to_reg=1'b0;
                    branch=1'b0;
                end
            default:
                begin
                    jmp=1'b0;
                    Alu_op=2'b0;
                    mem_write=1'b0;
                    reg_write=1'b0;
                    reg_dst=1'b0;
                    Alu_src=1'b0;
                    mem_to_reg=1'b0;
                    branch=1'b0;
                end
        endcase
    end 

endmodule