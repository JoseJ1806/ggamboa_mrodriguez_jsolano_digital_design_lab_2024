module sprite_Empate(input clk, gano,
                   input [9:0] posx,posy,pixelx, pixely,
						 output [23:0] RGB,
						 output visible);
		
		logic [3:0] rom_addr;
		reg [107:0] rom_data;
		ROM_Empate rom(rom_addr, rom_data);
		spritePosition_Empate position(posx, posy, pixelx, pixely, rom_data, gano, rom_addr, visible);
		assign RGB =24'hFFFFFF;
endmodule