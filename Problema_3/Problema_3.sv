module Problema_3
#(parameter N = 6)
(
    input logic [N-1:0] value,    // Input 
    input logic reset,            // Reset 
    input logic button_a,         // Button reg_a
    input logic button_b,         // Button reg_b
    input logic button_sub,       // Button subtraction
    output logic [N-1:0] result,  // Result of subtraction
    output logic [6:0] seg_a0,    // 7-segment display for A (units)
    output logic [6:0] seg_a1,    // 7-segment display for A (tens)
    output logic [6:0] seg_b0,    // 7-segment display for B (units)
    output logic [6:0] seg_b1,    // 7-segment display for B (tens)
    output logic [6:0] seg_res0,  // 7-segment display for result (units)
    output logic [6:0] seg_res1   // 7-segment display for result (tens)
);

    reg [N-1:0] reg_a, reg_b;     
    wire [N-1:0] subtract_result; // Result of subtraction
    wire [N-1:0] carries;         // Carry outputs from the subtractor

    always @(posedge reset or posedge button_a or posedge button_b) begin
        if (reset) begin
            reg_a <= 0;
            reg_b <= 0;
        end else begin
            if (button_a) begin
                reg_a <= value;
            end
            if (button_b) begin
                reg_b <= value;
            end
        end
    end

    wire [N-1:0] result_temp;
    generate
        genvar i;
        for (i = 0; i < N; i = i + 1) begin: subtractor_loop
            if (i == 0) begin
                substractor sub_inst (
                    .a(reg_a[0]),
                    .b(reg_b[0]),
                    .c_in(0),
                    .result(result_temp[0]),
                    .c_out(carries[0])
                );
            end else begin
                substractor sub_inst (
                    .a(reg_a[i]),
                    .b(reg_b[i]),
                    .c_in(carries[i-1]),
                    .result(result_temp[i]),
                    .c_out(carries[i])
                );
            end
        end
    endgenerate

    always @* begin
        if (button_sub) begin
            result = result_temp;
        end else begin
            result = '0; // Or maintain the previous result, if needed
        end
    end

	 
    binary_to_bcd_7_segment conv_a (
        .binary_in(reg_a),
        .seg_units(seg_a0),
        .seg_tens(seg_a1)
    );

    binary_to_bcd_7_segment conv_b (
        .binary_in(reg_b),
        .seg_units(seg_b0),
        .seg_tens(seg_b1)
    );

    binary_to_bcd_7_segment conv_result (
        .binary_in(result),
        .seg_units(seg_res0),
        .seg_tens(seg_res1)
    );

endmodule
