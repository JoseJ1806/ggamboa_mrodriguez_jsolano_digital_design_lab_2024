module adder_nbits

#( parameter N = 4 ) 

(
	input logic [N-1:0] a,        
	input logic [N-1:0] b,
	output logic [N-1:0] result,
	output logic neg_flag,
	output logic zr_flag,
	output logic cry_flag,
	output logic of_flag
);
	
	wire [N-1:0] carries;
	
	genvar i;
	
	generate 
		for(i=0;i<N;i=i+1)
		  begin: generate_N_bit_Adder
				if(i==0) 
					full_adder f(a[0],b[0],0,result[0],carries[0]);
				else
					full_adder f(a[i],b[i],carries[i-1],result[i],carries[i]);
		  end
		  
	assign zr_flag = (result == 0) ? 1 : 0;
	assign neg_flag = result[N-1];
	assign cry_flag = carries[N-1];
	assign of_flag = ((a[N-1] + b[N-1]) != result[N-1]) ? 1 : 0;
	
	endgenerate

endmodule