module generate_graphic (
  input logic [9:0] x, y,
  input logic [31:0] ReadData,
  output logic [7:0] red, green, blue
);

  logic inrectBGLeft;
  logic inrectBGRight;
  logic inrectImage;
	 
  
  generate_rectangle rectImage(x, y, 0, 0, 10'd200, 10'd200, inrectImage);
  
  always_comb begin
    red   = (inrectImage ? ReadData[23:16] : 8'b01010101);
    green = (inrectImage ? ReadData[15:8] : 8'b01010101);
    blue  = (inrectImage ? ReadData[7:0] : 8'b01010101);
  end

endmodule 