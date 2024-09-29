//FSM: que detecta si un jugador ya gano
// Entrada: Matriz del juego, si 3 posiciones ganadoras son iguales se pasa al estado de ganador
// Salida: ganador, liena ganadora y gano
module Ganador(input clk, rst, input[8:0][1:0] matrizDeJuego, output win, output [2:0]linea_ganadora, output [1:0]ganador);
	logic [0:0]estadoActual, estadoSiguiente;
	logic [3:0] auxLinea;
	logic [1:0] auxGanador;
	always_ff@(posedge clk, negedge rst)
		if(!rst)
			estadoActual = 0;
		else
			estadoActual = estadoSiguiente;
		
	always@*
		case(estadoActual)
		0:
			if((matrizDeJuego[0] == matrizDeJuego[1])&&(matrizDeJuego[0] == matrizDeJuego[2]) && matrizDeJuego[0] != 0)begin 
					estadoSiguiente = 1; //0-1-2
					auxLinea = 1;
					auxGanador =matrizDeJuego[0];
				end
				else if((matrizDeJuego[3] == matrizDeJuego[4])&&(matrizDeJuego[3] == matrizDeJuego[5]) && matrizDeJuego[3] != 0)begin 
					estadoSiguiente = 1; //3-4-5
					auxLinea = 2;
					auxGanador =matrizDeJuego[3];
				end 
				else if((matrizDeJuego[6] == matrizDeJuego[7])&&(matrizDeJuego[6] == matrizDeJuego[8]) && matrizDeJuego[6] != 0) begin 
					estadoSiguiente = 1; //6-7-8
					auxLinea = 3;
					auxGanador =matrizDeJuego[6];
				end 
				else if((matrizDeJuego[0] == matrizDeJuego[3])&&(matrizDeJuego[0] == matrizDeJuego[6]) && matrizDeJuego[0] != 0) begin 
					estadoSiguiente = 1; //0-3-6
					auxLinea = 4;
					auxGanador =matrizDeJuego[0];
				end 
				else if((matrizDeJuego[1] == matrizDeJuego[4])&&(matrizDeJuego[1] == matrizDeJuego[7]) && matrizDeJuego[1] != 0) begin 
					estadoSiguiente = 1; //1-4-7
					auxLinea = 5;
					auxGanador =matrizDeJuego[1];
				end 
				else if((matrizDeJuego[2] == matrizDeJuego[5])&&(matrizDeJuego[2] == matrizDeJuego[8]) && matrizDeJuego[2] != 0) begin 
					estadoSiguiente = 1; //2-5-8
					auxLinea = 6;
					auxGanador =matrizDeJuego[2];
				end 
				else if((matrizDeJuego[0] == matrizDeJuego[4])&&(matrizDeJuego[0] == matrizDeJuego[8]) && matrizDeJuego[0] != 0) begin 
					estadoSiguiente = 1; //0-4-8
					auxLinea = 7;
					auxGanador =matrizDeJuego[0];
				end
				else if((matrizDeJuego[2] == matrizDeJuego[4])&&(matrizDeJuego[2] == matrizDeJuego[6]) && matrizDeJuego[2] != 0) begin 
					estadoSiguiente = 1; //2-4-6
					auxLinea = 0;
					auxGanador = matrizDeJuego[2];
				end 
			else begin
				estadoSiguiente = 0;
				auxLinea = 0;
				auxGanador = 0;
			end
		1: estadoSiguiente = 1; //Temporal
		default: estadoSiguiente  = 0;
		endcase
	
	assign win = estadoActual;
	assign linea_ganadora = auxLinea;
	assign ganador = auxGanador;
	
endmodule 