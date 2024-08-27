module FlipFlop_in
#(parameter N = 2)
(input logic clk,        
                input logic reset,      
                input logic [N-1:0] A_numf1,      
					 input logic [N-1:0] B_numf1,
					 input logic [3:0] s_f1,
                output logic [N-1:0] Output_A_numf1,
					 output logic [N-1:0] Output_B_numf1,
					 output logic [3:0] Output_s_f1);        

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
				Output_A_numf1 <= {N{1'b0}};  
            Output_B_numf1 <= {N{1'b0}};  
            Output_s_f1 <= 4'b0000;       
				
				
        end else begin
            Output_A_numf1 <= A_numf1;  // Copia la entrada de datos en la salida en el flanco de subida del reloj
				Output_B_numf1 <= B_numf1;
				Output_s_f1 <= s_f1;
        end
    end
endmodule 