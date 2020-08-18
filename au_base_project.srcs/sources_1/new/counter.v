//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.08.2020 17:04:21
// Design Name: 
// Module Name: counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module counter #(parameter CTR_LEN = 8)(
    input rst,
    input clk,
    input dir,
    input reverse_on_carry,
    input [CTR_LEN - 1 : 0] start_value,
    output reg [CTR_LEN -1 : 0] counter_value
    );
    
    reg [CTR_LEN : 0] counter_d,counter_q;
    
    always @(*) begin
        if (dir) 
            counter_d = counter_q + 1'b1;       
        else 
            counter_d = counter_q - 1'b1;      
            
        //counter_value <= counter_q[CTR_LEN - 1 : 0]; 
        if (reverse_on_carry) 
             counter_value <= (~counter_q[CTR_LEN]) ? counter_q[CTR_LEN - 1 : 0] : ~counter_q[CTR_LEN - 1 : 0];
        else 
             counter_value <= counter_q[CTR_LEN - 1 : 0];         
    end
    
    always @(posedge clk) begin
        if (rst) begin
            counter_q[CTR_LEN - 1 : 0] <= start_value;   
            counter_q[CTR_LEN] <= 1'b0;     
        end else 
            counter_q <= counter_d;

    end
    
    
endmodule
