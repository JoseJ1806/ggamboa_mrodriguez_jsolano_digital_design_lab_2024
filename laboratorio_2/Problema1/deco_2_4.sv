module deco_2_3

(

	input logic a0,        
	input logic a1,  
	output logic y0,	
	output logic y1,
	output logic y2

);
	
	wire logic not_a0;
	wire logic not_a1;
	
	not not0(not_a0,a0);
	not not1(not_a1,a1);
	
	and and0(y0,not_a0,not_a1);
	and and1(y1,not_a0,a1);
	and and2(y2,a0,not_a1);
	
endmodule