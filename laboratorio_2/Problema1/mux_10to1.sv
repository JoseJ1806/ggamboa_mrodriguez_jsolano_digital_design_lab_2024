module mux_10to1 #(parameter N=4)(output [N-1:0] out, 
											 input [N-1:0] out_suma, out_rest, out_and, out_or, out_xor, out_right_lo, out_left_lo, out_mult, out_div, out_mod,
											 input [3:0] select);

logic [N-1:0] out_alu;


//SE CAMBIO EL FUNCIONAMIENTO DEL MUX, REVISAR QUE FUNCIONE BIEN

always_comb
	 begin
    case (select)
        4'b0000: out_alu = out_suma;      // 4'b1111 //Si funciona
        4'b0001: out_alu = out_rest;      // 4'b1110 //Si funciona
        4'b0010: out_alu = out_and;       // 4'b1101 //Si funciona
        4'b0011: out_alu = out_or;        // 4'b1100 //Si funciona
        4'b0100: out_alu = out_xor;       // 4'b1011 //Si funciona
        4'b0101: out_alu = out_right_lo;  // 4'b1010 
        4'b0111: out_alu = out_left_lo;   // 4'b1000
        4'b1000: out_alu = out_mult; 		// 4'b0111 //Si funciona
        4'b1001: out_alu = out_div;       // 4'b0110 //Si funciona
        4'b1010: out_alu = out_mod;       // 4'b0101 //Si funciona
		  
        default: out_alu = out_suma;
    endcase
end

assign out = out_alu;

endmodule