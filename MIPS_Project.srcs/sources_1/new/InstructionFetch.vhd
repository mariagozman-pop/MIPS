library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity InstructionFetch is
    Port (
        clk: in std_logic;
        branchAddr: in std_logic_vector(15 downto 0);
        jumpAddr: in std_logic_vector(15 downto 0);
        Jump: in std_logic; 
        PCSrc: in std_logic;
        pcEn: in std_logic; 
        pcReset: in std_logic; 
        Instruction: out std_logic_vector(15 downto 0);
        PCOut: out std_logic_vector(15 downto 0)
    );
end InstructionFetch;

architecture Behavioral of InstructionFetch is

   type mem is array(0 to 15) of std_logic_vector(15 downto 0);
    signal M: mem :=(
            0 => B"000_001_010_001_0_110", -- ADD $1, $2, $1
            1 => B"001_001_010_001_0_110", -- SUB $1, $2, $1
            2 => B"010_001_010_0000100",   -- SLL $1, $2, 4
            3 => B"011_001_010_0000110",   -- SRL $1, $2, 6
            4 => B"100_001_010_0010010",   -- AND $1, $2, $1
            5 => B"101_001_010_0010010",   -- OR $1, $2, $1
            6 => B"110_001_010_0010010",   -- NOR $1, $2, $1
            7 => B"111_001_010_0000010",   -- SRA $1, $2, 2
            others => B"000_001_001_001_0_110" -- NOP
            );

    signal pc: std_logic_vector(15 downto 0) := (others=>'0');
    signal adderOut: std_logic_vector(15 downto 0) := (others=>'0');
    signal muxBranch: std_logic_vector(15 downto 0) := (others=>'0');
    signal nextAddr: std_logic_vector(15 downto 0) := (others=>'0');
                      
begin

    -- PC reg
    process(clk, pcReset)
    begin 
        if pcReset = '1' then
            pc <= X"0000";
        elsif rising_edge(clk) and pcEn = '1' then
            pc <= nextAddr;
        end if;
    end process;
     
    -- ROM
    Instruction <= M(conv_integer(pc(4 downto 0)));

    -- PC + 1
    adderOut <= pc + 1;   
    PCOut <= adderOut; 

    -- MUX branch
    process(PCSrc, adderOut, branchAddr)
    begin
        case PCSrc is
            when '0' => muxBranch <= adderOut;
            when '1' => muxBranch <= branchAddr;
            when others => muxBranch <= X"0000";
        end case;
    end process;

    -- Mux jump
    process(Jump, jumpAddr, muxBranch)
    begin
        case Jump is
            when '0' => nextAddr <= muxBranch;
            when '1' => nextAddr <= jumpAddr;
            when others => nextAddr <= X"0000";
        end case;
    end process;
    
end Behavioral;