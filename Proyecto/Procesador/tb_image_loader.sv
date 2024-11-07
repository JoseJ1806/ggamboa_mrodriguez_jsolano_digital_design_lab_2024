`timescale 1 ps / 1 ps

module tb_image_loader;

    // Parámetros
    parameter CLK_PERIOD = 20; // Periodo de reloj en ns (50 MHz)

    // Señales de prueba
    logic clk;
    logic enable;
    logic rst;
    logic [7:0] pixel;

    // Instancia del módulo a probar
    image_loader uut (
        .clk(clk),
        .enable(enable),
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
        enable = 0;
        rst = 1; // Iniciar en estado de reset

        // Esperar un tiempo para permitir la inicialización
        #40; // Esperar dos ciclos de reloj

        rst = 0; // Desactivar el reset
        enable = 1; // Habilitar la lectura

        // Simular por un tiempo suficiente para observar la salida
        for (int i = 0; i < 250000; i++) begin // Simular más de 200000 ciclos para cubrir el rango completo
            #CLK_PERIOD; // Esperar un ciclo de reloj
            
            if (i < 200000) begin
                $display("Cycle: %0d | Pixel Data: %h", i, pixel);
            end else begin
                enable = 0; // Deshabilitar después de alcanzar el límite
            end
        end

        // Finalizar la simulación
        $finish;
    end

endmodule 