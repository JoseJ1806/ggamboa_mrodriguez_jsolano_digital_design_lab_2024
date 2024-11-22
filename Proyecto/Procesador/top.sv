module top(
    input logic clk,
	 input logic rst,
	 input logic switch,
    output logic vgaclk,
    output logic hsync, vsync,
    output logic sync_b, blank_b,
    output logic [7:0] r, g, b,
    output logic [9:0] x, y,
	 output logic [31:0] memAddress, pixel
);

	logic enable;
	logic [31:0] memAddress1, memAddress2;
	
	assign enable = (x < 400 & x >= 0) & (y < 200 & y >= 0);
	
	

    // Instanciación del PLL para generar el reloj VGA
	 
	 
	 pll vgapll(.inclk0(clk), .c0(vgaclk));
	 vgaController vgaCont(vgaclk, hsync, vsync, sync_b, blank_b, x, y);
	 generate_graphic gen_grid(x, y, pixel, r, g, b);
	 CPU CPU_inst(clk,rst,memAddress,pixel);
	
	always_ff @(posedge vgaclk) begin
		if (rst) begin
			memAddress1 <= 0;
		end else if (memAddress1 >= 80000) begin
			memAddress1 <= 0;
		end else if (enable) begin
			if (memAddress1 < 80000) begin
				memAddress1 <= memAddress1 + 1;
			end
		end
	end
	
	always_ff @(posedge vgaclk) begin
		if (rst) begin
			memAddress2 <= 0;
		end else if (memAddress2 == 40000) begin
			memAddress2 <= 80000;
		end else if (memAddress2 >= 120000) begin
			memAddress2 <= 0;
		end else if (enable) begin
			if (memAddress2 < 120000) begin
				memAddress2 <= memAddress2 + 1;
			end
		end
	end
	mux2 (#32) muxfilter(memAddress1, memAddress2, switch, memAddress); 
	 

endmodule 