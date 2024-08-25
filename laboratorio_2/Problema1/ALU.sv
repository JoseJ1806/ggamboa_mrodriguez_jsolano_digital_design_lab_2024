module ALU 	

#(parameter N = 4)

(
	input logic [N-1:0] a,        
	input logic [N-1:0] b,
	input logic [3:0] s,
	output logic neg_flag,
	output logic zr_flag,
	output logic cry_flag,
	output logic of_flag,
	output logic [N-1:0] result,
	output [6:0] led_disp1,
	output [6:0] led_disp2
	
	
);


	wire [N-1:0] out_suma, out_rest, out_and, out_or, out_xor, out_shifter, out_mult, out_div, out_mod;
	
	//PROBLABLEMENTE HAYA QUE AGREGAR BANDERAS PARA MULT, DIV Y MOD
	wire [11:0] module_flags_out;
	
	wire [1:0] d;
	
	display_converter hex_converter(result[3],result[2],result[1],result[0],led_disp);
	
	mux_10to1 muxresult(result,out_suma, out_rest, out_and, out_or, out_xor, out_shifter, out_shifter, out_mult, out_div, out_mod,s);
	
	and and_decoder0(d[0],~s[0],s[1],s[2],~s[3]);
	and and_decoder1(d[1],s[0],s[1],s[2],~s[3]);
	
	adder_nbits #(.N(N)) adder(a,b,out_suma,module_flags_out[0],module_flags_out[1],module_flags_out[2],module_flags_out[3]);
	substractor_nbits #(.N(N)) substractor(a,b,out_rest,module_flags_out[4],module_flags_out[5],module_flags_out[6],module_flags_out[7]);
	
	//GENERAR MODULO MULTI
	//GENERAR MODULO DIV
	//GENERAR MODULO MOD
	
	//not_module #(.N(N)) notmodule(a,out_not);
	
	
	and_module #(.N(N)) andmodule(a,b,out_and);
	or_module #(.N(N)) ormodule(a,b,out_or);
	xor_module #(.N(N)) xormodule(a,b,out_xor);
	
	shifter_nbits #(.N(N)) shifter(a,d,out_shifter,module_flags_out[8],module_flags_out[9],module_flags_out[10],module_flags_out[11]);
	
	//PROBLABLEMENTE HAYA QUE AGREGAR BANDERAS PARA MULT, DIV Y MOD
	mux_10to1 mux_neg_flag(neg_flag,module_flags_out[0],module_flags_out[4], 0, 0, 0, 0, module_flags_out[8], module_flags_out[8], module_flags_out[8], module_flags_out[8],s);
	mux_10to1 mux_zr_flag (zr_flag,module_flags_out[1],module_flags_out[5], 0, 0, 0, 0, module_flags_out[9], module_flags_out[9], module_flags_out[9], module_flags_out[9],s);
	mux_10to1 mux_cry_flag(cry_flag,module_flags_out[2],module_flags_out[6], 0, 0, 0, 0, module_flags_out[10], module_flags_out[10], module_flags_out[10], module_flags_out[10],s);
	mux_10to1 mux_of_flag (of_flag,module_flags_out[3],module_flags_out[7], 0, 0, 0, 0, module_flags_out[11], module_flags_out[11], module_flags_out[11], module_flags_out[11],s);
	
endmodule