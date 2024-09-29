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

    always_ff @(dividend, divisor) begin
        // Inicializar flags
        overflow_flag = 1'b0; // Inicializar a 0
        carry_flag = 1'b0;     // Inicializar a 0

        // Comprobar si el divisor es cero
        if (divisor == 0) begin
            modulus = 'X; // Indicar error
            overflow_flag = 1'b1; // Activar flag de desbordamiento
        end else begin
            // Realizar la operación de módulo
            modulus = dividend % divisor;

            // Flags
            zero_flag = (modulus == 0); // Flag de cero
            negative_flag = modulus[N-1]; // Flag negativo

            // Definir el flag de acarreo
            carry_flag = (modulus < divisor); // Se activa si el resultado es menor que el divisor
        end
    end

endmodule