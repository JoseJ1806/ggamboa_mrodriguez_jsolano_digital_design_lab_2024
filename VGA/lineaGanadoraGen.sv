//Modulo encargado de dibujar las lineas ganadoras
module lineaGanadoraGen (
					 input logic [2:0]linea_ganadora,
					 input logic [9:0] cuentaX, cuentaY,
					 input gano,
					 output logic inrect);
					 
		logic temp;
		always @* begin
			case(linea_ganadora)
				0: temp <= (-cuentaY < (3*cuentaX)/4-472) & (-cuentaY > (3*cuentaX)/4-488) & gano;
				1: temp <= (cuentaY > 72) & (cuentaY < 88)& gano;
				2: temp <= (cuentaY > 232) & (cuentaY < 248)& gano;
				3: temp <= (cuentaY > 392) & (cuentaY < 408)& gano;
				4: temp <= (cuentaX > 98) & (cuentaX < 114)& gano;
				5: temp <= (cuentaX > 311) & (cuentaX < 327)& gano;
				6: temp <= (cuentaX > 524) & (cuentaX < 540)& gano;
				7: temp <= (cuentaY > (3*cuentaX)/4-8) & (cuentaY < (3*cuentaX)/4+8) & gano;
				default: temp <= 0;
			endcase
		end
		assign inrect = temp;

endmodule 