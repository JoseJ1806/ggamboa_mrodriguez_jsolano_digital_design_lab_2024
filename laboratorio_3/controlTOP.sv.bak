//Modulo que controla la generacion de video y logica del juego
module controlTOP (input logic boton_Casilla, boton_Sel,boton_rst,clk,
						input logic [9:0] cuentaX,cuentaY,
						 output logic [7:0] r,g,b, output gano);
			//Defnicion de variables para las MSF y distintos modulos
			logic boton_Seleccionador, boton_Cuenta_Casilla;
			
			buttonBouncer bouncer_Sel(clk, boton_rst, boton_Sel, boton_Sel_lo);
			buttonBouncer bouncer_Casilla(clk, boton_rst, boton_Casilla, boton_Casilla_lo);
			
			assign boton_Seleccionador = boton_Sel_lo && !gano && !empate;
			assign boton_Cuenta_Casilla = boton_Casilla_lo && !gano && !empate;
			logic termino;
			assign termino = gano || empate;
			logic [2:0]linea_ganadora;
			logic [3:0]contador;
			logic [1:0]contador_seleccionador, ganador;
			logic [23:0] rgb0,rgb1,rgb2,rgb3,rgb4,rgb5,rgb6,rgb7,rgb8, rgb_texto;
			logic visible0,visible1,visible2,visible3,visible4,visible5,visible6,visible7,visible8,visiblelineas,visible_rectangulo, visible_lineaganadora, visible_texto;
			logic [8:0][1:0]rdData;

			 Turnos turno(clk, boton_rst, boton_Seleccionador, guardado, contador_seleccionador);
			 Mover move(clk, boton_rst, boton_Cuenta_Casilla, contador);
			  
			 rectgen seleccionador (clk, boton_rst,contador,cuentaX,cuentaY,0,130,180,140,visible_rectangulo);
			 temporizador tempo(clk, boton_rst, guardado, termino, tiempo, posicion_ra);
			 
			 regfile1x24b memoria_Casillas(clk,boton_rst, boton_Seleccionador, tiempo, contador_seleccionador,contador, rdData, guardado); // Se guardó en memoria cual sprite va en esa casilla.
			 
			 //------------------------------Casilla 0 --------------------------------------------//
			 
			 
			 muxSeleccionador casilla0 (106,80,cuentaX,cuentaY, clk,rdData[0],visible0,rgb0); // Selecciona cual sprite se usará en dicha casilla
				           																												
			  
			//------------------------------Casilla 1 --------------------------------------------//
			 
			 
			 muxSeleccionador casilla1 (318,80, cuentaX,cuentaY,clk,rdData[1],visible1,rgb1);
			 
			 
			 //------------------------------Casilla 2 --------------------------------------------//
			 
			 
			 muxSeleccionador casilla2 (530,80,cuentaX,cuentaY, clk,rdData[2],visible2,rgb2);
			 
			 //------------------------------Casilla 3 --------------------------------------------//
			 
			 
			 muxSeleccionador casilla3 (106,240,cuentaX,cuentaY, clk,rdData[3],visible3,rgb3);
			 
			 
			 //------------------------------Casilla 4 --------------------------------------------//
			 
			 
			 muxSeleccionador casilla4 (318,240,cuentaX,cuentaY, clk,rdData[4],visible4,rgb4);
			 
			 
			 //------------------------------Casilla 5 --------------------------------------------//
			 
			 
			 muxSeleccionador casilla5 (530,240, cuentaX,cuentaY,clk,rdData[5],visible5,rgb5);
			 
			 
			 //------------------------------Casilla 6 --------------------------------------------//

			 
			 muxSeleccionador casilla6 (106,400,cuentaX,cuentaY, clk,rdData[6],visible6,rgb6);
			 
			 
			 //------------------------------Casilla 7 --------------------------------------------//
			 
			 
			 muxSeleccionador casilla7 (318,400, cuentaX,cuentaY,clk,rdData[7],visible7,rgb7);
			 
			 
			 //------------------------------Casilla 8 --------------------------------------------//
			 
			 
			 muxSeleccionador casilla8 (530,400,cuentaX,cuentaY, clk,rdData[8],visible8,rgb8);
			 
			 
			 //------------------------------Lineas--------------------------------------------//
			 
			 lineas CuatroLineas (cuentaX,cuentaY,visblelineas);
			 	 
			//------------------------------Instancia de la lógica del juego--------------------//
			
			Ganador2 ganador_(clk, boton_rst,rdData, gano, linea_ganadora, ganador);
			
			//------------------------------Linea ganadora y ganador--------------------//
			
			lineaGanadoraGen lineaganadora(linea_ganadora, cuentaX, cuentaY, gano, visible_lineaganadora);
			
			logic empate;
			assign empate = (rdData[0] != 0) && (rdData[1] != 0) && (rdData[2] != 0)&& (rdData[3] != 0)&& (rdData[4] != 0)&& (rdData[5] != 0)
			&& (rdData[6] != 0)&& (rdData[7] != 0)&& (rdData[8] != 0)&& !gano;
			
			muxSeleccionadorGanador texto_ganador(0, 143, cuentaX, cuentaY, clk, gano, empate, ganador, visible_texto, rgb_texto);
			
			//------------------------------Seleccion de color--------------------------------------------//
																											
			 			
			 mux_9a1 (rgb0,rgb1,rgb2,rgb3,rgb4,rgb5,rgb6,rgb7,rgb8, rgb_texto,lineas,
					visible_rectangulo,visible0,visible1,visible2,visible3,visible4,visible5,visible6,visible7,visible8,visblelineas, visible_lineaganadora,visible_texto,
					r,g,b);
					 
						 
endmodule
