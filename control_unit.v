module control_unit (
    input wire [5:0] opcode,
    input wire [5:0] funct,
    output wire       jmp,
    output wire       mem_to_reg,
    output wire       mem_write,
    output wire       branch,
    output wire       Alu_src,
    output wire       reg_dst,
    output wire       reg_write,
    output wire [2:0] Alu_control
);
wire [1:0] alu_op;
Main_decoder dec (
    .opcode(opcode),
    .jmp(jmp),
    .mem_to_reg(mem_to_reg),
    .mem_write(mem_write),
    .branch(branch),
    .Alu_src(Alu_src),
    .reg_dst(reg_dst),
    .reg_write(reg_write),
    .Alu_op(alu_op)
);

Alu_decoder alu_dec (
    .funct(funct),
    .Alu_op(alu_op),
    .Alu_control(Alu_control)
);

endmodule