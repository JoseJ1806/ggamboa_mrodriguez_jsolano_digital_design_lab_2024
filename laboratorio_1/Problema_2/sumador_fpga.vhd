library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sumador_fpga is
    Port ( SW : in STD_LOGIC_VECTOR(7 downto 0);  -- Switches S0 a S7
           HEX0 : out STD_LOGIC_VECTOR( 0 downto 6));  -- Display 7 segmentos para el resultado
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
			when "0000" => return "0000001"; --0
			when "0001" => return "1001111"; --1
			when "0010" => return "0010010"; --2
			when "0011" => return "0000110"; --3
			when "0100" => return "1001100"; --4
			when "0101" => return "0100100"; --5
			when "0110" => return "0100000"; --6
			when "0111" => return "0001111"; --7
			when "1000" => return "0000000"; --8
			when "1001" => return "0000100"; --9
			when "1010" => return "0001000"; --A
			when "1011" => return "1100000"; --b
			when "1100" => return "0110001"; --C
			when "1101" => return "1000010"; --d
			when "1110" => return "0110000"; --E
			when "1111" => return "0111000"; --F
			when others => return "0000001"; 
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
