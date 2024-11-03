module tb_Alu;

  // Parámetros de la ALU
  parameter N = 4;

  // Entradas de la ALU
  logic [N-1:0] A, B;
  logic [1:0] ALU_Sel;

  // Salidas de la ALU
  logic [N-1:0] ALU_Result;
  logic [3:0] ALU_Flags;

  // Instancia del módulo ALU
  Alu #(.N(N)) alu_inst (
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .ALU_Result(ALU_Result),
    .ALU_Flags(ALU_Flags)
  );

  // Tarea para imprimir resultados
  task print_results;
    input [1:0] operation;
    input [N-1:0] expected_result;
    input [3:0] expected_flags;

    begin
      $display("A = %b, B = %b, ALU_Sel = %b", A, B, operation);
      $display("ALU_Result = %b, Expected Result = %b", ALU_Result, expected_result);
      $display("ALU_Flags = %b, Expected Flags = %b\n", ALU_Flags, expected_flags);
    end
  endtask

  // Estímulos
  initial begin
    // Prueba de operación ADD
    A = 4'b0011;  // 3
    B = 4'b0001;  // 1
    ALU_Sel = 2'b00;
    #10;
    print_results(ALU_Sel, 4'b0100, 4'b0000); // Espera Resultado 4, Flags = 0

    // Prueba de operación SUB
    A = 4'b0001;  // 3
    B = 4'b0011;  // 1
    ALU_Sel = 2'b01;
    #10;
    print_results(ALU_Sel, 4'b0010, 4'b0000); // Espera Resultado 2, Flags = 0

    // Prueba de operación AND
    A = 4'b0011;  // 3
    B = 4'b0001;  // 1
    ALU_Sel = 2'b10;
    #10;
    print_results(ALU_Sel, 4'b0001, 4'b0000); // Espera Resultado 1, Flags = 0

    // Prueba de operación OR
    A = 4'b0010;  // 2
    B = 4'b0001;  // 1
    ALU_Sel = 2'b11;
    #10;
    print_results(ALU_Sel, 4'b0011, 4'b0000); // Espera Resultado 3, Flags = 0

    // Prueba de bandera Zero (Z)
    A = 4'b0000;
    B = 4'b0000;
    ALU_Sel = 2'b00;
    #10;
    print_results(ALU_Sel, 4'b0000, 4'b0100); // Espera Resultado 0, Flag Z = 1

    $stop;
  end

endmodule
