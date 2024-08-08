library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sumador_fpga is
    Port ( SW : in STD_LOGIC_VECTOR(7 downto 0);  -- Switches S0 a S7
           HEX0 : out STD_LOGIC_VECTOR(6 downto 0));  -- Display 7 segmentos para el resultado
end sumador_fpga;


architecture Behavioral of sumador_fpga is
    signal A : STD_LOGIC_VECTOR(3 downto 0);
    signal B : STD_LOGIC_VECTOR(3 downto 0);
    signal Cin : STD_LOGIC := '0';  
    signal S : STD_LOGIC_VECTOR(3 downto 0);
    signal Cout : STD_LOGIC;
	 
	function siete_seg(entrada: STD_LOGIC_VECTOR(3 downto 0)) return std_logic_vector is
	begin
		case entrada is
			when "0000" => return "1111110";
			when "0001" => return "0110000";
			when "0010" => return "1101101";
			when "0011" => return "1111011";
			when "0100" => return "0110011";
			when "0101" => return "1011011";
			when "0110" => return "1011111";
			when "0111" => return "1110000";
			when "1000" => return "1111111";
			when "1001" => return "1110011";
			when "1010" => return "1110111";
			when "1011" => return "0011111";
			when "1100" => return "1001110";
			when "1101" => return "0111101";
			when "1110" => return "1001111";
			when others => return "1000111";
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
    HEX0 <= siete_seg(S);  -- Muestra el resultado de la suma
end Behavioral;
