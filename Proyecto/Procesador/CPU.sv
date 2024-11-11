module CPU(input logic clk,vga_clk, reset, enable,
			  output logic [31:0] WriteData, DataAdr, ReadData,
			  output logic MemWrite,
			  output logic [31:0] pixel,x
);
	logic [31:0] Instr, PC;
	logic [31:0] memAddress = 0;
	
		
	//instantiate processor and memories
	arm arm(clk,reset,PC,ins,MemWrite,DataAdr,
			  WriteData,ReadData);
	rom rom(
	.address(PC),
	.clock(clk),
	.q(ins));

	ram1 ram(
	.address_a(DataAdr),
	.address_b(memAddress),
	.clock(clk),
	.data_a(WriteData),
	.data_b(WriteData),
	.wren_a(MemWrite),
	.wren_b(MemWrite),
	.q_a(ReadData),
	.q_b(pixel)
	);
	
	always_ff @(posedge vga_clk) begin
		if (reset) begin
			memAddress <= 0;
		end else if (memAddress >= 40000) begin
			memAddress <= 0;
		end else if (enable) begin
			if (memAddress < 40000) begin
				memAddress <= memAddress + 1;
			end
		end
	end
	
	
	assign x = memAddress;
	

endmodule

