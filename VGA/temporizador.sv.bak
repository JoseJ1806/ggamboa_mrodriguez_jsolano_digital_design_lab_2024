module temporizador(input clk, rst, guardado, gano, output tiempo, output [7:0] posicion_ra);
	reg [31:0] contador = 0;
	reg [7:0] rnd = 1;
	LFSR lfsr(clk, rst, rnd);
	always@(posedge clk, negedge rst)begin
		if (!rst) contador = 0;
		else if(guardado) contador = 0;
		else begin
			contador = contador+1;
			if(contador == 375000000)begin
				if (rnd !=0) begin
					posicion_ra <= rnd;
					contador = 0;
					tiempo <= !gano;
				end
				else
					posicion_ra <= 1;
					contador = 0;
					tiempo <= !gano;
			end
			else
				tiempo <=0;
		end
	end
endmodule 