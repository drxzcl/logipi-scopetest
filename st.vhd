----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:21:46 07/07/2014 
-- Design Name: 
-- Module Name:    st - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity st is
    Port ( OSC_FPGA : in  STD_LOGIC;
           LED : out  STD_LOGIC_VECTOR (1 downto 0);
           PMOD4 : out  STD_LOGIC_VECTOR (7 downto 0));
end st;

architecture Behavioral of st is

signal counter_output : std_logic_vector(24 downto 0) := (others => '0');
begin

process(OSC_FPGA)
	begin
		if (rising_edge(OSC_FPGA)) then		
			counter_output <= counter_output + 1 ;				
		end if;
	end process ;

	LED(0) <= counter_output(24);
	LED(1) <= counter_output(23);
	PMOD4 <= counter_output(11 downto 4);

end Behavioral;

