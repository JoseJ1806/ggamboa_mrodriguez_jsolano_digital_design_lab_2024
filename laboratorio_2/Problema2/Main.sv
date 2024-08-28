module Main
     #(parameter N = 32)
	  (
	  //Se definen las entradas 	  
	  input logic [N-1:0] A,B,Sel,
	  input logic clk, reset,
	  
	  //Se definen las salidas 
	 
     output logic [2*N-1:0] result,
	  output logic NFlag_out,
	  output logic ZFlag_out,
	  output logic CFlag_out,
	  output logic VFlag_out
);

logic[N-1:0] Output_A_num1;   
logic [N-1:0] Output_B_num1;  
logic[3:0] Output_sel;
logic [2*N-1:0] Oresult_seg;
logic N_Flag;
logic Z_Flag;
logic C_Flag;
logic V_Flag;

// Instanciación de módulos
FlipFlop_in #(.N(N)) ff1_inst (
    .clk(clk),
    .reset(reset),
    .A_numf1(A),
    .B_numf1(B),
    .s_f1(Sel),
    .Output_A_numf1(Output_A_num1),
    .Output_B_numf1(Output_B_num1),
    .Output_s_f1(Output_sel)
);

Alu #(.N(N)) alu_inst (
    .A(Output_A_num1),
    .B(Output_B_num1),
    .ALU_Sel(Output_sel),
    .ALU_Result(Oresult_seg),
    .NFlag(N_Flag),
    .ZFlag(Z_Flag),
    .CFlag(C_Flag),
    .VFlag(V_Flag)
);

FlipFlop_out #(.N(N)) ff2_inst (
    .clk(clk),
    .reset(reset),
    .input_result(Oresult_seg),
    .NFlag_in(N_Flag),
    .ZFlag_in(Z_Flag),
    .CFlag_in(C_Flag),
    .VFlag_in(V_Flag),
    .Output_result(result), // Conectar la salida correcta
    .NFlag_out(NFlag_out), // Conectar la salida correcta
    .ZFlag_out(ZFlag_out), // Conectar la salida correcta
    .CFlag_out(CFlag_out), // Conectar la salida correcta
    .VFlag_out(VFlag_out)  // Conectar la salida correcta
);
endmodule
	