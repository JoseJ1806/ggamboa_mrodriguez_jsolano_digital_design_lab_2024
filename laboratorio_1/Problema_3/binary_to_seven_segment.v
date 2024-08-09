module binary_to_bcd_7_segment(
    input [5:0] binary_in,  
    output reg [6:0] seg_units, 
    output reg [6:0] seg_tens   
);

    always @* begin
        case(binary_in)
            6'd0: begin seg_tens = 7'b1000000; seg_units = 7'b1000000; end // 00
            6'd1: begin seg_tens = 7'b1000000; seg_units = 7'b1111001; end // 01
            6'd2: begin seg_tens = 7'b1000000; seg_units = 7'b0100100; end // 02
            6'd3: begin seg_tens = 7'b1000000; seg_units = 7'b0110000; end // 03
            6'd4: begin seg_tens = 7'b1000000; seg_units = 7'b0011001; end // 04
            6'd5: begin seg_tens = 7'b1000000; seg_units = 7'b0010010; end // 05
            6'd6: begin seg_tens = 7'b1000000; seg_units = 7'b0000010; end // 06
            6'd7: begin seg_tens = 7'b1000000; seg_units = 7'b1111000; end // 07
            6'd8: begin seg_tens = 7'b1000000; seg_units = 7'b0000000; end // 08
            6'd9: begin seg_tens = 7'b1000000; seg_units = 7'b0010000; end // 09
            6'd10: begin seg_tens = 7'b1111001; seg_units = 7'b1000000; end // 10
            6'd11: begin seg_tens = 7'b1111001; seg_units = 7'b1111001; end // 11
            6'd12: begin seg_tens = 7'b1111001; seg_units = 7'b0100100; end // 12
            6'd13: begin seg_tens = 7'b1111001; seg_units = 7'b0110000; end // 13
            6'd14: begin seg_tens = 7'b1111001; seg_units = 7'b0011001; end // 14
            6'd15: begin seg_tens = 7'b1111001; seg_units = 7'b0010010; end // 15
            6'd16: begin seg_tens = 7'b1111001; seg_units = 7'b0000010; end // 16
            6'd17: begin seg_tens = 7'b1111001; seg_units = 7'b1111000; end // 17
            6'd18: begin seg_tens = 7'b1111001; seg_units = 7'b0000000; end // 18
            6'd19: begin seg_tens = 7'b1111001; seg_units = 7'b0010000; end // 19
            6'd20: begin seg_tens = 7'b0100100; seg_units = 7'b1000000; end // 20
            6'd21: begin seg_tens = 7'b0100100; seg_units = 7'b1111001; end // 21
            6'd22: begin seg_tens = 7'b0100100; seg_units = 7'b0100100; end // 22
            6'd23: begin seg_tens = 7'b0100100; seg_units = 7'b0110000; end // 23
            6'd24: begin seg_tens = 7'b0100100; seg_units = 7'b0011001; end // 24
            6'd25: begin seg_tens = 7'b0100100; seg_units = 7'b0010010; end // 25
            6'd26: begin seg_tens = 7'b0100100; seg_units = 7'b0000010; end // 26
            6'd27: begin seg_tens = 7'b0100100; seg_units = 7'b1111000; end // 27
            6'd28: begin seg_tens = 7'b0100100; seg_units = 7'b0000000; end // 28
            6'd29: begin seg_tens = 7'b0100100; seg_units = 7'b0010000; end // 29
            6'd30: begin seg_tens = 7'b0110000; seg_units = 7'b1000000; end // 30
            6'd31: begin seg_tens = 7'b0110000; seg_units = 7'b1111001; end // 31
            6'd32: begin seg_tens = 7'b0110000; seg_units = 7'b0100100; end // 32
            6'd33: begin seg_tens = 7'b0110000; seg_units = 7'b0110000; end // 33
            6'd34: begin seg_tens = 7'b0110000; seg_units = 7'b0011001; end // 34
            6'd35: begin seg_tens = 7'b0110000; seg_units = 7'b0010010; end // 35
            6'd36: begin seg_tens = 7'b0110000; seg_units = 7'b0000010; end // 36
            6'd37: begin seg_tens = 7'b0110000; seg_units = 7'b1111000; end // 37
            6'd38: begin seg_tens = 7'b0110000; seg_units = 7'b0000000; end // 38
            6'd39: begin seg_tens = 7'b0110000; seg_units = 7'b0010000; end // 39
            6'd40: begin seg_tens = 7'b0011001; seg_units = 7'b1000000; end // 40
            6'd41: begin seg_tens = 7'b0011001; seg_units = 7'b1111001; end // 41
            6'd42: begin seg_tens = 7'b0011001; seg_units = 7'b0100100; end // 42
            6'd43: begin seg_tens = 7'b0011001; seg_units = 7'b0110000; end // 43
            6'd44: begin seg_tens = 7'b0011001; seg_units = 7'b0011001; end // 44
            6'd45: begin seg_tens = 7'b0011001; seg_units = 7'b0010010; end // 45
            6'd46: begin seg_tens = 7'b0011001; seg_units = 7'b0000010; end // 46
            6'd47: begin seg_tens = 7'b0011001; seg_units = 7'b1111000; end // 47
            6'd48: begin seg_tens = 7'b0011001; seg_units = 7'b0000000; end // 48
            6'd49: begin seg_tens = 7'b0011001; seg_units = 7'b0010000; end // 49
            6'd50: begin seg_tens = 7'b0010010; seg_units = 7'b1000000; end // 50
            6'd51: begin seg_tens = 7'b0010010; seg_units = 7'b1111001; end // 51
            6'd52: begin seg_tens = 7'b0010010; seg_units = 7'b0100100; end // 52
            6'd53: begin seg_tens = 7'b0010010; seg_units = 7'b0110000; end // 53
            6'd54: begin seg_tens = 7'b0010010; seg_units = 7'b0011001; end // 54
            6'd55: begin seg_tens = 7'b0010010; seg_units = 7'b0010010; end // 55
            6'd56: begin seg_tens = 7'b0010010; seg_units = 7'b0000010; end // 56
            6'd57: begin seg_tens = 7'b0010010; seg_units = 7'b1111000; end // 57
            6'd58: begin seg_tens = 7'b0010010; seg_units = 7'b0000000; end // 58
            6'd59: begin seg_tens = 7'b0010010; seg_units = 7'b0010000; end // 59
            6'd60: begin seg_tens = 7'b0000010; seg_units = 7'b1000000; end // 60
            6'd61: begin seg_tens = 7'b0000010; seg_units = 7'b1111001; end // 61
            6'd62: begin seg_tens = 7'b0000010; seg_units = 7'b0100100; end // 62
            6'd63: begin seg_tens = 7'b0000010; seg_units = 7'b0110000; end // 63
            default: begin seg_tens = 7'b1111111; seg_units = 7'b1111111; end // Valores predeterminados en caso de error
        endcase
    end

endmodule
