module register_file (
    input wire [4:0]  A1,
    input wire [4:0]  A2,
    input wire [4:0]  A3,
    input wire [31:0] wd3,
    input wire        clk,
    input wire        rst,
    input wire        we3,
    output wire [31:0] rd1,
    output wire [31:0] rd2
);

reg [31:0] reg_f [0:31];
integer i;

always @(posedge clk or negedge rst)
    begin
        if (!rst)
            begin
                for (i=0; i<32; i=i+1)
                    begin
                        reg_f [i] <= { (32) {1'b0} };
                    end
                
            end
        else if (we3)
            begin
                reg_f [A3] <= wd3;
            end
    end

assign rd1 = reg_f[A1];
assign rd2 = reg_f[A2];

endmodule