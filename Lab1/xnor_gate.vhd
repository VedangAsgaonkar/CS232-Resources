library ieee;
use ieee.std_logic_1164.all;

entity xnor_gate is
	port( a,b : in std_logic; c : out std_logic);
end entity;

architecture xnor_arch of xnor_gate is
	signal p, q, r, s : std_logic;
	
	component and_gate
		port(a, b: in std_logic; c : out std_logic);
	end component;
	
	component or_gate
		port (a, b: in std_logic; c : out std_logic);
	end component;
	
	component not_gate
		port (a: in std_logic; b : out std_logic);
	end component;

begin

	OrInst1: or_gate
		port map(a=>r, b=>s,  c=>c);
		
	AndInst1: and_gate
		port map(a=>a, b=>b,  c=>r);
		
	AndInst2: and_gate
		port map(a=>p, b=>q,  c=>s);
		
	NotInst1: not_gate
		port map(a=>a, b=>p);
		
	NotInst2: not_gate
		port map(a=>b, b=>q);


end architecture;