----------------------------------------------------------------------------------
-- Company: 
-- Engineer:   Nikos Mouzakitis
-- 
-- Create Date:    21:29:58 01/03/2025 
-- Design Name: 
-- Module Name:    instr_mem_32 - Behavioral 
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

entity instr_mem_32 is

port (
	I_clk : in std_logic; --clock
	I_read_addr: in std_logic_vector(31 downto 0); --address to read
	O_instruction: out std_logic_vector(31 downto 0) --instruction read.
);	

end instr_mem_32;

architecture Behavioral of instr_mem_32 is

	type memory_array is array(0 to 255) of std_logic_vector(31 downto 0);
	signal memory : memory_array := (
		0 => X"12345678",
		1 => X"9abcdef0",
		others => (others =>'0')
		);

begin

	process(I_clk)
	begin
		if rising_edge(I_clk) then
			O_instruction <= memory(to_integer(unsigned(I_read_addr)));
		end if;
	end process;
	
end Behavioral;

