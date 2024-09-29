//Modulo que dibuja las linas que delimitan las casillas
module lineas(input logic [9:0]cuentaX,cuentaY,
				  output logic enable);
				  
		assign enable = ((cuentaX > 213) & (cuentaX < 229) | (cuentaX > 426) & (cuentaX < 442) | (cuentaY > 160) & (cuentaY < 176) | (cuentaY > 320) & (cuentaY < 336))? 1:0;


endmodule
