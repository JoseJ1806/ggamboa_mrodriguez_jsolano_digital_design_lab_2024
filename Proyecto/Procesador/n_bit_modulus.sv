module n_bit_modulus #(
    parameter N = 2     // Ancho de bits predeterminado
)(
    input logic [N-1:0] dividend,   // Dividendo de N bits
    input logic [N-1:0] divisor,     // Divisor de N bits
    output logic [N-1:0] modulus,    // Resultado del módulo de N bits
    output logic zero_flag,          // Flag de cero
    output logic negative_flag,      // Flag negativo
    output logic overflow_flag,      // Flag de desbordamiento
    output logic carry_flag          // Flag de acarreo
);

    logic [N-1:0] remainder;
    
    // Implementación de la operación módulo
    assign remainder = (divisor != 0) ? dividend % divisor : 0;
    assign modulus = remainder;
    
    // Flags
    assign zero_flag = (modulus == 0) ? 1 : 0;
    assign negative_flag = modulus[N-1];
    assign carry_flag = 0; 
    assign overflow_flag = (divisor == 0) ? 1 : 0; 

endmodule 