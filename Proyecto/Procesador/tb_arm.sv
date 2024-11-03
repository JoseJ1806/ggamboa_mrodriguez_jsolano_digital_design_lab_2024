module tb_arm;
  // Entradas y salidas para el procesador
  logic clk, reset;
  logic [31:0] Instr, ReadData;
  logic [31:0] PC, ALUResult, WriteData;
  logic MemWrite;

  // Instancia del procesador
  arm uut (
    .clk(clk),
    .reset(reset),
    .PC(PC),
    .Instr(Instr),
    .MemWrite(MemWrite),
    .ALUResult(ALUResult),
    .WriteData(WriteData),
    .ReadData(ReadData)
  );

  // Generación de reloj
  always #5 clk = ~clk;

  initial begin
    // Inicializa señales
    clk = 0;
    reset = 1;
    Instr = 0;
    ReadData = 0;

    // Libera reset después de algunos ciclos
    #10 reset = 0;

    // Ejemplo de estímulo para probar ADD y STR
    // Setea la instrucción y el valor de datos de lectura para STR
    #10 Instr = 32'hE0800001; // ADD R0, R0, R1
    #10 Instr = 32'hE5803004; // STR R3, [R0, #4]

    // Aquí puedes cambiar el valor de ReadData si quieres simular datos leídos de memoria
    #10 ReadData = 32'h00000010;

    // Finaliza la simulación después de varios ciclos para observar el comportamiento
    #100 $finish;
  end
endmodule

