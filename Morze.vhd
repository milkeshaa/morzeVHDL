----------------------------------------------------------------------------------
-- Company: BSU
-- Engineer: Milkevich Alexandr
-- 
-- Create Date:    14:46:52 02/17/2020 
-- Design Name: Very good design
-- Module Name:    Morze - Behavioral 
-- Project Name: Morze
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity myMorze is
    Port ( clk : in STD_LOGIC;
			  start : in STD_LOGIC;
			  morze : out STD_LOGIC);
end myMorze;

architecture Behavioral of myMorze is

	signal seconds : STD_LOGIC := '0';
	constant word : STD_LOGIC_VECTOR(113 downto 0) := "111011100101001011101010011101011100100101010111001010011101011101001010101000101010010111001010100101010100101110";
	signal tacts_counter : integer := 0;
	signal index : integer := 113;
	
	begin
	
		process (clk, start) is
		begin
			if (start = '0') then
				tacts_counter <= 0;
				seconds <= '0';
			elsif (clk'event and clk = '1' and start = '1') then
				tacts_counter <= tacts_counter + 1;
				if (tacts_counter = 25_000_000) then
					seconds <= not seconds;
					tacts_counter <= 0;
				end if;
			end if;
		end process;
		
		process (seconds, start) is
		begin
			if (start = '0') then
				index <= 113;
				morze <= '0';
			elsif (seconds'event and seconds = '1') then
				morze <= word(index);
				index <= index - 1;
			end if;
		end process;
end Behavioral;

