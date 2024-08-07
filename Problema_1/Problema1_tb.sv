module Problema1_tb();

  logic [3:0] ent;
	wire [3:0] decs;
	wire [3:0] unis;

	Problema1 modulo(ent,decs,unis);
	
	initial begin
	ent = 4'd0;
	#10
	ent = 4'd1;
	#10
	ent = 4'd2;
	#10
	ent = 4'd3;
	#10
	ent = 4'd4;
	#10
	ent = 4'd5;
	#10
	ent = 4'd6;
	#10
	ent = 4'd7;
	#10
	ent = 4'd8;
	#10
	ent = 4'd9;
	#10
	ent = 4'd10;
	#10
	ent = 4'd11;
	#10
	ent = 4'd12;
	#10
	ent = 4'd13;
	#10
	ent = 4'd14;
	#10
	ent = 4'd15;
	#10;
	
	end
endmodule

