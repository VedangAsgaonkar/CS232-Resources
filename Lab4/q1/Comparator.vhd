library ieee;
use ieee.std_logic_1164.all;

entity Comparator is
	port (a, b: in std_logic_vector (3 downto 0);
			res : out std_logic_vector (7 downto 0));
end entity;

architecture Comparator_arch of Comparator is
	signal p,q : std_logic;
begin
	p <= (not a(3) and b(3)) or ( not (a(3) xor b(3)) and (not a(2) and b(2)) ) or ( not (a(3) xor b(3)) and not (a(2) xor b(2)) and (not a(1) and b(1)) ) or ( not (a(3) xor b(3)) and not (a(2) xor b(2)) and not (a(1) xor b(1)) and (not a(0) and b(0)) );
	q <= (not b(3) and a(3)) or ( not (a(3) xor b(3)) and (not b(2) and a(2)) ) or ( not (a(3) xor b(3)) and not (a(2) xor b(2)) and (not b(1) and a(1)) ) or ( not (a(3) xor b(3)) and not (a(2) xor b(2)) and not (a(1) xor b(1)) and (not b(0) and a(0)) );
	res(0) <= p and not q;
	res(2) <= not p and q;
	res(1) <= not p and not q;
end architecture;
