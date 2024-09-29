//Modulo que genera el rectangulo de seleccion en cada una de las casillas dependiendo de la posicion
module rectgen (input logic clk,boton_rst,
					 input logic [3:0]contador,
					 input logic [9:0] cuentaX, cuentaY,left,top,right,bot,
					 output logic inrect);
					 
		logic temp;
		always @* begin
			case(contador)
				0: temp <= ((cuentaX > left) & (cuentaX < right) & (cuentaY > top)  & (cuentaY < bot)) ? 1:0;
				1: temp <= ((cuentaX > left + 233) & (cuentaX < right + 233) & (cuentaY > top) & (cuentaY < bot)) ? 1:0;	
				2: temp <= ((cuentaX > left + 456) & (cuentaX < right + 456) & (cuentaY > top) & (cuentaY < bot)) ? 1:0;
				3: temp <= ((cuentaX > left ) & (cuentaX < right) & (cuentaY > top + 175) & (cuentaY < bot + 175)) ? 1:0;
				4: temp <= ((cuentaX > left + 233) & (cuentaX < right + 233) & (cuentaY > top + 175) & (cuentaY < bot + 175)) ? 1:0;
				5: temp <= ((cuentaX > left + 456) & (cuentaX < right + 456) & (cuentaY > top + 175) & (cuentaY < bot + 175)) ? 1:0;
				6: temp <= ((cuentaX > left) & (cuentaX < right) & (cuentaY > top + 340) & (cuentaY < bot + 340)) ? 1:0;
				7: temp <= ((cuentaX > left + 233) & (cuentaX < right + 233) & (cuentaY > top + 340) & (cuentaY < bot + 340)) ? 1:0;
				8: temp <= ((cuentaX > left + 456) & (cuentaX < right + 456) & (cuentaY > top + 340) & (cuentaY < bot + 340)) ? 1:0;
				default: temp <= ((cuentaX > left) & (cuentaX < right) & (cuentaY > top)  & (cuentaY < bot)) ? 1:0;
			endcase
		end
		assign inrect = temp;

endmodule
