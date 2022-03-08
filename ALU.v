module ALU (
   input wire [2:0]  ALU_control,
   input wire [31:0] ScrA,
   input wire [31:0] ScrB,
   output reg [31:0] ALUResult,
   output reg        Zero
);
always @(*) 
    begin
        Zero=1'b0;
        case (ALU_control)
            3'b000:
                begin
                 ALUResult=ScrA&ScrB;
                 Zero=(ALUResult) ? 1'b0 :1'b1;
                end    
            3'b001:
                begin
                 ALUResult=ScrA|ScrB;
                 Zero=(ALUResult) ? 1'b0 :1'b1;
                end    
            3'b010:
                begin
                 ALUResult=ScrA+ScrB;
                end   
            3'b100:
                begin
                 ALUResult=ScrA-ScrB;
                 Zero=(ALUResult) ? 1'b0 :1'b1;
                end
            3'b101:
                begin
                 ALUResult=ScrA*ScrB;
                 Zero=(ALUResult) ? 1'b0 :1'b1;
                end
            3'b110:
                begin
                 ALUResult=(ScrA<ScrB) ? 32'b1 : 32'b0;
                end
            default: 
                begin
                 ALUResult=32'b0;
                 Zero=1'b0;
                end
        endcase

    end
endmodule