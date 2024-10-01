//Modulo encargado de selccionar el texto ganador o de empate dependiendo de la matriz de juego
module muxSeleccionadorGanador ( input logic [9:0] posX,posY,cuentaX,cuentaY,
								 input clk, gano, empate, 
								 input logic [1:0]ganador,
                         output visible, 
								 output logic [23:0]rgb);
		
		logic visible_sprite1,visible_sprite2, visible_sprite3;
		logic [23:0] rgb1, rgb2, rgb3;
						 
		sprite_X_Ganador  Jugador1 (clk, gano, cuentaX, cuentaY, posX, posY,rgb1,visible_sprite1);
			
		sprite_Circle_Ganador Jugador2 (clk, gano, cuentaX, cuentaY, posX, posY,rgb2,visible_sprite2);
		
		sprite_Empate empatados(clk, empate, cuentaX, cuentaY, posX, posY,rgb3,visible_sprite3);
								 
		always @* begin
				if (empate)begin
					visible <= visible_sprite3; 
					rgb <= rgb3;
				end
				else
				case(ganador)
				0: begin 
						visible <= 0; 
						rgb <= 24'b000000000000000000000000;
					end
				1: begin 
						visible <= visible_sprite1; 
						rgb <= rgb1;
					end
				2: begin 
						visible <= visible_sprite2; 
						rgb <= rgb2;
					end
				default: begin 
					visible <= 0; 
					rgb <= 24'b000000000000000000000000;
					end
			endcase
		end

endmodule