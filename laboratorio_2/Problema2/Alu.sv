/* Operaciones logicas y aritmeticas de la ALU
----------------------------------------------------------------------
|ALU_Sel|   ALU Operation
----------------------------------------------------------------------
| 0000  |   ALU_Out = A + B;
----------------------------------------------------------------------
| 0001  |   ALU_Out = A - B;
----------------------------------------------------------------------
| 0010  |   ALU_Out = A * B;
----------------------------------------------------------------------
| 0011  |   ALU_Out = A / B;
----------------------------------------------------------------------
| 0100  |   ALU_Out = A << 1;
----------------------------------------------------------------------
| 0101  |   ALU_Out = A >> 1;
----------------------------------------------------------------------
| 0110  |   ALU_Out A % B;
----------------------------------------------------------------------
| 1000  |   ALU_Out = A and B;
----------------------------------------------------------------------
| 1001  |   ALU_Out = A or B;
----------------------------------------------------------------------
| 1010  |   ALU_Out = A xor B;
----------------------------------------------------------------------*/

module Alu 
#(parameter N = 2)
(
  input logic [N-1:0] A, B,             // Entrada de la ALU
  input logic [3:0] ALU_Sel,            // Selector de la ALU
  output logic [2*N-1:0] ALU_Result,    // Salida de la ALU 
  output logic NFlag,                    // Flag de negativo
  output logic ZFlag,                    // Flag de cero
  output logic CFlag,                    // Flag de acarreo
  output logic VFlag                     // Flag de desbordamiento
);

  // Flags intermedios
  logic add_CFlag, add_VFlag, add_ZFlag, add_NFlag;
  logic sub_CFlag, sub_VFlag, sub_ZFlag, sub_NFlag;
  logic modu_CFlag, modu_VFlag, modu_ZFlag, modu_NFlag;
  logic mul_NFlag, mul_ZFlag;
  logic div_VFlag, div_ZFlag, div_NFlag, div_CFlag;

  // Resultados intermedios
  wire [N-1:0] add_result;
  wire [N-1:0] sub_result;
  wire [2*N-1:0] mul_result;
  wire [N-1:0] div_result;
  wire [N-1:0] modu_result;

  // Instanciaciones de módulos
  n_bit_modulus #(.N(N)) modu_op(A, B, modu_result[N-1:0], modu_ZFlag, modu_NFlag, modu_VFlag, modu_CFlag);
  n_bit_divider #(.N(N)) div_op(A, B, div_result[N-1:0], div_ZFlag, div_NFlag, div_VFlag, div_CFlag);
  n_bit_subtractor #(.N(N)) sub_op(A, B, sub_result[N-1:0], sub_CFlag, sub_ZFlag, sub_VFlag, sub_NFlag);
  n_bit_multiplier #(.N(N)) mult_op(A, B, mul_result[2*N-1:0], mul_ZFlag, mul_NFlag);
  n_bit_adder #(.N(N)) adder_op(A, B, add_result[N-1:0], add_ZFlag, add_CFlag, add_VFlag, add_NFlag);

  always_comb begin
    // Inicializar flags
    NFlag = 1'b0;
    ZFlag = 1'b0;
    CFlag = 1'b0;
    VFlag = 1'b0;
    ALU_Result = '0; // Inicializar ALU_Result por defecto

    // Operaciones de la ALU
    case(ALU_Sel)
      4'b0000: begin // ADD
        ALU_Result = add_result;
        NFlag = add_NFlag;
        ZFlag = add_ZFlag;
        CFlag = add_CFlag;
        VFlag = add_VFlag;
      end

      4'b0001: begin // SUB
        ALU_Result = sub_result;
        NFlag = sub_NFlag;
        ZFlag = sub_ZFlag;
        CFlag = sub_CFlag;
        VFlag = sub_VFlag;
      end

      4'b0010: begin // MULT
        ALU_Result = mul_result;
        NFlag = mul_NFlag;
        ZFlag = mul_ZFlag;
        CFlag = 1'b0; // No aplica para multiplicación
        VFlag = 1'b0; // No aplica para multiplicación
      end

      4'b0011: begin // DIV
        ALU_Result = div_result;
        NFlag = div_NFlag;
        ZFlag = div_ZFlag;
        VFlag = div_VFlag;
        CFlag = div_CFlag;
      end

      4'b0100: begin // Logical shift left
        ALU_Result = A << 1;
        ZFlag = (ALU_Result == '0);
        CFlag = A[N-1]; // Carry es el bit más significativo antes del desplazamiento
        NFlag = 1'b0; // No aplica para shift
        VFlag = 1'b0; // No aplica para shift
      end

      4'b0101: begin // Logical shift right
        ALU_Result = A >> 1;
        ZFlag = (ALU_Result == '0);
        CFlag = A[0]; // Carry es el bit menos significativo
        NFlag = 1'b0; // No aplica para shift
        VFlag = 1'b0; // No aplica para shift
      end

      4'b0110: begin // Module
        ALU_Result = modu_result;
        NFlag = modu_NFlag;
        ZFlag = modu_ZFlag;
        VFlag = modu_VFlag;
        CFlag = modu_CFlag;
      end

      4'b1000: begin // Logical AND
        ALU_Result = A & B;
        NFlag = 1'b0; // No aplica para AND
        ZFlag = (ALU_Result == '0);
        CFlag = 1'b0; // No aplica para AND
        VFlag = 1'b0; // No aplica para AND
      end

      4'b1001: begin // Logical OR
        ALU_Result = A | B;
        NFlag = 1'b0; // No aplica para OR
        ZFlag = (ALU_Result == '0);
        CFlag = 1'b0; // No aplica para OR
        VFlag = 1'b0; // No aplica para OR
      end

      4'b1010: begin // Logical XOR
        ALU_Result = A ^ B;
        NFlag = 1'b0; // No aplica para XOR
        ZFlag = (ALU_Result == '0);
        CFlag = 1'b0; // No aplica para XOR
        VFlag = 1'b0; // No aplica para XOR
      end

      default: begin 
        ALU_Result = '0; // Valor por defecto
      end
    endcase
  end
endmodule					  