library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Mod10UpDown is
	port ( clk, rst, up : in std_logic;
		count: out std_logic_vector (3 downto 0) );
end entity;

architecture Mod10UpDown_arch of Mod10UpDown is
	signal state, next_state : std_logic_vector ( 3 downto 0);
begin

	process (clk)
	begin
		if rising_edge(clk) then
			if rst = '1' then
				state <= "0000";
			else
				state <= next_state;
			end if;
		end if;
	end process;
	
	process (up, state)
	begin
		if up = '1' then
			if state = "1001" then
				next_state <= "0000";
			else
				next_state <= std_logic_vector(unsigned(state) + 1);
			end if;
		else
			if state = "0000" then
				next_state <= "1001";
			else
				next_state <= std_logic_vector(unsigned(state) - 1);
			end if;
		end if;
	end process;
		
	process (state)
	begin
		count <= state;
	end process;
	
end architecture;
