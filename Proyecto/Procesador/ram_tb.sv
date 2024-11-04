module ram_tb();

logic clk, wren, rst;

logic [7:0] address;
logic [31:0] data, q;

ram1 mem(address,clk,data,wren,q);

endmodule 