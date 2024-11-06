module CPU(input logic clk, reset, enable,
			  output logic [31:0] WriteData, DataAdr, ReadData,
			  output logic MemWrite,
			  output logic [31:0] ins, PC
);

	//logic [31:0] Instr, PC;
	
		
	//instantiate processor and memories
	arm arm(clk,reset,PC,ins,MemWrite,DataAdr,
			  WriteData,ReadData);
	rom rom(PC[7:0],clk,ins);
	//dmem dmem(clk,MemWrite,DataAdr,WriteData,ReadData);
	ram1 ram1(DataAdr[7:0],clk,WriteData,MemWrite,ReadData);
	
	
	
	

endmodule

