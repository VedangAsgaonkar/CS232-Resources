library ieee;
use ieee.std_logic_1164.all;

entity FourbitXNOR is
	port (a,b : in std_logic_vector (3 downto 0); c : out std_logic_vector (7 downto 0));
end entity;

architecture FourbitXNOR_arch of FourbitXNOR is

begin
	c(0) <= (a(0) and b(0)) or (not a(0) and not b(0));
	c(1) <= (a(1) and b(1)) or (not a(1) and not b(1));
	c(2) <= (a(2) and b(2)) or (not a(2) and not b(2));
	c(3) <= (a(3) and b(3)) or (not a(3) and not b(3));
end architecture;