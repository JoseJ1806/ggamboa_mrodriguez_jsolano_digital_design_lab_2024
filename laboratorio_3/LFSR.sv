module LFSR (input clk,input rst,output [7:0] rnd );
  always @(posedge clk or negedge rst) begin
    if (!rst)
      rnd <= 8'd1; // can be anything except zero
    else
      rnd <= {rnd[6:0], rnd[7] ^ rnd[5] ^ rnd[4] ^ rnd[3]}; // polynomial for maximal LFSR
  end
endmodule 