`timescale 1 ps / 1 ps

module tb_image_loader;

    // Parámetros
    parameter CLK_PERIOD = 20; // Periodo de reloj en ns (50 MHz)

    // Señales de prueba
    logic clk;
    //logic enable;
    logic rst,x, y;
    logic [7:0] pixel;

    // Instancia del módulo a probar
    image_loader uut (
        .clk(clk),
		  .x(x),
		  .y(y),
        .rst(rst),
        .pixel(pixel)
    );

    // Generación del reloj
    initial begin
        clk = 0;
        forever #(CLK_PERIOD / 2) clk = ~clk; // Toggle clock every half period
    end

    // Inicialización del testbench
    initial begin
        // Inicializar señales
        rst = 1; // Iniciar en estado de reset

        // Esperar un tiempo para permitir la inicialización
        #40; // Esperar dos ciclos de reloj

        rst = 0; // Desactivar el reset

        // Simular por un tiempo suficiente para observar la salida
        for (int i = 0; i < 40000; i++) begin // Simular más de 200000 ciclos para cubrir el rango completo
            #CLK_PERIOD; // Esperar un ciclo de reloj
            if (i < 40000) begin
                $display("Cycle: %0d | Pixel Data: %h | x: %h | y: %h", i, pixel,x,y);
            end else begin
            end
        end

        // Finalizar la simulación
        $finish;
    end

endmodule 