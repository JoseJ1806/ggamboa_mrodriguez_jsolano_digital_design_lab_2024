module full_moduler(
    input logic a,
    input logic b,
    output logic result,
    output logic c_out
);

    assign result = (b != 0) ? a % b : 0; // Operación módulo a nivel de bit
    assign c_out = 0; // No hay acarreo en la operación módulo de un solo bit

endmodule
