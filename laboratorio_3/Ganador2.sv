module Ganador2(input clk, rst, input[8:0][1:0] matrizDeJuego, output win, output [2:0]linea_ganadora, output [1:0]ganador);
	logic [0:0]estadoActual, estadoSiguiente;
	logic juego;
	always_ganador(matrizDeJuego, juego, linea_ganadora, ganador);
	always_ff@(posedge clk, negedge rst)
		if(!rst)
			estadoActual = 0;
		else
			estadoActual = estadoSiguiente;
	always_comb
		case(estadoActual)
		0: if(juego) estadoSiguiente = 1; else estadoSiguiente = 0;
		1: estadoSiguiente = 1;
		default: estadoSiguiente  = 0;
		endcase
	
	assign win = (estadoActual==1);
	
endmodule 