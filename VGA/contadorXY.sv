// Modulo contador de las posiciones x y y.
//Cuenta en x hasta llegar a 800
//Cuenta en y hasta llegar a 525
module contadorXY (input logic clk_25,
						output [9:0]cuentaX,
						output [9:0]cuentaY);
				
				always @(posedge clk_25)begin
				
				if (cuentaX == 10'd800) begin 
					cuentaX <= 0; 
					cuentaY++;
					
					if (cuentaY == 10'd525)
						cuentaY <= 0;
					end
				else
					cuentaX++;
				end
					

endmodule
