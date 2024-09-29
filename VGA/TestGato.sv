module TestGato();
	logic clk, rst, sel, move, clk_25, H_SYNC, V_SYNC,SYNC_B, SYNC_BLANK, gano;
	logic [7:0]r,g,b;
	vga VGA(clk, move, sel, rst, clk_25, H_SYNC, V_SYNC,SYNC_B, SYNC_BLANK, r, g, b, gano);
	
	initial begin
		rst = 1; #5;
		clk = 0; #5;
		sel = 1; #5;
		move = 1;#5;
	end
	
	always begin
	//Movida 1
		move = 0; #5;
		move = 1; #5;
		sel = 0; #5;
		sel = 1; #5;
	//Movida 2
		move = 0; #5;
		move = 1; #5;
		sel = 0; #5;
		sel = 1; #5;
	//Movida 3	
		move = 0; #5;
		move = 1; #5;
		sel = 0; #5;
		sel = 1; #5;
	//Movida 4	
		move = 0; #5;
		move = 1; #5;
		sel = 0; #5;
		sel = 1; #5;
	
	end
	
	
	always begin
		clk = ~clk; #5;
	end
endmodule 