//Modulo top, esta conformado por el divisor de clk, el controlador de la vga, la generacion de video y logica del juego
module VGA (input logic clk,
			   input logic boton,boton2,boton3,
            output logic clk_25,
				output logic H_SYNC, V_SYNC,
				output logic SYNC_B, SYNC_BLANK,
				output logic [7:0]r,g,b,
				output gano,
				output logic [6:0] display_decenas,
				output logic [6:0] display_unidades);
				
				
		logic [9:0] cuentaX,cuentaY;
			
		
//--------------Instancia del divisor de clock-------------------------//
		divisorClk dv(clk,clk_25);

//--------------Instancia del controlador VGA--------------------------//		
		controladorVGA cntVGA (clk_25,H_SYNC,V_SYNC,SYNC_B,SYNC_BLANK, cuentaX,cuentaY);
		
//--------------Instancia del generador de Video y lógica del juego----------------------//	
		controlTOP control (boton,boton2,boton3,clk_25,cuentaX,cuentaY,r,g,b, gano,display_decenas,display_unidades);
		

endmodule
