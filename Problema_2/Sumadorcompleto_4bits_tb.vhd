library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sumadorcompleto_4bits_tb is
end Sumadorcompleto_4bits_tb;

architecture Behavioral of Sumadorcompleto_4bits_tb is
    component Sumadorcompleto_4bits
        Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
               B : in STD_LOGIC_VECTOR(3 downto 0);
               Cin : in STD_LOGIC;
               S : out STD_LOGIC_VECTOR(3 downto 0);
               Cout : out STD_LOGIC);
    end component;

    signal A, B : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal Cin : STD_LOGIC := '0';
    signal S : STD_LOGIC_VECTOR(3 downto 0);
    signal Cout : STD_LOGIC;

begin
    UUT : Sumadorcompleto_4bits
        port map (A, B, Cin, S, Cout);

    process
    begin
        -- Prueba 1: 0000 + 0000 + 0
        A <= "0000";
        B <= "0000";
        Cin <= '0';
        wait for 10 ns;
        assert (S = "0000" and Cout = '0') report "Prueba 1 fallida" severity error;

        -- Prueba 2: 0101 + 1010 + 0
        A <= "0101";
        B <= "1010";
        Cin <= '0';
        wait for 10 ns;
        assert (S = "1111" and Cout = '0') report "Prueba 2 fallida" severity error;

        -- Prueba 3: 1111 + 0001 + 0
        A <= "1111";
        B <= "0001";
        Cin <= '0';
        wait for 10 ns;
        assert (S = "0000" and Cout = '1') report "Prueba 3 fallida" severity error;

        -- Prueba 4: 1000 + 0111 + 1
        A <= "1000";
        B <= "0111";
        Cin <= '1';
        wait for 10 ns;
        assert (S = "0000" and Cout = '1') report "Prueba 4 fallida" severity error;

        wait;
    end process;
end Behavioral;