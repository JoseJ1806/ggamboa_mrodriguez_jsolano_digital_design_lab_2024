module Problema_3_tb;
    logic [5:0] value;
    logic reset;
    logic button_a, button_b, button_sub;
    logic [5:0] result;
    logic [6:0] seg_a0, seg_a1, seg_b0, seg_b1, seg_res0, seg_res1;

    Problema_3 #(6) uut (
        .value(value),
        .reset(reset),
        .button_a(button_a),
        .button_b(button_b),
        .button_sub(button_sub),
        .result(result),
        .seg_a0(seg_a0),
        .seg_a1(seg_a1),
        .seg_b0(seg_b0),
        .seg_b1(seg_b1),
        .seg_res0(seg_res0),
        .seg_res1(seg_res1)
    );

    initial begin
        // Inicialización
        reset = 1;
        button_a = 0;
        button_b = 0;
        button_sub = 0;
        value = 6'b000000;
        #10;

        // Desactivar reset
        reset = 0;
        #10;

        // Ingresar valor A = 12 
        value = 6'b001100;
        button_a = 1; #10 button_a = 0; #10;

        // Ingresar valor B = 7 
        value = 6'b000111;
        button_b = 1; #10 button_b = 0; #10;

        // Realizar la resta
        button_sub = 1; #10 button_sub = 0; #10;

        #10;


        // Verificar las salidas de las pantallas de 7 segmentos
        $display("seg_a0. Obtenido: %b", seg_a0);
        $display("seg_a1. Obtenido: %b", seg_a1);
        $display("seg_b0. Obtenido: %b", seg_b0);
        $display("seg_b1. Obtenido: %b", seg_b1);
        $display("seg_res0. Obtenido: %b", seg_res0);
        $display("seg_res1. Obtenido: %b", seg_res1);

        // Detener simulación
        #10;
        $stop;
    end
endmodule


//module Problema_3_tb;
//    logic [3:0] value;
//    logic reset;
//    logic button_a, button_b, button_sub;
//    logic [3:0] result;
//    logic [6:0] seg_a0, seg_a1, seg_b0, seg_b1, seg_res0, seg_res1;
//
//    Problema_3 #(4) uut (
//        .value(value),
//        .reset(reset),
//        .button_a(button_a),
//        .button_b(button_b),
//        .button_sub(button_sub),
//        .result(result),
//        .seg_a0(seg_a0),
//        .seg_a1(seg_a1),
//        .seg_b0(seg_b0),
//        .seg_b1(seg_b1),
//        .seg_res0(seg_res0),
//        .seg_res1(seg_res1)
//    );
//
//    initial begin
//        // Inicialización
//        reset = 1;
//        button_a = 0;
//        button_b = 0;
//        button_sub = 0;
//        value = 4'b0000;
//        #10;
//
//        // Desactivar reset
//        reset = 0;
//        #10;
//
//        // Ingresar valor A = 12 
//        value = 4'b1100;
//        button_a = 1; #10 button_a = 0; #10;
//
//        // Ingresar valor B = 7 
//        value = 4'b0111;
//        button_b = 1; #10 button_b = 0; #10;
//
//        // Realizar la resta
//        button_sub = 1; #10 button_sub = 0; #10;
//
//        #10;
//
//        // Verificar las salidas de las pantallas de 7 segmentos
//        $display("seg_a0. Obtenido: %b", seg_a0);
//        $display("seg_a1. Obtenido: %b", seg_a1);
//        $display("seg_b0. Obtenido: %b", seg_b0);
//        $display("seg_b1. Obtenido: %b", seg_b1);
//        $display("seg_res0. Obtenido: %b", seg_res0);
//        $display("seg_res1. Obtenido: %b", seg_res1);
//
//        // Detener simulación
//        #10;
//        $stop;
//    end
//endmodule



//module Problema_3_tb_2bits;
//    logic [1:0] value;
//    logic reset;
//    logic button_a, button_b, button_sub;
//    logic [1:0] result;
//    logic [6:0] seg_a0, seg_a1, seg_b0, seg_b1, seg_res0, seg_res1;
//
//    Problema_3 #(2) uut (
//        .value(value),
//        .reset(reset),
//        .button_a(button_a),
//        .button_b(button_b),
//        .button_sub(button_sub),
//        .result(result),
//        .seg_a0(seg_a0),
//        .seg_a1(seg_a1),
//        .seg_b0(seg_b0),
//        .seg_b1(seg_b1),
//        .seg_res0(seg_res0),
//        .seg_res1(seg_res1)
//    );
//
//    initial begin
//        // Inicialización
//        reset = 1;
//        button_a = 0;
//        button_b = 0;
//        button_sub = 0;
//        value = 2'b00;
//        #10;
//
//        // Desactivar reset
//        reset = 0;
//        #10;
//
//        // Ingresar valor A = 2 
//        value = 2'b10;
//        button_a = 1; #10 button_a = 0; #10;
//
//        // Ingresar valor B = 1 
//        value = 2'b01;
//        button_b = 1; #10 button_b = 0; #10;
//
//        // Realizar la resta
//        button_sub = 1; #10 button_sub = 0; #10;
//
//        // Esperar unos ciclos para ver el resultado
//        #10;
//
//        // Verificar las salidas de las pantallas de 7 segmentos
//        $display("seg_a0. Obtenido: %b", seg_a0);
//        $display("seg_a1. Obtenido: %b", seg_a1);
//        $display("seg_b0. Obtenido: %b", seg_b0);
//        $display("seg_b1. Obtenido: %b", seg_b1);
//        $display("seg_res0. Obtenido: %b", seg_res0);
//        $display("seg_res1. Obtenido: %b", seg_res1);
//
//        // Detener simulación
//        #10;
//        $stop;
//    end
//endmodule
//
