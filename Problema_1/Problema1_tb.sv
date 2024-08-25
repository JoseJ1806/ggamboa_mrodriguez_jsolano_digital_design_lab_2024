module Problema1_tb();
//Entradas
	logic [3:0] A,B;
	logic [3:0] ALU_Sel;
//Salidas
	wire[3:0] ALU_Out;
	wire CarryOut;
//Entero para mostrar todas las operaciones de la ALU
	integer i;
	
	Problema1 modulo(
		A,B, //Entradas de 8 bits de la ALU
		ALU_Sel, //Selector de la ALU
		ALU_Out, //Salida de 8 bits de la ALU
		CarryOut //Bandera de Carry de la ALU
	);
	initial begin
	
		A = 4'h06;
		B = 4'h02;
		ALU_Sel = 4'h0;
		#10
		for (i = 0; i <= 15; i = i + 1)
		begin
			ALU_Sel = ALU_Sel + 4'h01;
			#10;
		end;
		
		A = 4'hF6;
		B = 4'h0A;
		
	end
endmodule