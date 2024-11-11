module ram_tb();

logic clk, wren1,wren2, rst;

logic [15:0] address,address2;
logic [31:0] data1, data2, q1,q2;

ram1 mem(address,address2,clk,data1, data2,wren1,wren2,q1,q2);

endmodule 