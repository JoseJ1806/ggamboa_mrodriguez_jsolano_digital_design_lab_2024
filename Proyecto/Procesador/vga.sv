module vga(
    input logic vgaclk,
	 input logic [7:0] pixel,
    //output logic vgaclk, // 25.175 MHz VGA clock
    output logic hsync, vsync,
    output logic sync_b, blank_b, // To monitor & DAC
    output logic [7:0] r, g, b, // To video DAC,
    output logic [9:0] x,
	 output logic [9:0] y
);


    // Use a PLL to create the 25.175 MHz VGA pixel clock
    // 25.175 MHz clk period = 39.772 ns
    // Screen is 800 clocks wide by 525 tall, but only 640 x 480 used
    // HSync = 1/(39.772 ns *800) = 31.470 kHz
    // Vsync = 31.474 kHz / 525 = 59.94 Hz (~60 Hz refresh rate)
    // Generate monitor timing signals
    vgaController vgaCont(vgaclk, hsync, vsync, sync_b, blank_b, x, y);

    // Instantiate videoGen module
    generate_graphic gen_grid(x, y, pixel[7:0], r, g, b);

endmodule 