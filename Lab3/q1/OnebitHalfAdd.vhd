library ieee;
use ieee.std_logic_1164.all;

entity OnebitHalfAdd is
	port( a,b : in std_logic;
			s,c : out std_logic);
end entity;

architecture OnebutHalfAdd_arch of OnebitHalfAdd is

begin
	s <= (a or b) and (not(a and b));
	c <= a and b;
end architecture;