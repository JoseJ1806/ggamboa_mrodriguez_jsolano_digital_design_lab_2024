module vga (input logic clk,
				output logic vgaclk, // 25.175 MHz VGA clock
				output logic hsync, vsync,
				output logic sync_b, blank_b,  // To monitor & DAC
				output logic [7:0] r, g, b); // To video DAC

	logic [9:0] x, y;
	
	// Use a PLL to create the 25.175 MHz VGA pixel clock
	// 25.175 MHz clk period = 39.772 ns
	// Screen is 800 clocks wide by 525 tall, but only 640 x 480 used
	// HSync = 1/(39.772 ns *800) = 31.470 kHz
	// Vsync = 31.474 kHz / 525 = 59.94 Hz (~60 Hz refresh rate)
	
	pll vgapll(.inclk0(clk), .c0(vgaclk));
	
	// Generate monitor timing signals
	vgaController vgaCont(vgaclk, hsync, vsync, sync_b, blank_b, x, y);
	
	// User-defined module to determine pixel color
	videoGen videoGen(x, y, r, g, b);

endmodule


module vgaController #(parameter HACTIVE = 10'd640,
                                      HFP = 10'd16,
                                      HSYN = 10'd96,
                                      HBP = 10'd48,
                                      HMAX = HACTIVE + HFP + HSYN + HBP,
                                      VACTIVE = 10'd480,
                                      VFP = 10'd11,
                                      VSYN = 10'd2,
                                      VBP = 10'd32,
                                      VMAX = VACTIVE + VFP + VSYN + VBP)
                     (input logic vgaclk,
                      output logic hsync, vsync, sync_b, blank_b,
                      output logic [9:0] x, y);


							 

// counters for horizontal and vertical positions
	always @(posedge vgaclk) begin
		x++;
		if (x==HMAX) begin
			x = 0;
			y++;
			if (y==VMAX) y = 0;
		end
	end


 // Compute sync signals (active low)
	assign hsync = ~(x >= HACTIVE + HFP & x < HACTIVE + HFP + HSYN);
	assign vsync = ~(y >= VACTIVE + VFP & y < VACTIVE + VFP + VSYN);
	assign sync_b = hsync & vsync;
 // Force outputs to black when outside the legal display area
	assign blank_b = (x <HACTIVE) & (y < VACTIVE);
endmodule


module videoGen(input logic [9:0] x, y, output logic [7:0] r, g, b);

    logic [1:0] gameBoard [2:0][2:0]; // Matriz 3x3 del Tic-Tac-Toe
    initial begin
        // Inicializamos la matriz vacía
        gameBoard[0][0] = 0; gameBoard[0][1] = 0; gameBoard[0][2] = 0;
        gameBoard[1][0] = 0; gameBoard[1][1] = 0; gameBoard[1][2] = 0;
        gameBoard[2][0] = 0; gameBoard[2][1] = 0; gameBoard[2][2] = 0;
    end
    
    // Definir colores
    parameter WHITE = 24'b111111111111111111111111;
    parameter BLACK = 24'b0;
    parameter X_COLOR = 24'b111111110000000011111111; // Color para X
    parameter O_COLOR = 24'b000000001111111111111111; // Color para O

    // Dividir la pantalla en 3x3
    parameter CELL_WIDTH = 640 / 3;
    parameter CELL_HEIGHT = 480 / 3;
	 
	 // Definir variables para la celda
    logic [1:0] cell_x, cell_y;
	 
	 // Calcular en qué celda estamos, fuera del bloque combinacional
    always_comb begin
        cell_x = x / CELL_WIDTH;
        cell_y = y / CELL_HEIGHT;
    end
	 
    // Dibujar la cuadrícula
    always_comb begin
        r = 8'h00; g = 8'h00; b = 8'h00;  // Por defecto, pantalla negra
        
        // Dibujar las líneas de la cuadrícula
        if (x % CELL_WIDTH == 0 || y % CELL_HEIGHT == 0) begin
            r = 8'hFF; g = 8'hFF; b = 8'hFF;  // Dibujar líneas blancas
        end else begin
            
            // Obtener el valor de la casilla
            case (gameBoard[cell_y][cell_x])
                1: begin // Dibujar una "X"
                    if (x % CELL_WIDTH >= 20 && y % CELL_HEIGHT >= 20 && x % CELL_WIDTH < CELL_WIDTH - 20 && y % CELL_HEIGHT < CELL_HEIGHT - 20) begin
                        // Lógica para dibujar una "X" (esto puede ser más detallado)
                        if (x % CELL_WIDTH == y % CELL_HEIGHT || x % CELL_WIDTH + y % CELL_HEIGHT == CELL_WIDTH)
                            {r, g, b} = X_COLOR;
                    end
                end
                2: begin // Dibujar una "O"
                    // Lógica para dibujar una "O" (círculo simple)
                    if ((x % CELL_WIDTH - CELL_WIDTH / 2) ** 2 + (y % CELL_HEIGHT - CELL_HEIGHT / 2) ** 2 < (CELL_WIDTH / 4) ** 2)
                        {r, g, b} = O_COLOR;
                end
                default: begin
                    // Dejar la celda vacía
                end
            endcase
        end
    end
endmodule




module chargenrom(input logic [7:0] ch,
						input logic [2:0] xoff, yoff,
						output logic
						pixel);

	logic [5:0] charrom[2047:0]; // character generator ROM
	logic [7:0] line;
 // a line read from the ROM
 // Initialize ROM with characters from text file
	initial
		$readmemb("charrom.txt", charrom);
 // Index into ROM to find line of character
	assign line = charrom[yoff+{ch-65,3'b000}]; //Subtract 65becauseA
 // is entry 0
 // Reverse order of bits
	assign pixel = line[3'd7-xoff];
endmodule 


module rectgen(input logic [9:0] x, y, left, top, right, bot,
					output logic inrect);
	assign inrect = (x >= left & x < right & y >= top & y < bot);
endmodule
