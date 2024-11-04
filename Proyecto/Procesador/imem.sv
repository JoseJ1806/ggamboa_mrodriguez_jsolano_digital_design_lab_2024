module imem(input logic [31:0] a,
				output logic [31:0] rd);
	logic[31:0] RAM[63:0];
	
   initial
   $readmemh("C:\\Users\\User\\Documents\\GitHub\\ggamboa_mrodriguez_jsolano_digital_design_lab_2024\\Proyecto\\Procesador\\memfile.dat", RAM);

   assign rd= RAM[a[31:2]];//word aligned
endmodule 