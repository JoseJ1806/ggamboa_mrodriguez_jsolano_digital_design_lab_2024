module n_bit_divider #(parameter N = 4)(
    input logic [N-1:0] a,
    input logic [N-1:0] b,
    output logic [N-1:0] result,
    output logic zr_flag,
    output logic neg_flag,
    output logic of_flag,
    output logic cry_flag
);

    logic [N-1:0] quotient;
    logic [N-1:0] remainder;
    
    // Implementación de la división
    assign quotient = (b != 0) ? a / b : 0;
    assign remainder = (b != 0) ? a % b : 0;
    assign result = quotient;
    
    // Flags
    assign zr_flag = (result == 0) ? 1 : 0;
    assign neg_flag = result[N-1];
    assign cry_flag = 0; // No hay acarreo en la división
    assign of_flag = (b == 0) ? 1 : 0; // Desbordamiento si b es 0

endmodule 