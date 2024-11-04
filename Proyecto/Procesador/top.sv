module top(input logic clk,reset,
			   output logic [31:0] WriteData,DataAdr,
				output logic MemWrite);
				
	logic[31:0]PC,Instr,ReadData;

	//instantiate processor and memories
	arm arm(clk,reset,PC,Instr,MemWrite,DataAdr,
			  WriteData,ReadData);
	rom rom(PC[7:0],clk,Instr);
	ram1 ram1(DataAdr[15:0],clk,WriteData,MemWrite,ReadData);

endmodule
