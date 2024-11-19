/* Operaciones logicas y aritmeticas de la ALU
----------------------------------------------------------------------
|ALU_Sel|   ALU Operation
----------------------------------------------------------------------
| 000  |   ALU_Out = A + B;
----------------------------------------------------------------------
| 001  |   ALU_Out = A - B;
----------------------------------------------------------------------
| 010  |   ALU_Out = A and B;
----------------------------------------------------------------------
| 011  |   ALU_Out = A or B;
----------------------------------------------------------------------
| 100  |   ALU_Out = A * B;
----------------------------------------------------------------------
| 101  |   ALU_Out = A mov B;
----------------------------------------------------------------------
| 110  |   ALU_Out = A bne B;
----------------------------------------------------------------------*/

module Alu 
#(parameter N = 16)
(
  input logic [N-1:0] A, B,             // Entrada de la ALU
  input logic [2:0] ALU_Sel,            // Selector de la ALU
  output logic [2*N-1:0] ALU_Result,    // Salida de la ALU 
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
      3'b000: begin // ADD
        ALU_Result = add_result;
        Neg = add_NFlag;
        Z = add_ZFlag;
        C = add_CFlag;
        V = add_VFlag;
      end

      3'b001: begin // SUB
        ALU_Result = sub_result;
        Neg = sub_NFlag;
        Z = sub_ZFlag;
        C = sub_CFlag;
        V = sub_VFlag;
      end

      3'b010: begin // AND
        ALU_Result = A & B;
        Neg = ALU_Result[N-1:0];
        Z = (ALU_Result == '0);
        C = 1'b0; // No aplica para AND
        V = 1'b0; // No aplica para AND
      end

      3'b011: begin // ORR
        ALU_Result = A | B;
        Neg = ALU_Result[N-1:0];
        Z = (ALU_Result == '0);
        C = 1'b0; // No aplica para OR
        V = 1'b0; // No aplica para OR
      end
		3'b100: begin //MUL
		  ALU_Result = A * B;
        Z = (ALU_Result == '0);
        C = 1'b0; // Carry es el bit menos significativo
        Neg = ALU_Result[N-1]; 
        V= 1'b0; // No aplica para shift
		end
		3'b101: begin //MOV
			ALU_Result = B;
			Z = (ALU_Result == '0);
			C = 1'b0;
			Neg = ALU_Result[N-1];
			V = 1'b0;
		end
		3'b110: begin //BNE
			ALU_Result = sub_result; 
			Z = (ALU_Result == '0); 
			Neg = 1'b0;  
			C = 1'b0; 
			V = 1'b0;
		end
      default: begin 
        ALU_Result = '0; // Valor por defecto
      end
    endcase
  end
  
  assign ALU_Flags = {Neg,Z,C,V};
  
endmodule	