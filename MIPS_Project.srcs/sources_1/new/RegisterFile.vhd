library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RegisterFile is
 Port( RA1: in std_logic_vector(2 downto 0);
       RA2: in std_logic_vector(2 downto 0);
       WA: in  std_logic_vector(2 downto 0);
       WD: in std_logic_vector(15 downto 0);
       clk: in std_logic;
       en: in std_logic;
       RegWr: in std_logic;
       RD1: out std_logic_vector(15 downto 0);
       RD2: out std_logic_vector(15 downto 0));
end RegisterFile;

architecture Behavioral of RegisterFile is

    type mem is array(0 to 15) of std_logic_vector(15 downto 0);
    signal RegF: mem :=(others=>x"0000");
                   
    begin

    process(clk)
    begin
        if rising_edge(clk) then
            if RegWr = '1' and en = '1' then
            RegF(conv_integer(WA)) <= WD;
        end if;
    end if;
    end process;

    RD1 <= RegF(conv_integer(RA1));
    RD2 <= RegF(conv_integer(RA2));

end Behavioral;