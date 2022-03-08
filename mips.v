module mips (
    input wire clk,
    input wire rst,
    output wire [15:0] testvalue
);

//Internal 
wire [31:0] instr ;
wire sel_1 ;
wire sel_2 ;
wire sel_3 ;
wire sel_4 ;
wire sel_5 ;

wire [27:0] sh1_i;
wire [27:0] sh1_o;
wire [31:0] sh2_i;
wire [31:0] sh2_o;
wire [31:0] adr1_o;
wire [31:0] adr2_o;
wire [31:0] pc_ot;
wire [31:0] PCJump;

wire [4:0] mux1_o; //new
wire [31:0] mux2_o;
wire [31:0] mux3_o;
wire [31:0] mux4_o;
wire [31:0] mux5_o;

wire [31:0] R_RD1;  //register file output =(RD1)
wire [31:0] R_RD2;

//CU_Internal
wire Memwrite_wire;
wire Branch_wire;
wire  [2:0] Alucontrol_wire;
wire RegWrite_wire;

//ALU
wire zero_wire;
wire [31:0] alu_o_wire;

//Data memory
wire [31:0] ReadData; //28 Internal

assign sh1_i=instr[25:0];
assign PCJump={adr2_o[31:28],sh1_o};
assign sel_4=Branch_wire&zero_wire;


control_unit CU(

    .opcode(instr[31:26]),
    .funct(instr[5:0]),
    .jmp(sel_3),
    .mem_to_reg(sel_5),
    .mem_write(Memwrite_wire),
    .branch(Branch_wire), 
    .Alu_src(sel_2),
    .reg_dst(sel_1),
    .reg_write(RegWrite_wire),
    .Alu_control(Alucontrol_wire)

);

register_file RF(
    .A1(instr[25:21]),
    .A2(instr[20:16]),
    .A3(mux1_o),
    .wd3(mux5_o),
    .clk(clk),
    .rst(rst),
    .we3(RegWrite_wire),
    .rd1(R_RD1),
    .rd2(R_RD2)

);

instruction_memory IM(

    .pc(pc_ot),
    .instr(instr)
);
mux #(.Length_in(5), .Length_out(5)) M1(
    .mux_i1(instr[20:16]),
    .mux_i2(instr[15:11]),
    .sel(sel_1),
    .mux_o(mux1_o)
);
sign_e si_ex(

    .sign_i(instr[15:0]),
    .sign_o(sh2_i)
);
shift_Lft_2 #(.IN_length(28), .Out_length(28)) shift_U1 (

   .shift_i(sh1_i),
   .shift_o(sh1_o)

);

shift_Lft_2 #(.IN_length(32), .Out_length(32)) shift_U2 (

    .shift_i(sh2_i),
    .shift_o(sh2_o)

);

adder adU1(
    .A(sh2_o),
    .B(adr2_o),
    .C(adr1_o)
);

adder adU2(
    .A(pc_ot),
    .B(32'd4),
    .C(adr2_o)
);

PC pc(
    .PC_i(mux3_o),
    .clk(clk),
    .rst(rst),
    .PC_o(pc_ot)
);

mux M3(
    .mux_i1(mux4_o),
    .mux_i2(PCJump),
    .sel(sel_3),
    .mux_o(mux3_o)
);

mux M4(
    .mux_i1(adr2_o),
    .mux_i2(adr1_o),
    .sel(sel_4),
    .mux_o(mux4_o)
);

//where we stopped

mux M2(
    .mux_i1(R_RD2),
    .mux_i2(sh2_i), ///note we can make another wire called sign extended output
    .sel(sel_2), // q1.is signals okay to connect directly without internal wiresv
    .mux_o(mux2_o)
);

ALU alu(

    .ALU_control(Alucontrol_wire),
    .ScrA(R_RD1),
    .ScrB(mux2_o),
    .ALUResult(alu_o_wire),
    .Zero(zero_wire)
);

data_memory DM(
    .A(alu_o_wire),
    .wd(R_RD2),
    .clk(clk),
    .we(Memwrite_wire),
    .rst(rst),
    .rd(ReadData),
    .test_value(testvalue)
);

mux M5(
    .mux_i1(alu_o_wire),
    .mux_i2(ReadData), ///note we can make another wire called sign extended output
    .sel(sel_5), // q1.is signals okay to connect directly without internal wiresv
    .mux_o(mux5_o)
);

endmodule