module FlipFlop_in
#(parameter N = 4)
(input logic clk,        
                input logic reset,      
                input logic [N-1:0] A_numf1,      
					 input logic [N-1:0] B_numf1,
					 input logic [3:0] operations_f1,
                output logic [N-1:0] Output_A_numf1,
					 output logic [N-1:0] Output_B_numf1,
					 output logic [3:0] Output_operations_f1);        

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            Output_A_numf1 <= 1'b0;       
				Output_B_numf1 <= 1'b0;
				Output_operations_f1 <= 1'b0;
				
				
        end else begin
            Output_A_numf1 <= A_numf1;  // Copia la entrada de datos en la salida en el flanco de subida del reloj
				Output_B_numf1 <= B_numf1;
				Output_operations_f1 <= operations_f1;
        end
    end
endmodule 