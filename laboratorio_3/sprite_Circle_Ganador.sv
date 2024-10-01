module sprite_Circle_Ganador(input clk, gano,
                   input [9:0] posx,posy,pixelx, pixely,
						 output [23:0] RGB,
						 output visible);
		
		logic [3:0] rom_addr;
		reg [89:0] rom_data;
		ROM_Circle_Ganador rom(rom_addr, rom_data);
		spritePosition_Ganador position(posx, posy, pixelx, pixely, rom_data, gano, rom_addr, visible);
		assign RGB =24'h00FFFF;
endmodule
