module multiplicator_nbits #(parameter N = 4)(
    input logic [N-1:0] a,
    input logic [N-1:0] b,
    output logic [N-1:0] result,
    output logic neg_flag,
    output logic zr_flag,
    output logic cry_flag,
    output logic of_flag
);

    logic [2*N-1:0] full_result;
    logic [N-1:0] partials[N-1:0];
    genvar i, j;
    
    generate
        for (i = 0; i < N; i = i + 1) begin: generate_partial_products
            for (j = 0; j < N; j = j + 1) begin: generate_bit_multiplication
                assign partials[i][j] = a[i] & b[j];
            end
        end
    endgenerate
    
    assign full_result = partials[0] + (partials[1] << 1) + (partials[2] << 2) + (partials[3] << 3);
    assign result = full_result[N-1:0];
    
    assign zr_flag = (result == 0) ? 1 : 0;
    assign neg_flag = result[N-1];
    assign cry_flag = |full_result[2*N-1:N];
    assign of_flag = 0; // No se genera desbordamiento en la multiplicación sin signo

endmodule
