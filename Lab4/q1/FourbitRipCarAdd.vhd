library ieee;
use ieee.std_logic_1164.all;

entity FourbitRipCarAdd is
	port ( a, b : in std_logic_vector (3 downto 0);
		cin: in std_logic;
		sum : out std_logic_vector (3 downto 0);
		cout: out std_logic);
end entity;

architecture FourbitRipCarAdd_arch of FourbitRipCarAdd is
	component OnebitFullAdd
		port ( a, b, cin : in std_logic; sum, cout: out std_logic);
	end component;
	signal c0,c1,c2 : std_logic;
begin
	OnebitFullAddInst1 : OnebitFullAdd
		port map( a => a(0), b => b(0), cin => cin, sum => sum(0), cout => c0);
	OnebitFullAddInst2 : OnebitFullAdd
		port map( a => a(1), b => b(1), cin => c0, sum => sum(1), cout => c1);
	OnebitFullAddInst3 : OnebitFullAdd
		port map( a => a(2), b => b(2), cin => c1, sum => sum(2), cout => c2);
	OnebitFullAddInst4 : OnebitFullAdd
		port map( a => a(3), b => b(3), cin => c2, sum => sum(3), cout => cout);		
end architecture;