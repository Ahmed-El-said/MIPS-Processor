module PC (
    input wire [31:0] PC_i,
    input wire        clk,
    input wire        rst,
    output reg [31:0] PC_o
);


always @(posedge clk or negedge rst) 
    begin
        if (!rst) 
            begin
               PC_o<=32'b0;   
            end
        else 
    
            begin
                PC_o<=PC_i;
            end  
        
                  
    end

endmodule