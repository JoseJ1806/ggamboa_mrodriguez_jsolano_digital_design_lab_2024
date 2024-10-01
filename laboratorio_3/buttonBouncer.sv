//Modulo deBouncer para los botones
module buttonBouncer(input clk, rst, jugado, output level_out);
	 reg DB_out;
    reg [6:0] seg_data;
    reg [3:0] counter_reg;
    /*
    N define el tiempo de debounce
    Para 25 MHz clock N = 11.
    */
    parameter N = 11;      
  
    reg  [N-1 : 0]  delaycount_reg;                     
    reg  [N-1 : 0]  delaycount_next;
      
    reg DFF1, DFF2;                                 
    wire q_add;                                     
    wire q_reset;
  
 
	reg  delay_reg ; // Registro que deteca un cambio de nivel en DB_out

  
	  always @ ( posedge clk or negedge rst )
	  begin
			if(rst ==  0) // At reset initialize FF and counter 
			 begin
				  DFF1 <= 1'b0;
				  DFF2 <= 1'b0;
				  // For level change detection
				  delay_reg  <=  1'b0;
				  delaycount_reg <= { N {1'b0} };
			 end
			else
			 begin
				  DFF1 <= jugado;
				  DFF2 <= DFF1;
				  delaycount_reg <= delaycount_next;
				  delay_reg  <=  DB_out;
			 end
	  end
      
      
    assign q_reset = (DFF1  ^ DFF2); // Ex OR jugado on conecutive clocks
                                     // to detect level change 
                                       
    assign  q_add = ~(delaycount_reg[N-1]); // Check count using MSB of counter         
      
  
    always @ ( q_reset, q_add, delaycount_reg)
        begin
            case( {q_reset , q_add})
                2'b00 :
                        delaycount_next <= delaycount_reg;
                2'b01 :
                        delaycount_next <= delaycount_reg + 1;
                default :
                // In this case q_reset = 1 => change in level. Reset the counter 
                        delaycount_next <= { N {1'b0} };
            endcase   
        end
      
      
    always @ ( posedge clk )
        begin
            if(delaycount_reg[N-1] == 1'b1)
               DB_out <= DFF2;
            else
					DB_out <= DB_out;
        end
          
   assign  level_out  =  (delay_reg)  &  (~DB_out);

endmodule 