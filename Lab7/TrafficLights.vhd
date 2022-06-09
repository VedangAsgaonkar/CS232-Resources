library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TrafficLightsController is
	port ( clk, rst, tr1, tr4 : in std_logic;
	r, g, y: out std_logic_vector (4 downto 0) );
end entity;

architecture TrafficLightsController_arch of TrafficLightsController is
	signal state, next_state : unsigned (3 downto 0);
	signal counter, next_counter : unsigned (4 downto 0);
begin
	
	process(clk)
	begin
		if rising_edge(clk) then
			if rst = '1' then
				state <= "1000";
				counter <= "00000";
			else
				state <= next_state;
				counter <= next_counter;
			end if;
		end if;
	end process;
	
	process (state, counter)
	begin
		if state = "0000" then
			if counter < 12 then
				next_counter <= counter + "00001";
				r <= "11110";
				y <= "00000";
				g <= "00001";
				next_state <= state;
			elsif counter = 12 then
				next_counter <= "00000";
				r <= "11110";
				y <= "00001";
				g <= "00000";
				if tr1 = '1' then
					next_state <= "0001";
				else
					next_state <= "0010";
				end if;
			end if;
		elsif state = "0010" then
			if counter < 12 then
				next_counter <= counter + "00001";
				r <= "11011";
				y <= "00000";
				g <= "00100";
				next_state <= state;
			elsif counter = 12 then
				next_counter <= "00000";
				r <= "11011";
				y <= "00100";
				g <= "00000";
				next_state <= "0011";
			end if;
		elsif state = "0011" then
			if counter < 12 then
				next_counter <= counter + "00001";
				r <= "10111";
				y <= "00000";
				g <= "01000";
				next_state <= state;
			elsif counter = 12 then
				next_counter <= "00000";
				r <= "10111";
				y <= "01000";
				g <= "00000";
				if tr4 = '1' then
					next_state <= "0100";
				else
					next_state <= "0000";
				end if;
			end if;
		elsif state = "0001" then
			if counter < 6 then
				next_counter <= counter + "00001";
				r <= "11101";
				y <= "00000";
				g <= "00010";
				next_state <= state;
			elsif counter = 6 then
				next_counter <= "00000";
				r <= "11101";
				y <= "00010";
				g <= "00000";
				next_state <= "0010";
			end if;		
		elsif state = "0100" then
			if counter < 6 then
				next_counter <= counter + "00001";
				r <= "01111";
				y <= "00000";
				g <= "10000";
				next_state <= state;
			elsif counter = 6 then
				next_counter <= "00000";
				r <= "01111";
				y <= "10000";
				g <= "00000";
				next_state <= "0000";
			end if;
		else
			next_state <= "0010";
			next_counter <= "00000";
		end if;
	end process;
end architecture;
