module FlipFlop_out

                #(parameter N=2)
               (input logic clk,        // Entrada del reloj
                input logic reset,      // Entrada de reset
					 input logic [2*N-1:0] input_result,
					 input logic NFlag_in,
					 input logic ZFlag_in,
					 input logic CFlag_in,
					 input logic VFlag_in,
					 output logic [2*N-1:0] Output_result,
					 output logic NFlag_out,
					 output logic ZFlag_out,
					 output logic CFlag_out,
					 output logic VFlag_out);        // Salida de datos

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            Output_result <= 1'b0;       // Si hay un reset, establece la salida en 0
				NFlag_out <= 1'b0;
				ZFlag_out <= 1'b0;
				CFlag_out <= 1'b0;
				VFlag_out <= 1'b0;
				
				
        end else begin
				Output_result <= input_result;
				NFlag_out <= NFlag_in;
				ZFlag_out <= ZFlag_in;
				CFlag_out <= CFlag_in;
				VFlag_out <= VFlag_in;
        end
    end

endmodule