library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Sumador_1bit is
	Port(A, B, Cin: in std_logic;
			S, Cout: out std_logic);
end Sumador_1bit;

architecture Behavioral of Sumador_1bit is
begin
    S <= A XOR B XOR Cin;
    Cout <= (A AND B) OR (Cin AND (A XOR B));
end Behavioral;