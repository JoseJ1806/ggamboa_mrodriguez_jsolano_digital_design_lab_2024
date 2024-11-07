module image_loader(
  input logic clk,
  input logic vgaclk,
  input logic enable,
  input logic rst,
  output logic [7:0] pixel
);

	logic [15:0] memAddress = 0;
	ram_rgb ram(.address(memAddress),
				  .clock(clk),
				  .data(8'b0),
				  .wren(1'b0),
				  .q(pixel)
		);
	always_ff @(posedge vgaclk) begin
		if (~rst) begin
			memAddress <= 0;
		end else if (memAddress >= 40000) begin
			memAddress <= 0;
		end else if (enable) begin
			if (memAddress < 40000) begin
				memAddress <= memAddress + 1;
			end
		end
	end
	


endmodule
