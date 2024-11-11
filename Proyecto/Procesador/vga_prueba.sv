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
	logic [31:0] WriteData, DataAdr, ReadData;
	logic MemWrite;
	
	assign enable = (x < 200 & x >= 0) & (y < 200 & y >= 0);
	
	

    // Instanciación del PLL para generar el reloj VGA
	 
	 
	 pll vgapll(.inclk0(clk), .c0(vgaclk));
	 vgaController vgaCont(vgaclk, hsync, vsync, sync_b, blank_b, x, y);
	 generate_graphic gen_grid(x, y, pixel, r, g, b);
	 
	 
	  CPU CPU_inst(.clk(clk), 
					 .vga_clk(vgaclk),
					 .reset(rst), 
					 .enable(enable),
					 .WriteData(WriteData), 
					 .DataAdr(DataAdr), 
					 .ReadData(ReadData), 
					 .MemWrite(MemWrite),
					 .pixel(pixel),
					 .x(memAddress)
	);
	 

endmodule 