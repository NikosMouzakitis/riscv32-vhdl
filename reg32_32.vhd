----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Nikos Mouzakitis
-- 
-- Create Date:    00:06:56 01/03/2025 
-- Design Name: 
-- Module Name:    reg32_32 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg32_32 is
    Port ( I_in19_15_rr1 : in  STD_LOGIC_VECTOR (4 downto 0);
           I_in24_20_rr2 : in  STD_LOGIC_VECTOR (4 downto 0);
           I_in11_7_wr : in  STD_LOGIC_VECTOR (4 downto 0);
           I_clk : in  STD_LOGIC;
           I_en : in  STD_LOGIC;
           I_wd : in  STD_LOGIC_VECTOR(31 downto 0);
           I_reg_write : in  STD_LOGIC;
           O_rd1 : out  STD_LOGIC_VECTOR (31 downto 0);
           O_rd2 : out  STD_LOGIC_VECTOR (31 downto 0));
end reg32_32;

architecture Behavioral of reg32_32 is
	type store_t is array(0 to 31) of std_logic_vector(31 downto 0);
	
	signal regs: store_t := (others => X"00000000");

begin
	
	process(I_clk, I_en)
	begin
		if rising_edge(I_clk) and I_en='1' then
			O_rd1 <= regs(to_integer(unsigned(I_in19_15_rr1)));
			O_rd2 <= regs(to_integer(unsigned(I_in24_20_rr2)));
			
			if I_reg_write = '1' and I_en = '1' then
				--prevent write on register 0
				if I_in11_7_wr /= "00000" then
					regs(to_integer(unsigned(I_in11_7_wr))) <= I_wd;
				end if;
			end if;
			  
			
		end if;
	end process;

 
end Behavioral;

