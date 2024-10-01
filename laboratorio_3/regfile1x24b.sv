`timescale 1ns / 1ns
//Modulo de registro en el cual se guarda la matriz de juego
//Se edita la matriz de juego dependiendo de las circunstancias del juego
module regfile1x24b
  (input logic clk, input logic reset, input logic write, tiempo, input [1:0] wrData, input [3:0] posicion, //input [7:0]posicion_ra,
   output [8:0][1:0]rdData , output logic guardado);
	logic flag = 0;
   logic [8:0][1:0]regfile;
	//reg [7:0] contador = 0;
	reg [3:0] p =0;
   assign rdData = regfile;
	
	
   always @(posedge clk or negedge reset) begin
      if (!reset) begin
	     regfile[8:0] <= 0;
      end 
	   else if(write) begin
			if (regfile[posicion] == 0)begin
				regfile[posicion] <= wrData+1;
				guardado <= 1;
				end
			else
				guardado <= 0;
	   end
		else if(tiempo||flag)begin
			flag = 1;
			if (regfile[p] == 0)begin
				regfile[p] <= wrData+1;
				guardado <= 1;
				p <= 0;
				flag = 0;
			end
			else begin
				guardado <=0;
				if(p==8) p = 0;
				else p = p+1;
			end
		
			/*flag = 1;
			if (contador == posicion_ra)begin
				regfile[p] <= wrData+1;
				guardado <= 1;
				flag = 0;
				contador <= 0;
				p <= 0;
				end
			else begin
				guardado <= 0;
				if (regfile[p] == 0)begin
					contador = contador +1;
				end
				else begin
					if(p==8) p = 0;
					else p = p+1;
				end
			end*/
		end
		else begin
		
		regfile <= regfile;
		guardado <= 0;
		
		end

   end

endmodule
