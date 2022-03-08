//module instruction_memory (
//    input wire [31:0] pc,
//    input wire        rst,
//    output wire [31:0] instr
//);
//
//reg [31:0] instr_m [0:31];
//
//assign instr = instr_m[pc>>2];
//
//always @(*)
//    begin
//        case (pc>>2)
//            32'd0: instr_m[pc>>2] = 32'h00008020;
//            32'd1: instr_m[pc>>2] = 32'h20100007;
//            32'd2: instr_m[pc>>2] = 32'h00008820;
//            32'd3: instr_m[pc>>2] = 32'h20110001;
//            32'd4: instr_m[pc>>2] = 32'h12000003;
//            32'd5: instr_m[pc>>2] = 32'h0230881C;
//            32'd6: instr_m[pc>>2] = 32'h2210FFFF;
//            32'd7: instr_m[pc>>2] = 32'h08000004;
//            32'd8: instr_m[pc>>2] = 32'hAC110000;
//            32'd9: instr_m[pc>>2] = 32'b0;
//            32'd10: instr_m[pc>>2] = 32'b0;
//            32'd11: instr_m[pc>>2] = 32'b0;
//            32'd12: instr_m[pc>>2] = 32'b0;
//            32'd13: instr_m[pc>>2] = 32'b0;
//            32'd14: instr_m[pc>>2] = 32'b0;
//            32'd15: instr_m[pc>>2] = 32'b0;
//            32'd16: instr_m[pc>>2] = 32'b0;
//            32'd17: instr_m[pc>>2] = 32'b0;
//            32'd18: instr_m[pc>>2] = 32'b0;
//            32'd19: instr_m[pc>>2] = 32'b0;
//            32'd20: instr_m[pc>>2] = 32'b0;
//            32'd21: instr_m[pc>>2] = 32'b0;
//            32'd22: instr_m[pc>>2] = 32'b0;
//            32'd23: instr_m[pc>>2] = 32'b0;
//            32'd24: instr_m[pc>>2] = 32'b0;
//            32'd25: instr_m[pc>>2] = 32'b0;
//            32'd26: instr_m[pc>>2] = 32'b0;
//            32'd27: instr_m[pc>>2] = 32'b0;
//            32'd28: instr_m[pc>>2] = 32'b0;
//            32'd29: instr_m[pc>>2] = 32'b0;
//            32'd30: instr_m[pc>>2] = 32'b0;
//            32'd31: instr_m[pc>>2] = 32'b0;
//        endcase
//    end
//    
//endmodule



module instruction_memory	#(

)(
input	wire	[31:0] pc,
output	reg		[31:0]	instr 	) ;

reg	[31:0]	instr_m	[0:31];

initial 
    begin
		$readmemh ("Program.txt", instr_m);
    end

always @ (*)
	begin
		instr = instr_m [pc>>2];
	end
	
endmodule 