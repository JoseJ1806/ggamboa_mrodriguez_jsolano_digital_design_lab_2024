// testbench.sv
`timescale 1ns/1ps

module testbench();
    // Parametros para la ROM y RAM
    localparam ROM_ADDR_WIDTH = 13;
    localparam ROM_DATA_WIDTH = 8;
    localparam RAM_ADDR_WIDTH = 16;
    localparam RAM_DATA_WIDTH = 24;
    
    // Señales de ROM
    reg  [ROM_ADDR_WIDTH-1:0] rom_address_a, rom_address_b;
    reg                       rom_clock;
    wire [ROM_DATA_WIDTH-1:0] rom_q_a, rom_q_b;
    
    // Señales de RAM
    reg  [RAM_ADDR_WIDTH-1:0] ram_address_a, ram_address_b;
    reg                       ram_clock;
    reg  [RAM_DATA_WIDTH-1:0] ram_data_a, ram_data_b;
    reg                       ram_wren_a, ram_wren_b;
    wire [RAM_DATA_WIDTH-1:0] ram_q_a, ram_q_b;
    
    // Instancia de la ROM
    rom1 rom_inst (
        .address_a(rom_address_a),
        .address_b(rom_address_b),
        .clock(rom_clock),
        .q_a(rom_q_a),
        .q_b(rom_q_b)
    );
    
    // Instancia de la RAM
    ram1 ram_inst (
        .address_a(ram_address_a),
        .address_b(ram_address_b),
        .clock(ram_clock),
        .data_a(ram_data_a),
        .data_b(ram_data_b),
        .wren_a(ram_wren_a),
        .wren_b(ram_wren_b),
        .q_a(ram_q_a),
        .q_b(ram_q_b)
    );
    
    // Generador de reloj
    initial begin
        rom_clock = 0;
        ram_clock = 0;
        forever begin
            #5 rom_clock = ~rom_clock;
            #5 ram_clock = ~ram_clock;
        end
    end
    
    // Proceso de pruebas
    initial begin
        // Inicialización de señales
        rom_address_a = 0;
        rom_address_b = 1;
        
        ram_address_a = 0;
        ram_address_b = 1;
        ram_data_a = 24'hAABBCC;
        ram_data_b = 24'h112233;
        ram_wren_a = 0;
        ram_wren_b = 0;
        
        // Espera a que el reloj se estabilice
        #10;
        
        // Lectura de datos de ROM
        $display("Lectura de ROM:");
        repeat (5) begin
            #10;
            $display("ROM Address A = %0d, Data = %h", rom_address_a, rom_q_a);
            $display("ROM Address B = %0d, Data = %h", rom_address_b, rom_q_b);
            rom_address_a = rom_address_a + 1;
            rom_address_b = rom_address_b + 1;
        end
        
        // Escritura en RAM
        #10;
        $display("Escritura en RAM:");
        ram_wren_a = 1;
        ram_wren_b = 1;
        #10;
        ram_wren_a = 0;
        ram_wren_b = 0;
        
        // Lectura de datos de RAM
        $display("Lectura de RAM:");
        repeat (5) begin
            #10;
            $display("RAM Address A = %0d, Data = %h", ram_address_a, ram_q_a);
            $display("RAM Address B = %0d, Data = %h", ram_address_b, ram_q_b);
            ram_address_a = ram_address_a + 1;
            ram_address_b = ram_address_b + 1;
        end
        
        // Fin de la simulación
        #10;
        $stop;
    end
endmodule
