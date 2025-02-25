library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity test_bench is
end test_bench;

architecture Behavioral of test_bench is

component test_bench_design is
    Port(
        CLOCK: in STD_LOGIC;
        REGISTER0_CONTENT: out STD_LOGIC_VECTOR(15 downto 0);
        REGISTER1_CONTENT: out STD_LOGIC_VECTOR(15 downto 0);
        REGISTER2_CONTENT: out STD_LOGIC_VECTOR(15 downto 0);
        REGISTER3_CONTENT: out STD_LOGIC_VECTOR(15 downto 0);
        REGISTER4_CONTENT: out STD_LOGIC_VECTOR(15 downto 0);
        REGISTER5_CONTENT: out STD_LOGIC_VECTOR(15 downto 0);
        REGISTER6_CONTENT: out STD_LOGIC_VECTOR(15 downto 0);
        REGISTER7_CONTENT: out STD_LOGIC_VECTOR(15 downto 0);
        INSTRUCTION_CURRENT: out STD_LOGIC_VECTOR(15 downto 0);
        PROGRAM_COUNTER: out std_logic_vector (15 downto 0)
    );
end component test_bench_design;

signal CLK_sim: STD_LOGIC;
signal REGISTER0_sim: STD_LOGIC_VECTOR(15 downto 0):= (others => '0');
signal REGISTER1_sim: STD_LOGIC_VECTOR(15 downto 0):= (others => '0');
signal REGISTER2_sim: STD_LOGIC_VECTOR(15 downto 0):= (others => '0');
signal REGISTER3_sim: STD_LOGIC_VECTOR(15 downto 0):= (others => '0');
signal REGISTER4_sim: STD_LOGIC_VECTOR(15 downto 0):= (others => '0');
signal REGISTER5_sim: STD_LOGIC_VECTOR(15 downto 0):= (others => '0');
signal REGISTER6_sim: STD_LOGIC_VECTOR(15 downto 0):= (others => '0');
signal REGISTER7_sim: STD_LOGIC_VECTOR(15 downto 0):= (others => '0');
signal INSTRUCTION_CURRENT_sim: STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal PROGRAM_COUNTER_sim: STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

begin
TEST_ENV_INIT: test_bench_design Port map(
    CLOCK => CLK_sim,
    REGISTER0_CONTENT => REGISTER0_sim,
    REGISTER1_CONTENT => REGISTER1_sim,
    REGISTER2_CONTENT => REGISTER2_sim,
    REGISTER3_CONTENT => REGISTER3_sim,
    REGISTER4_CONTENT => REGISTER4_sim,
    REGISTER5_CONTENT => REGISTER5_sim,
    REGISTER6_CONTENT => REGISTER6_sim,
    REGISTER7_CONTENT => REGISTER7_sim,
    INSTRUCTION_CURRENT => INSTRUCTION_CURRENT_sim,
    PROGRAM_COUNTER => PROGRAM_COUNTER_sim
);

simulateClk: process
    begin
            CLK_sim <= '0';
            wait for 2ns;
            CLK_sim <= '1';
            wait for 2ns;
    end process;
end Behavioral;