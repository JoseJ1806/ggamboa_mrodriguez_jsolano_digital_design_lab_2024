module full_adder (
    input logic a,      // Primer bit de entrada
    input logic b,      // Segundo bit de entrada
    input logic cin,    // Bit de acarreo de entrada
    output logic sum,   // Resultado de la suma
    output logic cout   // Bit de acarreo de salida
);

    // La suma se calcula utilizando la lógica XOR
    assign sum = a ^ b ^ cin;

    // El acarreo de salida se calcula utilizando la lógica AND y OR
    assign cout = (a & b) | (cin & (a ^ b));

endmodule 