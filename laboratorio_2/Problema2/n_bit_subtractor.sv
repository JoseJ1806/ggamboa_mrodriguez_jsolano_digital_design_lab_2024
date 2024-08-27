module n_bit_subtractor #(
    parameter N = 2     // Ancho de bits predeterminado
)(
    input logic [N-1:0] a,        // Minuendo de N bits
    input logic [N-1:0] b,        // Sustraendo de N bits
    output logic [N-1:0] diff,    // Resultado de la resta de N bits
    output logic carry_flag,     // Flag de acarreo 
    output logic zero_flag,       // Flag de cero
    output logic overflow_flag,   // Flag de desbordamiento
    output logic negative_flag    // Flag negativo
);

    logic [N:0] borrow;  // Vector de acarreo (préstamo) de N+1 bits

    assign borrow[0] = 1'b1;  // Inicializar el préstamo inicial en 1

    genvar i;
    generate
        for (i = 0; i < N; i++) begin : subtractor_loop
            full_subtractor fs (
                .a(a[i]),
                .b(b[i]),
                .bin(borrow[i]),
                .diff(diff[i]),
                .bout(borrow[i+1])
            );
        end
    endgenerate

    assign carry_flag = borrow[N];  // Flag de acarreo (préstamo)

    // Flags
    assign zero_flag = (diff == 0);  // Flag de cero
    assign negative_flag = diff[N-1];  // El bit más significativo indica el signo

    // Flag de desbordamiento (Overflow)
    assign overflow_flag = (a[N-1] != b[N-1]) && (a[N-1] == diff[N-1]);

endmodule