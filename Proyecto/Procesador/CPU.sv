module CPU(
	input logic clk, 
	input logic reset,
	input logic [31:0] address,
	output logic [31:0] q_b, Instr
	);
	
	logic [3:0] ALUFlags; 
	logic RegWrite;
	logic ALUSrc;
	logic MemtoReg;
	logic PCSrc;
	logic MemWrite;
	logic [31:0]WriteData;
	logic [1:0] RegSrc;
	logic [1:0] ImmSrc;
	logic [2:0] ALUControl;
	logic [15:0] ALUResult;
	logic [31:0] PC;
	//logic [31:0] Instr;
	logic [31:0] ReadData;


	controller c(clk,reset,Instr,ALUFlags,
				 RegSrc,RegWrite,ImmSrc,ALUSrc,ALUControl,
             MemWrite,MemtoReg,PCSrc);
		
	datapath dp(clk,reset,
				RegSrc,RegWrite,ImmSrc,
				ALUSrc,ALUControl,
				MemtoReg,PCSrc,
				ALUFlags,PC,Instr,
				ALUResult,WriteData,ReadData);

	rom rom(
		.address(PC),
		.clock(clk),
		.q(Instr)
		);
		
	ram1 ram(
		.address_a(ALUResult),
		.address_b(address),
		.clock(clk),
		.data_a(WriteData),
		.data_b(32'b0),
		.wren_a(MemWrite),
		.wren_b(1'b0),
		.q_a(ReadData),
		.q_b(q_b)
		);
	

endmodule

