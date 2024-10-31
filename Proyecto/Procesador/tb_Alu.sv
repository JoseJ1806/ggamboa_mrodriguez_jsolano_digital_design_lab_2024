module tb_Alu;
  parameter N = 4;  // Definimos el tamaño de las entradas
  logic [N-1:0] A, B;  // Entradas de la ALU
  logic [3:0] ALU_Sel; // Selector de operación
  logic [2*N-1:0] ALU_Result; // Resultado de la ALU
  logic NFlag, ZFlag, CFlag, VFlag; // Banderas de la ALU

  // Instanciamos el módulo ALU con el parámetro de 4 bits
  Alu #(N) uut (
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .ALU_Result(ALU_Result),
    .NFlag(NFlag),
    .ZFlag(ZFlag),
    .CFlag(CFlag),
    .VFlag(VFlag)
  );

  // Procedimiento inicial para realizar las pruebas
  initial begin
    $display("Iniciando pruebas de la ALU");
    
    // Prueba de la operación ADD
    A = 4'b0000; B = 4'b0000; ALU_Sel = 4'b0000;
    #10;
    $display("ADD: A=%b, B=%b, ALU_Result=%b, NFlag=%b, ZFlag=%b, CFlag=%b, VFlag=%b", A, B, ALU_Result, NFlag, ZFlag, CFlag, VFlag);
    
    // Prueba de la operación SUB
    A = 4'b0100; B = 4'b0100; ALU_Sel = 4'b0001;
    #10;
    $display("SUB: A=%b, B=%b, ALU_Result=%b, NFlag=%b, ZFlag=%b, CFlag=%b, VFlag=%b", A, B, ALU_Result, NFlag, ZFlag, CFlag, VFlag);
    
    // Prueba de la operación MULT
    A = 4'b0011; B = 4'b0000; ALU_Sel = 4'b0010;
    #10;
    $display("MULT: A=%b, B=%b, ALU_Result=%b, NFlag=%b, ZFlag=%b, CFlag=%b, VFlag=%b", A, B, ALU_Result, NFlag, ZFlag, CFlag, VFlag);
    
    // Prueba de la operación DIV
    A = 4'b0000; B = 4'b0010; ALU_Sel = 4'b0011;
    #10;
    $display("DIV: A=%b, B=%b, ALU_Result=%b, NFlag=%b, ZFlag=%b, CFlag=%b, VFlag=%b", A, B, ALU_Result, NFlag, ZFlag, CFlag, VFlag);

    // Prueba de la operación Logical shift left
    A = 4'b0101; ALU_Sel = 4'b0100;
    #10;
    $display("Logical Shift Left: A=%b, ALU_Result=%b, NFlag=%b, ZFlag=%b, CFlag=%b, VFlag=%b", A, ALU_Result, NFlag, ZFlag, CFlag, VFlag);

    // Prueba de la operación Logical shift right
    A = 4'b0101; ALU_Sel = 4'b0101;
    #10;
    $display("Logical Shift Right: A=%b, ALU_Result=%b, NFlag=%b, ZFlag=%b, CFlag=%b, VFlag=%b", A, ALU_Result, NFlag, ZFlag, CFlag, VFlag);

    // Prueba de la operación Module
    A = 4'b0100; B = 4'b0010; ALU_Sel = 4'b0110;
    #10;
    $display("MOD: A=%b, B=%b, ALU_Result=%b, NFlag=%b, ZFlag=%b, CFlag=%b, VFlag=%b", A, B, ALU_Result, NFlag, ZFlag, CFlag, VFlag);

    // Prueba de la operación Logical AND
    A = 4'b1100; B = 4'b1010; ALU_Sel = 4'b0111;
    #10;
    $display("AND: A=%b, B=%b, ALU_Result=%b, NFlag=%b, ZFlag=%b, CFlag=%b, VFlag=%b", A, B, ALU_Result, NFlag, ZFlag, CFlag, VFlag);

    // Prueba de la operación Logical OR
    A = 4'b1100; B = 4'b1010; ALU_Sel = 4'b1000;
    #10;
    $display("OR: A=%b, B=%b, ALU_Result=%b, NFlag=%b, ZFlag=%b, CFlag=%b, VFlag=%b", A, B, ALU_Result, NFlag, ZFlag, CFlag, VFlag);

    // Prueba de la operación Logical XOR
    A = 4'b1100; B = 4'b1010; ALU_Sel = 4'b1001;
    #10;
    $display("XOR: A=%b, B=%b, ALU_Result=%b, NFlag=%b, ZFlag=%b, CFlag=%b, VFlag=%b", A, B, ALU_Result, NFlag, ZFlag, CFlag, VFlag);

    $display("Pruebas completadas");
    $stop;
  end
endmodule
