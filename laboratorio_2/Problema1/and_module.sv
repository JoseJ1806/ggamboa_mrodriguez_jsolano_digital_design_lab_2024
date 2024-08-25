module and_module #(parameter N=4) (
    input logic [N-1:0] a, b,
    output logic [N-1:0] y
);

    logic [N-1:0] and_output;

    genvar i;
    generate
        for (i=0; i<N; i=i+1) begin : generate_bit_to_bit
            and_gate_single gateand (a[i],b[i],and_output[i]);
        end
    endgenerate

    assign y = and_output;

endmodule

module and_gate_single (
    input logic a, b,
    output logic y
);

    assign y = a & b;

endmodule