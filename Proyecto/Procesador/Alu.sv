/* Operaciones logicas y aritmeticas de la ALU
----------------------------------------------------------------------
|ALU_Sel|   ALU Operation
----------------------------------------------------------------------
| 00  |   ALU_Out = A + B;
----------------------------------------------------------------------
| 01  |   ALU_Out = A - B;
----------------------------------------------------------------------
| 10  |   ALU_Out = A and B;
----------------------------------------------------------------------
| 11  |   ALU_Out = A or B;
----------------------------------------------------------------------*/

module Alu 
#(parameter N = 2)
(
  input logic [N-1:0] A, B,             // Entrada de la ALU
  input logic [1:0] ALU_Sel,            // Selector de la ALU
  output logic [N-1:0] ALU_Result,    // Salida de la ALU 
  output [3:0] ALU_Flags
);

  // Flags intermedios
  logic add_CFlag, add_VFlag, add_ZFlag, add_NFlag;
  logic sub_CFlag, sub_VFlag, sub_ZFlag, sub_NFlag;
  logic Neg, Z, C, V;

  // Resultados intermedios
  wire [N-1:0] add_result;
  wire [N-1:0] sub_result;

  
  n_bit_subtractor #(.N(N)) sub_op(A, B, sub_result[N-1:0], sub_CFlag, sub_ZFlag, sub_VFlag, sub_NFlag);
  n_bit_adder #(.N(N)) adder_op(A, B, add_result[N-1:0], add_ZFlag, add_CFlag, add_VFlag, add_NFlag);

  always_comb begin
    // Inicializar flags
    Neg = 0;
	 Z = 0;
	 C = 0;
	 V = 0;
    ALU_Result = '0; // Inicializar ALU_Result por defecto

    // Operaciones de la ALU
    case(ALU_Sel)
      2'b00: begin // ADD
        ALU_Result = add_result;
        Neg = add_NFlag;
        Z = add_ZFlag;
        C = add_CFlag;
        V = add_VFlag;
      end

      2'b01: begin // SUB
        ALU_Result = sub_result;
        Neg = sub_NFlag;
        Z = sub_ZFlag;
        C = sub_CFlag;
        V = sub_VFlag;
      end

      2'b10: begin // AND
        ALU_Result = A & B;
        Neg = 1'b0; // No aplica para AND
        Z = (ALU_Result == '0);
        C = 1'b0; // No aplica para AND
        V = 1'b0; // No aplica para AND
      end

      2'b11: begin // ORR
        ALU_Result = A | B;
        Neg = 1'b0; // No aplica para OR
        Z = (ALU_Result == '0);
        C = 1'b0; // No aplica para OR
        V = 1'b0; // No aplica para OR
      end
      default: begin 
        ALU_Result = '0; // Valor por defecto
      end
    endcase
  end
  
  assign ALU_Flags = {Neg,Z,C,V};
  
endmodule	