library ieee;
use ieee.std_logic_1164.all;

entity OnebitFullAdd is
	port ( a, b, cin : in std_logic;
	sum, cout: out std_logic);
end entity;

architecture OnebitFullAdd_arch of OnebitFullAdd is
	component OnebitHalfAdd
		port (a,b : in std_logic; s,c : out std_logic);
	end component;
	signal p,q,r : std_logic;
begin
	OnebitHalfAddInst1: OnebitHalfAdd
		port map(a => a, b => b, s => p, c => q);
		
	OnebitHalfAddInst2: OnebitHalfAdd
		port map(a => p, b => cin, s => sum, c => r);
		
	cout <= r or q;
end architecture;