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

module Problema1(input logic [3:0] A,B, //entradas de 4 bits de la ALU
					  input logic [3:0] ALU_Sel,//selector de la ALU
					  output logic [7:0]ALU_Out, //salida de 8 bits de la ALU 
					  output logic CarryOut, //bandera de Carry de la ALU
					  output logic [3:0] result_cents, //numero binario de 4 bits que representa las centenas del resultado
					  output logic [3:0] result_decs, //numero binario de 4 bits que representa las decenas del resultado
					  output logic [3:0] result_unis, //numero binario de 4 bits que representa las unidades del resultado
					  output logic [0:6] disp_cents, //display de 7 segmentos que representa las centenas del resultado a mostrar
					  output logic [0:6] disp_decs, //display de 7 segmentos que representa las decenas del resultado a mostrar
					  output logic [0:6] disp_unis //display de 7 segmentos que representa las unidades del resultado a mostrar
					  ); 
	
	//Variables temporales para la descomposicion de ALU_Result							  
	logic [3:0] cents, decs, unis;	
	logic [7:0] ALU_Result;
	wire [8:0] tmp;
	assign ALU_Out = ALU_Result; //salida de la ALU
	assign tmp = {1'b0,A} + {1'b0,B};
	assign CarryOut = tmp[8];
	
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
		
		//Descompone ALU_Result en centenas, decenas y unidades
		cents = (ALU_Result / 100) % 10;
		decs = (ALU_Result / 10) % 10;
		unis = ALU_Result % 10;
			
		//Asignan los valores a los displays
		result_cents = cents;
		result_decs = decs;
		result_unis = unis;
		
	end
	
	always_comb begin
		//Casos posibles para las centenas
		case (result_cents)
		
			4'd0: begin
				disp_cents = 7'b0000001; //0
			end
		
			4'd1: begin 
				disp_cents = 7'b1001111; //1
			end
		
			4'd2: begin
				disp_cents = 7'b0010010; //2
			end
		
			4'd3: begin
				disp_cents = 7'b0000110; //3
			end
			
			4'd4: begin
				disp_cents = 7'b1001100; //4
			end
		
			4'd5: begin
				disp_cents = 7'b0100100; //5
			end
		
			4'd6: begin
				disp_cents = 7'b0100000; //6
			end
		
			4'd7: begin
				disp_cents = 7'b0001111; //7
			end
		
			4'd8: begin
				disp_cents = 7'b0000000; //8
			end
		
			4'd9: begin
				disp_cents = 7'b0000100; //9
			end
			
			default: begin
				disp_cents = 7'b0000001;
			end
			
		endcase
	end
	
	always_comb begin
	// Casos posibles para las decenas
		case (result_decs)
			
			4'd0: begin
				disp_decs = 7'b0000001; //0
			end
			
			4'd1: begin 
				disp_decs = 7'b1001111; //1
			end
			
			4'd2: begin
				disp_decs = 7'b0010010; //2
			end
			
			4'd3: begin
				disp_decs = 7'b0000110; //3
			end
			
			4'd4: begin
				disp_decs = 7'b1001100; //4
			end
			
			4'd5: begin
				disp_decs = 7'b0100100; //5
			end
			
			4'd6: begin
				disp_decs = 7'b0100000; //6
			end
			
			4'd7: begin
				disp_decs = 7'b0001111; //7
			end
			
			4'd8: begin
				disp_decs = 7'b0000000; //8
			end
			
			4'd9: begin
				disp_decs = 7'b0000100; //9
			end
			
			default: begin
				disp_decs = 7'b0000001;	
			end
			
		endcase
	end
	
	always_comb begin
		// Casos posibles para las unidades
		case (result_unis)
			
			4'd0: begin
				disp_unis = 7'b0000001; //0
			end
			
			4'd1: begin 
				disp_unis = 7'b1001111; //1
			end
			
			4'd2: begin
				disp_unis = 7'b0010010; //2
			end
			
			4'd3: begin
				disp_unis = 7'b0000110; //3
			end
			
			4'd4: begin
				disp_unis = 7'b1001100; //4
			end
			
			4'd5: begin
				disp_unis = 7'b0100100; //5
			end
			
			4'd6: begin
				disp_unis = 7'b0100000; //6
			end
			
			4'd7: begin
				disp_unis = 7'b0001111; //7
			end
			
			4'd8: begin
				disp_unis = 7'b0000000; //8
			end
			
			4'd9: begin
				disp_unis = 7'b0000100; //9
			end
			
			default: begin
				disp_unis = 7'b0000001;
			end
			
		endcase
	end
endmodule
						
	