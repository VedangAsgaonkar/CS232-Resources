library ieee;
use ieee.std_logic_1164.all;

entity FourbitRipCarAddSub is
	port ( a, b : in std_logic_vector (3 downto 0);
	cin: in std_logic;
	sum : out std_logic_vector (3 downto 0);
	cout: out std_logic);
end entity;

architecture FourbitRipCarAddSub_arch of FourbitRipCarAddSub is 
	component FourbitRipCarAdd 
		port ( a, b : in std_logic_vector (3 downto 0);
		cin: in std_logic;
		sum : out std_logic_vector (3 downto 0);
		cout: out std_logic);
	end component;
	signal b2 : std_logic_vector (3 downto 0);
begin
	b2(0) <= cin xor b(0);
	b2(1) <= cin xor b(1);
	b2(2) <= cin xor b(2);
	b2(3) <= cin xor b(3);
	FourbitRipCarAddInst1 : FourbitRipCarAdd 
		port map( a=>a, b=>b2, cin=>cin, sum=>sum, cout=>cout);
end architecture;