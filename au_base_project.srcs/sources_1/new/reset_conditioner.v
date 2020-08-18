/*
   Parameters:
     STAGES = 4
*/
module reset_conditioner (
    input clk,
    input in,
    output reg out
  );
  
  
  reg[3:0] storage = 4'hf;
  reg[1:0] in_synced = 2'b00; 
  
  always @(posedge clk) begin
    if(in_synced[1] == 1'b1) begin
        storage <= 4'hf;
        in_synced <= 2'b00;
    end else
        storage <= { storage[2:0], 1'b0 };
    in_synced <= { in_synced[0], in };
    out <= storage[3];    
  end
  
  /*
  localparam STAGES = 3'h4;
  
  
  reg [3:0] M_stage_d, M_stage_q = 4'hf;
  
  always @* begin
    M_stage_d = M_stage_q;
    
    M_stage_d = {M_stage_q[0+2-:3], 1'h0};
    out = M_stage_q[3+0-:1];
  end
  
  always @(posedge clk) begin
    if (in == 1'b1) begin
      M_stage_q <= 4'hf;
    end else begin
      M_stage_q <= M_stage_d;
    end
  end
  */
endmodule
