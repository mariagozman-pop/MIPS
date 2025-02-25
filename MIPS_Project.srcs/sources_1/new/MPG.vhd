library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MPG is
  Port (input: in std_logic;
        clk: in std_logic;
        en: out std_logic);
end MPG;

architecture Behavioral of MPG is

    signal count: std_logic_vector(15 downto 0) := (others=>'0');
    signal Q0: std_logic;
    signal Q1: std_logic;
    signal Q2: std_logic;

    begin

    process(clk)
    begin
        if rising_edge(clk) then
            count <= count + 1;
        end if;
    end process;

    process(clk)
    begin
        if rising_edge(clk) then
            if count = x"FFFF" then
                Q0 <= input;
            end if;
        end if;
    end process;

    process(clk)
    begin
        if rising_edge(clk) then
            Q1 <= Q0;
        end if;
    end process;

    process(clk)
    begin
        if rising_edge(clk) then
            Q2 <= Q1;
        end if;
    end process;

    en <= Q1 and (not Q2);

end Behavioral;