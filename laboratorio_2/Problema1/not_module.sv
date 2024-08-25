module not_module #(parameter N=4) (
    input logic [N-1:0] a,
    output logic [N-1:0] y
);

    logic [N-1:0] not_output;

    genvar i;
    generate
        for (i=0; i<N; i=i+1) begin : generate_bit_to_bit
            not_gate_single notgate (a[i],not_output[i]);
        end
    endgenerate

    assign y = not_output;

endmodule


module not_gate_single (
    input logic a,
    output logic y
);

    assign y = ~a;

endmodule