library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BoothMultiplier is
	port ( clk, rst : in std_logic;
	a, b : in std_logic_vector (3 downto 0);
	result : out std_logic_vector (7 downto 0) );
end entity;

architecture BoothMultiplier_arch of BoothMultiplier is
	signal state, next_state: std_logic_vector ( 7 downto 0 );
	signal  index, next_index : std_logic;
	signal trigger : std_logic;
begin
	process (clk, rst)
	begin
		if rising_edge(clk) then
			if rst = '1' then
				index <= '0';
				state <= "00000000";
				trigger <= '0';
			else
				index <= next_index;
				state <= next_state;
				trigger <= not trigger;
			end if;
		end if;
	end process;

	process (a, b, state, trigger)
	begin
		if index = '0' then
			if b(0) = '0' then
				if b(1) = '0' then
					next_state <= "00000000";
				else
					next_state <= std_logic_vector(unsigned(a & "0")+"00000000");
				end if;
			else
				if b(1) = '1' then
					next_state <= std_logic_vector(unsigned(a & "00") - unsigned(a)+"00000000");
				else 
					next_state <= std_logic_vector(unsigned(a)+"00000000");
				end if;
			end if;
			next_index <= '1';
		elsif index = '1' then
			if b(2) = '0' then
				if b(3) = '0' then
					next_state <= std_logic_vector(unsigned(state));
				else 
					next_state <= std_logic_vector(unsigned(state) + unsigned(a & "000"));
				end if;
			else 
				if b(3) = '1' then
					next_state <= std_logic_vector(unsigned(state) + unsigned(a & "0000") - unsigned(a & "00"));
				else 
					next_state <= std_logic_vector(unsigned(state) + unsigned(a & "00"));
				end if;
			end if;
			next_index <= '0';
		end if;
	end process;
	
	process (state, trigger)
	begin
		result <= state;
	end process;
	
end architecture;