module or_module #(parameter N=4) (
    input logic [N-1:0] a, b,
    output logic [N-1:0] y
);

    logic [N-1:0] or_output;

    genvar i;
    generate
        for (i=0; i<N; i=i+1) begin : generate_bit_to_bit
            or_gate_single gateor (a[i],b[i],or_output[i]);
        end
    endgenerate

    assign y = or_output;

endmodule


module or_gate_single (
    input logic a, b,
    output logic y
);

    assign y = a | b;

endmodule