library ieee;
use ieee.std_logic_1164.all;

entity FourbitRipCarAddSub is
	port ( a, b : in std_logic_vector (3 downto 0);
	cin: in std_logic;
	sum : out std_logic_vector (7 downto 0));
end entity;

architecture FourbitRipCarAddSub_arch of FourbitRipCarAddSub is 
	component FourbitRipCarAdd 
		port ( a, b : in std_logic_vector (3 downto 0);
		cin: in std_logic;
		sum : out std_logic_vector (3 downto 0);
		cout: out std_logic);
	end component;
	component xor_gate
		port ( a, b: in std_logic; c : out std_logic);
	end component;
	signal b2,sum1 : std_logic_vector (3 downto 0);
	signal cout : std_logic;
begin
	xor_Inst1 : xor_gate
		port map (a => b(0), b => cin, c => b2(0));
	xor_Inst2 : xor_gate
		port map (a => b(1), b => cin, c => b2(1));
	xor_Inst3 : xor_gate
		port map (a => b(2), b => cin, c => b2(2));
	xor_Inst4 : xor_gate
		port map (a => b(3), b => cin, c => b2(3));
	FourbitRipCarAddInst1 : FourbitRipCarAdd 
		port map( a=>a, b=>b2, cin=>cin, sum=>sum1, cout=>cout);
	sum(0) <= sum1(0);
	sum(1) <= sum1(1);
	sum(2) <= sum1(2);
	sum(3) <= sum1(3);
	sum(4) <= cout;
end architecture;