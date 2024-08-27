module full_multiplicator(
    input logic a,
    input logic b,
    output logic result,
    output logic c_out
);

    assign result = a & b; // La multiplicación a nivel de bit es una operación AND
    assign c_out = 0; // No hay acarreo en la multiplicación de un solo bit

endmodule