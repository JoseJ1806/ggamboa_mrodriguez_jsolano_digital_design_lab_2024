library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sumadorcompleto_4bits is
    port(
        A, B : in std_logic_vector(3 downto 0);
        Cin : in std_logic;
        S : out std_logic_vector(3 downto 0);
        Cout : out std_logic
    );
end Sumadorcompleto_4bits;

architecture Behavioral of Sumadorcompleto_4bits is
	component Sumador_1bit is
		port(
            A, B, Cin : in std_logic;
            S, Cout : out std_logic);
    end component;
	
	signal C : STD_LOGIC_VECTOR(3 downto 0);  -- Señales de acarreo		
	
	
	begin
    -- Instanciación de los sumadores de 1 bit
    sumador0 : Sumador_1bit
        port map (A(0), B(0), Cin, S(0), C(0));

    sumador1 : Sumador_1bit
        port map (A(1), B(1), C(0), S(1), C(1));

    sumador2 : Sumador_1bit
        port map (A(2), B(2), C(1), S(2), C(2));

    sumador3 : Sumador_1bit
        port map (A(3), B(3), C(2), S(3), Cout);
	
	 
end Behavioral;