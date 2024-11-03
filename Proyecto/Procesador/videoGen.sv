module videoGen(
    input logic [9:0] x, y,
    output logic [7:0] r, g, b,
    output logic [15:0] address,  // Dirección de 16 bits para cubrir hasta 200x200/4 bloques
    input logic [31:0] data // Bloque de 4 píxeles, cada uno de 8 bits en RGB
);

    // Definir el área de visualización en 640x480
    localparam IMG_WIDTH = 200;
    localparam IMG_HEIGHT = 200;
    localparam X_START = (640 - IMG_WIDTH) / 2;  // Centrar en el eje X
    localparam Y_START = (480 - IMG_HEIGHT) / 2; // Centrar en el eje Y

    // Coordenadas dentro de la imagen
    logic [9:0] img_x, img_y;
    logic [1:0] pixel_offset;  // Para seleccionar un píxel dentro del bloque de 4 píxeles

    always_comb begin
        if (x >= X_START && x < X_START + IMG_WIDTH && y >= Y_START && y < Y_START + IMG_HEIGHT) begin
            // Coordenadas dentro del área de la imagen
            img_x = x - X_START;
            img_y = y - Y_START;

            // Calcular dirección en la memoria
            address = (img_y * IMG_WIDTH + img_x) >> 2; // Dividir por 4 para acceder a bloques de 32 bits

            // Seleccionar el píxel dentro del bloque de 32 bits (4 píxeles)
            pixel_offset = img_x[1:0];  // Los dos bits menos significativos de img_x

            // Extraer el color según el offset
            case (pixel_offset)
                2'b00: {r, g, b} = data[31:24]; // Primer píxel en el bloque
                2'b01: {r, g, b} = data[23:16]; // Segundo píxel en el bloque
                2'b10: {r, g, b} = data[15:8];  // Tercer píxel en el bloque
                2'b11: {r, g, b} = data[7:0];   // Cuarto píxel en el bloque
                default: {r, g, b} = 24'h000000;      // Negro por defecto
            endcase
        end else begin
            // Fuera del área de imagen, mostrar negro
            r = 8'h00;
            g = 8'h00;
            b = 8'h00;
            address = 16'h0; // Dirección inválida fuera del área de imagen
        end
    end

endmodule
