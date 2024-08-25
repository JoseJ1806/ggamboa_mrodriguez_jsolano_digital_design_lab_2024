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
| 0110  |   ALU_Out = A girado a la izquierda por 1;
----------------------------------------------------------------------
| 0111  |   ALU_Out = A girado a la derecha por 1;
----------------------------------------------------------------------
| 1000  |   ALU_Out = A and B;
----------------------------------------------------------------------
| 1001  |   ALU_Out = A or B;
----------------------------------------------------------------------
| 1010  |   ALU_Out = A xor B;
----------------------------------------------------------------------
| 1011  |   ALU_Out = A nor B;
----------------------------------------------------------------------
| 1100  |   ALU_Out = A nand B;
----------------------------------------------------------------------
| 1101  |   ALU_Out = A xnor B;
----------------------------------------------------------------------
| 1110  |   ALU_Out = 1 si A>B entonces 0;
----------------------------------------------------------------------
| 1111  |   ALU_Out = 1 si A=B entonces 0;
----------------------------------------------------------------------*/

module Problema1(input logic [3:0] A,B, //entradas de 8 bits de la ALU
					  input logic [3:0] ALU_Sel,//selector de la ALU
					  output logic [3:0]ALU_Out, //salida de 8 bits de la ALU 
					  output logic CarryOut); //bandera de Carry de la ALU
									  
	logic [3:0] ALU_Result;
	wire [4:0] tmp;
	assign ALU_Out = ALU_Result; //salida de la ALU
	assign tmp = {1'b0,A} + {1'b0,B};
	assign CarryOut = tmp[4];
	
	always_comb begin
		//Operaciones de la ALU
		case(ALU_Sel)
		
			4'b0100: begin  // Logical shift left
				ALU_Result = A << 1;
			end
						
			4'b0101: begin // Logical shift right
				ALU_Result = A >> 1;
			end
						
			4'b1000: begin//  Logical and 
				ALU_Result = A & B;
			end
						
			4'b1001: begin //  Logical or
				ALU_Result = A | B;
			end
						
			4'b1010: begin //  Logical xor 
				ALU_Result = A ^ B;
			end
						
			default: begin 
				ALU_Result = A + B;
			end
		endcase
	end
endmodule
						
	