module shifter_nbits

#( parameter N = 4 ) 

(
	input logic [N-1:0] a, 
	input logic [1:0] deco_in,
	output logic [N-1:0] result,
	output logic neg_flag,
	output logic zr_flag,
	output logic cry_flag,
	output logic of_flag
);
	
	wire [2:0] deco_out;
	
	wire rs_or_out;
	
	wire ars_and_out;
	
	wire [N-1:0] w0;
	wire [N-1:0] w1;
	
	deco_2_3 deco(deco_in[0],deco_in[1],deco_out[0],deco_out[1],deco_out[2]);
	
	or rs_or(rs_or_out,deco_out[1],deco_out[2]);
	
	and ars_and(ars_and_out,deco_out[2],a[N-1]);
	
	genvar i;
	
	generate 
		for(i=0;i<N;i=i+1)
		  begin: generate_shifter_nbits
				if(i==0) begin
					and and0(w0[i],deco_out[0],a[N-1]);
					and and1(w1[i],rs_or_out,a[N-1]);
					or or0(result[N-1],ars_and_out,w0[i+1]);
				end else if(i==(N-1)) begin
					and and0(w0[i],deco_out[0],a[N-1-i]);
					and and1(w1[i],rs_or_out,a[N-1-i]);
					assign result[N-1-i] = w1[i-1];
				end else begin
					and and0(w0[i],deco_out[0],a[N-1-i]);
					and and1(w1[i],rs_or_out,a[N-1-i]);
					or or0(result[N-1-i],w1[i-1],w0[i+1]);
				end
		  end
	
	or or_carry(cry_flag,w0[0],w1[N-1]);
	
	assign zr_flag = (result == 0) ? 1 : 0;
	assign neg_flag = result[N-1];
	assign of_flag = 0;
	
	endgenerate

endmodule