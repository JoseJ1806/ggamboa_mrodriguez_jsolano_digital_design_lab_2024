module vga_prueba(
    input logic clk,
	 input logic rst,
    output logic vgaclk,
    output logic hsync, vsync,
    output logic sync_b, blank_b,
    output logic [7:0] r, g, b,
    output logic [9:0] x, y,
	 output logic [31:0] memAddress, pixel
);

	logic enable;
	
	assign enable = (x < 200 & x >= 0) & (y < 200 & y >= 0);
	
	

    // Instanciación del PLL para generar el reloj VGA
	 
	 
	 pll vgapll(.inclk0(clk), .c0(vgaclk));
	 vgaController vgaCont(vgaclk, hsync, vsync, sync_b, blank_b, x, y);
	 generate_graphic gen_grid(x, y, pixel, r, g, b);
	 CPU CPU_inst(clk,rst,memAddress,pixel);
	
	always_ff @(posedge vgaclk) begin
		if (rst) begin
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