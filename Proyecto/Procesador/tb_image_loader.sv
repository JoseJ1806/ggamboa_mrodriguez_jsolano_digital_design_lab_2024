`timescale 1 ps / 1 ps

module tb_image_loader;

    // Parámetros
    parameter CLK_PERIOD = 20; // Periodo de reloj en ns (50 MHz)

    // Señales de prueba
    logic clk;
    //logic enable;
    logic inrectImage,x, y;
	 logic [15:0] memAddress;
    logic [7:0] r,g,b;

    // Instancia del módulo a probar
    image_loader uut (
		  .memAddress(memAddress),
        .clk(clk),
		  .inrectImage(inrectImage),
		  .x(x),
		  .y(y),
        .r(r),
		  .g(g),
		  .b(b)
    );

    // Generación del reloj
    initial begin
        clk = 0;
        forever #(CLK_PERIOD / 2) clk = ~clk; // Toggle clock every half period
    end

    // Inicialización del testbench
    initial begin
        // Inicializar señales

        // Esperar un tiempo para permitir la inicialización

        inrectImage = 1; // Desactivar el reset

        // Simular por un tiempo suficiente para observar la salida
        for (int i = 0; i < 120000; i++) begin // Simular más de 200000 ciclos para cubrir el rango completo
            #CLK_PERIOD; // Esperar un ciclo de reloj
            if (i < 120000) begin
                $display("Cycle: %0d | r: %h |g: %h |b: %h | x: %h | y: %h", i, r,g,b,x,y);
            end else begin
            end
        end

        // Finalizar la simulación
        $finish;
    end

endmodule 