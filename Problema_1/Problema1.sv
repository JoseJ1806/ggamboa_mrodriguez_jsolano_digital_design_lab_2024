module Problema1(input wire [3:0] ent, // numero binario 4 bits
					  output logic [3:0] decs, // numero bcd 4 bits representando las decenas del numero decimal equivalente
					  output logic [3:0]unis, // numero bcd 4 bits representando las unidades del numero decimal equivalente
					  output logic [0:6] dis1, //display de 7 segmentos que representa las decenas del numero decimal a mostrar
					  output logic [0:6] dis2); //display de 7 segmentos que representa las unidades del numero decimal a mostrar

	always_comb begin
	//Todas las conversiones posibles usando 4 bits 
		case (ent)
		
			4'd0: begin
				{decs, unis} = 8'b00000000; // 0
				dis1 = 7'b0000001;
				dis2 = 7'b0000001;
			end
		
			4'd1: begin 
				{decs, unis} = 8'b00000001; // 1
				dis1 = 7'b0000001;
				dis2 = 7'b1001111;
			end
		
			4'd2: begin
				{decs, unis} = 8'b00000010; // 2
				dis1 = 7'b0000001;
				dis2 = 7'b0010010;
			end
		
			4'd3: begin
				{decs, unis} = 8'b00000011; // 3
				dis1 = 7'b0000001;
				dis2 = 7'b0000110;
			end
			
			4'd4: begin
				{decs, unis} = 8'b00000100; // 4
				dis1 = 7'b0000001;
				dis2 = 7'b1001100;
			end
		
			4'd5: begin
				{decs, unis} = 8'b00000101; // 5
				dis1 = 7'b0000001;
				dis2 = 7'b0100100;
			end
		
			4'd6: begin
				{decs, unis} = 8'b00000110; // 6
				dis1 = 7'b0000001;
				dis2 = 7'b0100000;
			end
		
			4'd7: begin
				{decs, unis} = 8'b00000111; // 7
				dis1 = 7'b0000001;
				dis2 = 7'b0001111;
			end
		
			4'd8: begin
				{decs, unis} = 8'b00001000; // 8
				dis1 = 7'b0000001;
				dis2 = 7'b0000000;
			end
		
			4'd9: begin
				{decs, unis} = 8'b00001001; // 9
				dis1 = 7'b0000001;
				dis2 = 7'b0000100;
			end
		
			4'd10: begin
				{decs, unis} = 8'b00010000; // 10
				dis1 = 7'b1001111;
				dis2 = 7'b0000001;
			end
		
			4'd11: begin
				{decs,unis} = 8'b000010001; // 11
				dis1 = 7'b1001111;
				dis2 = 7'b1001111;
			end
		
			4'd12: begin
				{decs,unis} = 8'b000010010; // 12
				dis1 = 7'b1001111;
				dis2 = 7'b0010010;
			end
		
			4'd13: begin
				{decs,unis} = 8'b000010011; // 13
				dis1 = 7'b1001111;
				dis2 = 7'b0000110;
			end
		
			4'd14: begin
				{decs,unis} = 8'b000010100; // 14
				dis1 = 7'b1001111;
				dis2 = 7'b1001100;
			end
		
			4'd15: begin
				{decs,unis} = 8'b000010101; // 15
				dis1 = 7'b1001111;
				dis2 = 7'b0100100;
			end
	
			default: {decs, unis} = 8'b00000000;
		
		endcase
	end
endmodule 