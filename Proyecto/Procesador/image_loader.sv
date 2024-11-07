module image_loader(
  output logic [15:0] memAddress,
  input logic clk,
  input logic inrectImage,
  input logic [9:0] x, y,
  output logic [7:0] r, g, b
);
  // Declaración de variables internas
  logic [7:0] pixel;
  logic [1:0] state;  // Estado para la secuencia de lectura RGB (0 = R, 1 = G, 2 = B)
  
  // Calcula la dirección base para el píxel en la posición (x, y)
  assign memAddress = (y * 200 + x) * 3 + state;

  // Instancia de la RAM
  ram_rgb ram(
    .address(memAddress),
    .clock(clk),
    .data(8'b0),
    .wren(1'b0),
    .q(pixel)
  );

  // Control de lectura de R, G, y B usando un contador secuencial
  always_ff @(posedge clk) begin
    if (inrectImage) begin
      case (state)
        2'd0: r <= pixel;  // Lectura de R
        2'd1: g <= pixel;  // Lectura de G
        2'd2: b <= pixel;  // Lectura de B
      endcase

      // Incrementa el estado para la próxima componente
      state <= (state == 2'd2) ? 2'd0 : state + 1;
    end else begin
      // Color predeterminado en caso de no estar dentro de la imagen
      r <= 8'b01010101;
      g <= 8'b01010101;
      b <= 8'b01010101;
      state <= 2'd0;  // Reinicia el estado cuando no está en la imagen
    end
  end

endmodule
