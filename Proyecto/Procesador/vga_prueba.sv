module vga_prueba(
    input logic clk,
	 input logic rst,
    output logic vgaclk,
    output logic hsync, vsync,
    output logic sync_b, blank_b,
    output logic [7:0] r, g, b,
    output logic [9:0] x, y,
	 output logic [15:0] memAddress
);

	logic enable;
	
	assign enable = (x < 200 & x >= 0) & (y < 200 & y >= 0);
	
	

    // Instanciación del PLL para generar el reloj VGA
	 
	 pll vgapll(.inclk0(clk), .c0(vgaclk));
	 generate_rectangle rectImage(x, y, 0, 0, 10'd200, 10'd200, inrectImage);
	 vgaController vgaCont(vgaclk, hsync, vsync, sync_b, blank_b, x, y);
	 //generate_graphic gen_grid(x, y, pixel_data, r, g, b);
	 image_loader image(memAddress,clk,inrectImage,x, y,r, g, b);
	 
	 

endmodule 