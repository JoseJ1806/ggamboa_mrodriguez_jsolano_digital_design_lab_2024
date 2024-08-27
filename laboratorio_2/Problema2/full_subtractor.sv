module full_subtractor (
    input logic a,      // Primer bit (minuendo)
    input logic b,      // Segundo bit (sustraendo)
    input logic bin,    // Bit de préstamo de entrada
    output logic diff,  // Resultado de la resta
    output logic bout    // Bit de préstamo de salida
);

    // La diferencia se calcula usando XOR
    assign diff = a ^ b ^ bin;

    // El préstamo de salida se calcula usando la lógica AND y OR
    assign bout = (~a & b) | (bin & (~a | b));

endmodule