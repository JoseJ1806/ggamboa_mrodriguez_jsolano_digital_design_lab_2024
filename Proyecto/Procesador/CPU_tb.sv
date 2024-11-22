`timescale 1ps / 1ps

module CPU_tb();
	logic clk;
	logic rst;
	logic [31:0] address;
	logic [31:0] q_b,Instr;
	
	CPU uft(
		.clk(clk),
		.reset(rst),
		.address(address),
		.q_b(q_b),
		.Instr(Instr)
		);
	
	always begin
		#20 clk = ~clk;
	end
		
	initial begin
		rst = 1;
		clk = 0;
		address = 32'd40000;
		#32;
		rst =0;
		
		#3000;
		$stop;
	end

endmodule
	