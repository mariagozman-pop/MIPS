library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ControlUnit is
  Port( Instr: in std_logic_vector (2 downto 0);
        RegDst: out std_logic;
        ExtOp: out std_logic;
        ALUSrc: out std_logic;
        Branch: out std_logic;
        Jump: out std_logic;
        MemWrite: out std_logic;
        MemToReg: out std_logic;
        RegWrite: out std_logic;
        ALUOp: out std_logic_vector (2 downto 0)
    );
end ControlUnit;

architecture Behavioral of ControlUnit is

begin

    process(Instr)
    begin
        RegDst <= '0';
        ExtOp <= '0';
        ALUSrc <= '0';
        Branch <= '0';
        Jump <= '0';
        MemWrite <= '0';
        MemtoReg <= '0';
        RegWrite <= '0';
        ALUOp <= "000";
    case Instr is 
    when "000" =>  -- Tipul R
	    RegDst <= '1';
		RegWrite <= '1';
		ALUOp <= "001";
			
	when "001" =>  -- ADDI
		ExtOp <= '1';
		ALUSrc <= '1';
		RegWrite <= '1';
		ALUOp <= "010";
		    
	when "010" => --LW
		ExtOp <= '1';
		ALUSrc <= '1';
		RegWrite <= '1';
		MemtoReg <= '1';
		ALUOp <= "010";
		    
    when "011" => --SW
		ExtOp <= '1';
		ALUSrc <= '1';
		MemWrite <= '1';
		ALUOp <= "010";
		    
	when "100" => --BEQ
		ExtOp <= '1';
		Branch <= '1';
		ALUOp <= "011"; 
		    
	when "101" => --ANDI
		ALUSrc <= '1';
		RegWrite <= '1';
		ALUOp <= "100";
		    
	when "110" => --LUI
		ALUSrc <= '1';
		RegWrite <= '1';
		ALUOp <= "101";
		    
	when "111" => --J
		Jump <= '1';
		
    when others => 
		RegDst <= '0'; 
		ExtOp <= '0'; 
		ALUSrc <= '0'; 
        Branch <= '0'; 
        Jump <= '0'; 
        MemWrite <= '0';
        MemtoReg <= '0'; 
        RegWrite <= '0';
        ALUOp <= "000";   
        
    end case;
    end process;

end Behavioral;