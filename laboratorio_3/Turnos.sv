//module Turnos (input clk, rst, jugado, tiempo, output salida);
module Turnos (input clk, rst, jugado, guardado, output salida);
	buttonBouncer bouncer(clk, rst, jugado, level_out); 
	logic estadoActual, estadoSiguiente;
	always_ff @(posedge clk or negedge rst)
	if(!rst)
		estadoActual = 0;
	else
		estadoActual = estadoSiguiente;
		
	always_comb
	case(estadoActual)
		/*0: if (jugado||tiempo) estadoSiguiente = 1; else estadoSiguiente = 0;
		1: if (tiempo||jugado) estadoSiguiente = 0; else estadoSiguiente = 1;*/
		0: if (guardado) estadoSiguiente = 1; else estadoSiguiente = 0;
		1: if (guardado) estadoSiguiente = 0; else estadoSiguiente = 1;
		default: estadoSiguiente = 0;
	endcase
	
	assign salida = estadoActual;
endmodule 