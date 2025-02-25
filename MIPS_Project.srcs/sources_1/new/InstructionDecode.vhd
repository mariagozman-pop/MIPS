library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity InstructionDecode is
  Port( clk: in std_logic;
        RegWrite: in std_logic;
        en: in std_logic;
        RegDst: in std_logic;
        ExtOp: in std_logic; 
        Instr: in std_logic_vector(15 downto 0);
        WD: in std_logic_vector(15 downto 0);
        sa: out std_logic;
        func: out std_logic_vector(2 downto 0);
        Ext_imm: out std_logic_vector(15 downto 0);
        RD1: out std_logic_vector(15 downto 0);
        RD2: out std_logic_vector(15 downto 0));
end InstructionDecode;

architecture Behavioral of InstructionDecode is

component RegisterFile is 
 Port( RA1: in std_logic_vector(2 downto 0);
       RA2: in std_logic_vector(2 downto 0);
       WA: in  std_logic_vector(2 downto 0);
       WD: in std_logic_vector(15 downto 0);
       clk: in std_logic;
       en: in std_logic;
       RegWr: in std_logic;
       RD1: out std_logic_vector(15 downto 0);
       RD2: out std_logic_vector(15 downto 0));
end component;

    signal RF1: std_logic_vector(15 downto 0);
    signal RF2: std_logic_vector(15 downto 0);
    signal MUXout: std_logic_vector(2 downto 0) := "000";

    begin

    RegFile: RegisterFile port map( RA1 => Instr(12 downto 10), RA2 => Instr(9 downto 7),
                      WA => MUXout, WD => WD, clk => clk, en => en, RegWr => RegWrite,
                      RD1 => RF1, RD2 => RF2 );

    --MUX sel
    process(Instr,RegDst)
    begin
    case RegDst is
        when '0' => MUXout <= Instr(9 downto 7);
        when '1' => MUXout <= Instr(6 downto 4);
        when others => MUXout <= MUXout;
    end case;
    end process;

    RD1 <= RF1;
    RD2 <= RF2;

    sa <= Instr(3);
    func <= Instr(2 downto 0);
 
    --Extension unit
    Ext_imm<= "000000000" & Instr(6 downto 0) when ExtOp='0' or Instr(6)='0' else "111111111" & Instr(6 downto 0); 
 
end Behavioral;