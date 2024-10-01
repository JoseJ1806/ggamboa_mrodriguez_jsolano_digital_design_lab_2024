//Modulo que selecciona cual sprite se tiene que dibujar en una casilla
module muxSeleccionador ( input logic [9:0] posX,posY,cuentaX,cuentaY,
								 input clk,
								 input logic [1:0]contadorTurno,
                         output visible, 
								 output logic [23:0]rgb);
		
		logic visible_sprite1,visible_sprite2;
		logic [23:0] rgb1, rgb2;
						 
		sprite_X  Jugador1 (clk, cuentaX, cuentaY, posX, posY,rgb1,visible_sprite1);
			
		sprite_Circle Jugador2 (clk, cuentaX, cuentaY, posX, posY,rgb2,visible_sprite2);
								 
		always @* begin
				case(contadorTurno)
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
