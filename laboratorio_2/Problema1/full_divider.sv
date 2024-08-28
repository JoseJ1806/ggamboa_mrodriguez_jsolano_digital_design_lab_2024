module full_divider(
    input logic a,
    input logic b,
    output logic result,
    output logic c_out
);

    assign result = (b != 0) ? a / b : 0; // División a nivel de bit
    assign c_out = 0; // No hay acarreo en la división de un solo bit

endmodule