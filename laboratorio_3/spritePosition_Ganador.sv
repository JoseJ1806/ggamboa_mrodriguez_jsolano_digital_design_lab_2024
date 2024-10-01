module spritePosition_Ganador(input [9:0] posx,posy,pixelx, pixely, input [89:0] rom_data, input gano, output [3:0] rom_addr, output visible);
	logic [6:0] rom_col;
	logic rom_bit, sq_circle_on;
	logic [9:0] x_l, x_r, y_t, y_b;
	assign x_l = pixelx;
	assign x_r = pixelx+89;
	assign y_t = pixely;
	assign y_b = pixely+15;
	assign sq_on =
		(x_l<=posx) && (posx<=x_r) &&
		(y_t<=posy) && (posy<=y_b);
	assign rom_addr = posy-y_t;
	assign rom_col = x_r-posx;
	assign rom_bit = rom_data[rom_col];
	assign visible = sq_on & rom_bit & gano;

endmodule 