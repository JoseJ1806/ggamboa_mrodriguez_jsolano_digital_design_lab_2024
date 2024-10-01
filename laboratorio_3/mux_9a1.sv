//Modulo que selecciona cual color se debe de dibujar en la pantalla dependiendo de la visibilidad del sprite
module mux_9a1 (input logic [23:0] rgb0,rgb1,rgb2,rgb3,rgb4,rgb5,rgb6,rgb7,rgb8, rgb_texto,lineas,
					input logic visible_rectangulo,visible0,visible1,visible2,visible3,visible4,visible5,visible6,visible7,visible8,visblelineas, visible_lineaganadora, visible_texto,
					output logic [7:0]r,g,b
					 );

			logic [23:0]out_mux;
			
			
			always @(visible_rectangulo or visible0 or visible1 or visible2 or visible3 or visible4 or visible5 or visible6 or visible7 or visible8 or visblelineas) begin
			      case({visible_lineaganadora, visible_rectangulo,visible0,visible1,visible2,visible3,visible4,visible5,visible6,visible7,visible8,visblelineas, visible_texto})
						
						13'b0000000000000 : out_mux <= 24'b000000000000000000000000;
						13'b0000000000001 : out_mux <= rgb_texto;
						13'b0000000000010 : out_mux <= 24'b111111111111111111111111;
						13'b0000000000100 : out_mux <= rgb8;
						13'b0000000001000 : out_mux <= rgb7;
						13'b0000000010000 : out_mux <= rgb6;
						13'b0000000100000 : out_mux <= rgb5;
						13'b0000001000000 : out_mux <= rgb4;
						13'b0000010000000 : out_mux <= rgb3;
						13'b0000100000000 : out_mux <= rgb2;
						13'b0001000000000 : out_mux <= rgb1;
						13'b0010000000000 : out_mux <= rgb0;
						13'b0100000000000 : out_mux <= 24'b111111110000000011111111;
						13'b1000000000000 : out_mux <= 24'b111111001011101000000011;
						
						13'b1000000000001 : out_mux <= rgb_texto;
						13'b1000000000010 : out_mux <= 24'b111111001011101000000011;
						13'b1000000000100 : out_mux <= 24'b111111001011101000000011;
						13'b1000000001000 : out_mux <= 24'b111111001011101000000011;
						13'b1000000010000 : out_mux <= 24'b111111001011101000000011;
						13'b1000000100000 : out_mux <= 24'b111111001011101000000011;
						13'b1000001000000 : out_mux <= 24'b111111001011101000000011;
						13'b1000010000000 : out_mux <= 24'b111111001011101000000011;
						13'b1000100000000 : out_mux <= 24'b111111001011101000000011;
						13'b1001000000000 : out_mux <= 24'b111111001011101000000011;
						13'b1010000000000 : out_mux <= 24'b111111001011101000000011;
						13'b1100000000000 : out_mux <= 24'b111111001011101000000011;
						default  : out_mux <= 24'b000000000000000000000000;
					endcase
			end
			
			
   assign r = out_mux[23:16];
		
	assign g = out_mux[15:8];
		
	assign b = out_mux[7:0];


endmodule
