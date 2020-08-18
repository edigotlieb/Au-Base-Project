module au_top(
    input clk,
    input rst_n,
    output[7:0] led,
    input usb_rx,
    output usb_tx
    );
    
    wire rst;          
    
    reset_conditioner reset_conditioner(.clk(clk), .in(!rst_n), .out(rst));    
       
    assign usb_tx = usb_rx;
   
   wire [27:0] counter_value;
   
  counter #(.CTR_LEN(28)) counter (
    .rst(rst),
    .clk(clk),
    .dir(1'b1),
    .reverse_on_carry(1'b1),
    .start_value(28'b0),
    .counter_value(counter_value)
    );

  /*  
  pwm #(.CTR_LEN(8)) pwm_generator (
    .rst(rst),
    .clk(clk),
    .compare(counter_value[29:22]),
    .pwm(led[0])
  );
   */
   genvar i;
   generate
        for (i = 0; i < 8; i=i+1) begin: pwm_gen_loop
        pwm #(.CTR_LEN(8)) pwm (
          .rst(rst),
          .clk(clk),
          .compare(counter_value[27:20]),
          .pwm(led[i])
        );
        end
   endgenerate
    
    
    
endmodule
