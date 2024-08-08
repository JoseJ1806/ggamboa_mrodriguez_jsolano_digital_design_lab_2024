library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sumador_fpga is
    Port ( SW : in STD_LOGIC_VECTOR(7 downto 0);  -- Switches S0 a S7
           HEX0 : out STD_LOGIC_VECTOR(6 downto 0);  -- Display 7 segmentos para el resultado
           HEX1 : out STD_LOGIC_VECTOR(6 downto 0));  -- Display 7 segmentos para el resultado de B
end sumador_fpga;

architecture Behavioral of sumador_fpga is
    signal A : STD_LOGIC_VECTOR(3 downto 0);
    signal B : STD_LOGIC_VECTOR(3 downto 0);
    signal Cin : STD_LOGIC := '0';  
    signal S : STD_LOGIC_VECTOR(3 downto 0);
    signal Cout : STD_LOGIC;

    -- Función para convertir el resultado a un formato adecuado para el display
    function to_7seg(value: INTEGER) return STD_LOGIC_VECTOR is
    begin
        case value is
            when 0 => return "1000000";  -- 0
            when 1 => return "1111001";  -- 1
            when 2 => return "0100100";  -- 2
            when 3 => return "0110000";  -- 3
            when 4 => return "0011001";  -- 4
            when 5 => return "0010010";  -- 5
            when 6 => return "0000010";  -- 6
            when 7 => return "1111000";  -- 7
            when 8 => return "0000000";  -- 8
            when 9 => return "0010000";  -- 9
            when others => return "1111111";  -- Error
        end case;
    end function;

begin
    -- Asignar las entradas desde los switches
    A <= SW(3 downto 0);
    B <= SW(7 downto 4);
    -- Instancia del sumador de 4 bits
    UUT: entity work.Sumadorcompleto_4bits
        port map (A, B, Cin, S, Cout);

    -- Mostrar el resultado en los displays de 7 segmentos
    HEX0 <= to_7seg(to_integer(unsigned(S)));  -- Muestra el resultado de la suma
    HEX1 <= to_7seg(to_integer(unsigned(B)));  -- Muestra el valor de B
end Behavioral;