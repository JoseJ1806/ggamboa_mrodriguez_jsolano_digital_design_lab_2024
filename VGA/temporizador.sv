module temporizador(
    input clk, 
    input rst, 
    input guardado, 
    input gano, 
    output tiempo, 
    output [7:0] posicion_ra, 
    output logic [6:0] display_decenas,
    output logic [6:0] display_unidades
); 
    reg [31:0] contador = 0;
    reg [7:0] rnd = 1;
    reg [31:0] segundos = 0; // Registro para almacenar los segundos totales
    logic [3:0] decenas;
    logic [3:0] unidades;
    
    // LFSR module instance
    LFSR lfsr(clk, rst, rnd);
	 
	 
	 always@(posedge clk, negedge rst)begin
		if (!rst) begin 
			contador = 0; 
			segundos = 0; 
		end
		else if(guardado) begin 
			contador = 0; 
			segundos = 0;
		end
		else begin
			contador = contador+1;
			if(contador == 25000000) begin // Cada 1 segundo
				segundos = segundos + 1;
				contador = 0;	
			end
			if(segundos == 15)begin
				if (rnd !=0) begin
					posicion_ra <= rnd;
					contador = 0;
					segundos = 0;
					tiempo <= !gano;
					
				end
				else
					posicion_ra <= 1;
					contador = 0;
					segundos = 0;
					tiempo <= !gano;
					
			end
			else
				tiempo <=0;
		end
		
	end
	 

    
    // Bloque combinacional para calcular el tiempo restante
	always_comb begin
	
      logic [31:0] tiempo_restante_calc;
		
		decenas = 0;
		unidades = 0;
		
		if (gano) begin
        // Si el juego ha terminado, decenas y unidades son cero
			decenas = 0;
         unidades = 0;
		end else begin
        // Calcula el tiempo restante si no ha terminado
        tiempo_restante_calc = 15 - segundos;
        decenas = (tiempo_restante_calc / 10) % 10; // Decenas de segundos
        unidades = tiempo_restante_calc % 10;       // Unidades de segundos
		  end
    end
    
    // Conversión de decenas y unidades a 7 segmentos
    always_comb begin
        // Display de las decenas
        case (decenas)
            4'd0: display_decenas = 7'b1000000; // 0
            4'd1: display_decenas = 7'b1111001; // 1
            4'd2: display_decenas = 7'b0100100; // 2
            4'd3: display_decenas = 7'b0110000; // 3
            4'd4: display_decenas = 7'b0011001; // 4
            4'd5: display_decenas = 7'b0010010; // 5
            4'd6: display_decenas = 7'b0000010; // 6
            4'd7: display_decenas = 7'b1111000; // 7
            4'd8: display_decenas = 7'b0000000; // 8
            4'd9: display_decenas = 7'b0010000; // 9
            default: display_decenas = 7'b1111111; // Apagado
        endcase

        // Display de las unidades
        case (unidades)
            4'd0: display_unidades = 7'b1000000; // 0
            4'd1: display_unidades = 7'b1111001; // 1
            4'd2: display_unidades = 7'b0100100; // 2
            4'd3: display_unidades = 7'b0110000; // 3
            4'd4: display_unidades = 7'b0011001; // 4
            4'd5: display_unidades = 7'b0010010; // 5
            4'd6: display_unidades = 7'b0000010; // 6
            4'd7: display_unidades = 7'b1111000; // 7
            4'd8: display_unidades = 7'b0000000; // 8
            4'd9: display_unidades = 7'b0010000; // 9
            default: display_unidades = 7'b1111111; // Apagado
        endcase
    end

endmodule 