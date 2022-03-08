module data_memory (
    input wire [31:0] A,
    input wire [31:0] wd,
    input wire        clk,
    input wire        we,
    input wire        rst,
    output wire [31:0] rd,
    output wire [15:0] test_value
);

reg [31:0] data_m [0:31];
integer i;

always @(posedge clk or negedge rst) 
    begin
        if (!rst)
            begin
                  for (i=0; i<32; i=i+1)
                    begin
                        data_m [i] <= { (32) {1'b0} };
                    end
            end
        else if (we)
            begin
                data_m[A] <= wd;
            end
    end

assign rd = data_m[A];
assign test_value = data_m[0];

endmodule