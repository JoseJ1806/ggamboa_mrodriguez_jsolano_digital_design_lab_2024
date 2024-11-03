module top (
    input logic clk,
    input logic reset
);
    logic [31:0] PC, Instr, ALUResult, WriteData, ReadData;
    logic MemWrite;
    logic [7:0] address; // Dirección para la RAM
    logic wren;          // Señal de escritura para la RAM

    // Instancia del procesador ARM
    arm processor (
        .clk(clk),
        .reset(reset),
        .PC(PC),
        .Instr(Instr),
        .MemWrite(MemWrite),
        .ALUResult(ALUResult),
        .WriteData(WriteData),
        .ReadData(ReadData)
    );

    // Instancia de la RAM
    ram_dummy ram (
        .address(address),
        .clock(clk),
        .data(WriteData),
        .wren(wren),
        .q(ReadData)
    );

    // Lógica para manejar la dirección y la señal de escritura
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            address <= 0;
            wren <= 0;
        end else begin
            // Asigna dirección de memoria en función de PC
            address <= PC[7:0]; // Usa los 8 bits menos significativos de PC
            wren <= MemWrite;   // Controla la señal de escritura
        end
    end
endmodule
