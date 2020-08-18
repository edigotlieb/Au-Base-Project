module au_top(
    input clk,
    input rst_n,
    output[7:0] led,
    input usb_rx,
    output usb_tx,
    
    input i2c_scl,
    input i2c_sda,
    
    output debug0,
    output debug1,
    output debug2,
    output debug3
    );
    
    reg reset;          
    wire rst;
    
    reset_conditioner reset_conditioner(.clk(clk), .in(!rst_n), .out(rst));    
      
    
    
    assign usb_tx = usb_rx;

    always @(posedge clk)
        reset <= rst;
    
    i2c_state_parser i2c_state_parser(reset,clk,i2c_scl,i2c_sda,debug0,debug1,debug2,debug3);
    
    assign led[0] = debug0;
    assign led[1] = debug1;
    assign led[2] = debug2;
    assign led[3] = debug3;
    
endmodule
