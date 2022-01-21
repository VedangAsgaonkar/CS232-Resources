library ieee;
use ieee.std_logic_1164.all;

entity MUX is
	port( x0,x1,s : in std_logic; o : out std_logic);
end entity;

architecture MUX_arch of MUX is	
begin
	o <= (s and x1) or (not s and x0);
end architecture;