module temporizador(
    input clk, 
    input rst, 
    input guardado, 
    input gano, 
    output logic tiempo, 
    output logic [7:0] posicion_ra, 
    output logic [6:0] display_decenas,
    output logic [6:0] display_unidades
); 
    reg [31:0] contador = 0;
    reg [7:0] rnd = 1;
    reg [31:0] segundos = 0; // Registro para almacenar los segundos totales
    reg [31:0] tiempo_restante = 0; // Registro para almacenar el tiempo restante
    reg [3:0] decenas;
    reg [3:0] unidades;
    
    // LFSR module instance
    LFSR lfsr(clk, rst, rnd);
    
    // Bloque secuencial para manejar el contador y los segundos
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            contador <= 0;
            segundos <= 0;
        end else if (guardado) begin
            contador <= 0;
            segundos <= 0;
        end else begin
            contador <= contador + 1;
            if (contador == 25000000) begin // Cada 1 segundo
                segundos <= segundos + 1;
            end
            if (contador == 375000000) begin
                if (rnd != 0) begin
                    posicion_ra <= rnd;
                    contador <= 0;
                    tiempo <= !gano;
                    segundos <= 0;
                end else begin
                    posicion_ra <= 1;
                    contador <= 0;
                    tiempo <= !gano;
                    segundos <= 0;
                end
            end else begin
                tiempo <= 0;
            end
        end
    end
    
    // Bloque combinacional para calcular el tiempo restante
    always_comb begin
        tiempo_restante = 15 - segundos; // Calcula el tiempo restante
        decenas = (tiempo_restante / 10) % 10; // Decenas de segundos
        unidades = tiempo_restante % 10;       // Unidades de segundos
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
