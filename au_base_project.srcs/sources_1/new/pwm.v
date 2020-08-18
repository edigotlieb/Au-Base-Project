//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.08.2020 23:41:09
// Design Name: 
// Module Name: pwm
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


module pwm #(parameter CTR_LEN = 8)(
    input clk,
    input rst,
    input[CTR_LEN - 1 : 0] compare,
    output pwm
    );
    
    reg pwm_d,pwm_q;
    reg[CTR_LEN - 1 : 0] counter_d,counter_q;
    
    assign pwm = pwm_q;
    
    always @(*) begin
        counter_d = counter_q + 1'b1;
        if (counter_q < compare)
            pwm_d = 1'b1;
        else    
            pwm_d = 1'b0;
    end
    
    always @(posedge clk) begin
        if (rst) begin
            counter_q <= 1'b0;
        end else begin
            counter_q <= counter_d;
        end 
        pwm_q <= pwm_d;
    end
endmodule


