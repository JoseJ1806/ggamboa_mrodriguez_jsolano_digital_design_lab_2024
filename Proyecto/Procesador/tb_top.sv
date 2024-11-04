`timescale 1ns/1ps

module tb_top;

    // Señales del módulo
    logic clk;
    logic reset;
    logic [31:0] WriteData;
    logic [31:0] DataAdr;
    logic MemWrite;

    // Instanciar el módulo `top`
    top dut (
        .clk(clk),
        .reset(reset),
        .WriteData(WriteData),
        .DataAdr(DataAdr),
        .MemWrite(MemWrite)
    );

    // Reloj
    always #5 clk = ~clk;

    // Prueba
    initial begin
        // Inicializar las señales
        clk = 0;
        reset = 1;
        #10;
        
        // Liberar reset
        reset = 0;
        #10;
		  dut.imem.Instr = 32'hE2801001; // ADD R1, R0, #1
        #10
        dut.imem.Instr = 32'hE5801000; // STR R1, [R0, #0]
		  #10
	  
	  // Finalizar la simulación
        $finish;
    end

endmodule
