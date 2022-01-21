library ieee;
use ieee.std_logic_1164.all;

entity NAND_gate is
	port( a,b : in std_logic; c : out std_logic);
end entity;

architecture NAND_gate_arch of NAND_gate is
begin 
	c <= not ( a and b );
end architecture;