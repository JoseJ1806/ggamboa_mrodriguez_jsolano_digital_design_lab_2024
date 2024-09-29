//Modulo que divide el clock de 50MHz a uno de 25MHz
module divisorClk(input logic clock, 
	               output logic clock_25);

	   reg [15:0] cnt;
	   
		//------------------------------------Divisor de Clock-------------------------------
	   always @(posedge clock)
      {clock_25, cnt} <= cnt + 16'h8000; 

endmodule
