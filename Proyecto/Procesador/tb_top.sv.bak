`timescale 1 ns / 1 ns

module tb_top;
	 parameter CLK_PERIOD = 10; // Periodo del reloj en unidades de tiempo
    logic clk;
    logic rst;
    logic vgaclk;
    logic hsync, vsync;
    logic sync_b, blank_b;
    logic [7:0] r, g, b;
    logic [9:0] x, y;
	 logic [31:0] memAddress, pixel;

    // Instancia del módulo a probar
    top uut (
        .clk(clk),
        .rst(rst),
        .vgaclk(vgaclk),
        .hsync(hsync),
        .vsync(vsync),
        .sync_b(sync_b),
        .blank_b(blank_b),
        .r(r),
        .g(g),
        .b(b),
        .x(x),
        .y(y),
		  .memAddress(memAddress),
		  .pixel(pixel)
    );

    // Procedimiento de prueba
    initial begin
       clk = 0;
    forever #((CLK_PERIOD / 2)) clk = ~clk;
  end
  
  always_ff @(posedge vgaclk) begin
		 $display("X = %d", x);
		 $display("Y = %d", y);
		 $display("r = %d", r);
		 $display("g = %d", g);
		 $display("b = %d", b);
		 $display("MemAddress = %d", memAddress);
		 $display("Pixel = %d", pixel);
		 $display("---------------------------------------------");
		 $display("---------------------------------------------");
		 $display("---------------------------------------------");

  end

  // Secuencia de prueba
  initial begin
	 rst = 1;
	 #10;
    // Desactivar reset y habilitar el módulo
    rst = 0;

    #20000;
	 $finish;
  end

endmodule
