module n_bit_adder #(
    parameter N = 2     
)(
    input logic [N-1:0] a,    // Primer operando de N bits
    input logic [N-1:0] b,    // Segundo operando de N bits
    input logic cin,          // Bit de acarreo de entrada
    output logic [N-1:0] sum, // Resultado de la suma de N bits
    output logic cout,         // Bit de acarreo de salida
	 output logic zero_flag,       // Flag de cero
    output logic carry_flag,      // Flag de acarreo
    output logic overflow_flag,   // Flag de desbordamiento
    output logic negative_flag     // Flag negativo
);

    logic [N:0] carry;  // Vector de acarreo de N+1 bits

    assign carry[0] = cin;

    genvar i;
    generate
        for (i = 0; i < N; i++) begin : adder_loop
            full_adder fa (
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i]),
                .sum(sum[i]),
                .cout(carry[i+1])
            );
        end
    endgenerate

    assign cout = carry[N];
	  // Flags
    assign zero_flag = (sum == 0); // Flag de cero
    assign carry_flag = cout;       // Flag de acarreo

    // Flag de desbordamiento (Overflow)
    assign overflow_flag = (a[N-1] == b[N-1]) && (sum[N-1] != a[N-1]);

    // Flag negativo
    assign negative_flag = sum[N-1]; // El bit más significativo indica el signo


endmodule