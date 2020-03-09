----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:09:18 02/17/2020 
-- Design Name: 
-- Module Name:    Morze_tb - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Morze_tb is
end Morze_tb;

architecture Behavioral of Morze_tb is
	component myMorze is 
		port(clk: in std_logic;
			start: in std_logic;
			morze: out std_logic);
	end component;
	signal clk : STD_LOGIC := '0';
	signal morze : STD_LOGIC;
	signal start : std_logic := '0';
begin
	start <= '1', '0' after 30 ms, '1' after 40 ms;
	clk <= not clk after 20 ns;
	U1: entity work.myMorze(Behavioral) port map(clk => clk, morze => morze, start => start);
end Behavioral;

