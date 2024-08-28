module moduler_nbits #(parameter N = 4)(
    input logic [N-1:0] a,
    input logic [N-1:0] b,
    output logic [N-1:0] result,
    output logic neg_flag,
    output logic zr_flag,
    output logic cry_flag,
    output logic of_flag
);

    logic [N-1:0] remainder;
    
    // Implementación de la operación módulo
    assign remainder = (b != 0) ? a % b : 0;
    assign result = remainder;
    
    // Flags
    assign zr_flag = (result == 0) ? 1 : 0;
    assign neg_flag = result[N-1];
    assign cry_flag = 0; 
    assign of_flag = (b == 0) ? 1 : 0; 

endmodule