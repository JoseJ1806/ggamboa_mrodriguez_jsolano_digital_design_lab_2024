module xor_module #(parameter N=4) (
    input logic [N-1:0] a, b,
    output logic [N-1:0] y
);

    logic [N-1:0] xor_output;

    genvar i;
    generate
        for (i=0; i<N; i=i+1) begin : generate_bit_to_bit
            xor_gate_single gatexor (a[i],b[i],xor_output[i]);
        end
    endgenerate

    assign y = xor_output;

endmodule


module xor_gate_single (
    input logic a, b,
    output logic y
);

    assign y = a ^ b;

endmodule