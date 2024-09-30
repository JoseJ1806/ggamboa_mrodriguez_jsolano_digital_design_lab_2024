//Modulo definido para colocar los sprites de los jugadores en las ubicaciones deseadas
module spritePosition(input [9:0] posx,posy,pixelx, pixely, input [63:0] rom_data, output [5:0] rom_addr, output visible);
	logic [5:0] rom_col;
	logic rom_bit, sq_circle_on;
	logic [9:0] x_l, x_r, y_t, y_b;
	assign x_l = pixelx-31;
	assign x_r = pixelx+32;
	assign y_t = pixely-31;
	assign y_b = pixely+32;
	assign sq_on =
		(x_l<=posx) && (posx<=x_r) &&
		(y_t<=posy) && (posy<=y_b);
	assign rom_addr = posy[5:0]-y_t[5:0];
	assign rom_col = posx[5:0]-x_l[5:0];
	assign rom_bit = rom_data[rom_col];
	assign visible = sq_on & rom_bit;

endmodule 