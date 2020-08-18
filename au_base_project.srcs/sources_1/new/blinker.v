//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.08.2020 18:50:05
// Design Name: 
// Module Name: blinker
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


module blinker(
    input clk,
    input rst,
    output blink
    );
    
    reg [24:0] counter_d, counter_q;
 
    assign blink = counter_q[24];
 
    always @(counter_q) begin
        counter_d = counter_q + 1'b1;
    end
 
    always @(posedge clk) begin
        if (rst) begin
            counter_q <= 25'b0;
        end else begin
            counter_q <= counter_d;
        end
    end    
    
endmodule
