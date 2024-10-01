//Modulo para la definicion del sprite del circulo
module sprite_X(input clk,
                   input [9:0] posx,posy,pixelx, pixely,
						 output [23:0] RGB,
						 output visible);
		
		logic [5:0] rom_addr;
		reg [63:0] rom_data;
		ROM_X rom(rom_addr, rom_data);
		spritePosition position(posx, posy, pixelx, pixely, rom_data, rom_addr, visible);
		assign RGB =24'hFF0000;
endmodule
