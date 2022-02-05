library ieee;
use ieee.std_logic_1164.all;

entity FourbitALU is
	port ( a, b: in std_logic_vector (3 downto 0);
	sel: in std_logic_vector (2 downto 0);
	result: out std_logic_vector (7 downto 0));
end entity;

architecture FourbitALU_arch of FourbitALU is
	signal a0,b0,a1,b1,a2,b2,a3,b3,a4,b4,a5,b5,a6,b6,a7,b7 : std_logic_vector(3 downto 0);
	signal c0,c1,c2,c3,c4,c5,c6,c7 : std_logic_vector(7 downto 0);
	component Demultiplexer 
		port  ( sel : in std_logic_vector (2 downto 0);
			 a,b : in std_logic_vector (3 downto 0);
			 a0,b0,a1,b1,a2,b2,a3,b3,a4,b4,a5,b5,a6,b6,a7,b7 : out std_logic_vector(3 downto 0));
	end component;
	component FourbitRipCarAddSub
			port  ( a, b : in std_logic_vector (3 downto 0);
				cin: in std_logic;
				sum : out std_logic_vector (7 downto 0));
	end component;
	component FourbitMultiplier
			port  ( a, b: in std_logic_vector (3 downto 0);
				prod : out std_logic_vector (7 downto 0));
	end component;
	component Comparator
			port  (a, b: in std_logic_vector (3 downto 0);
				res : out std_logic_vector (7 downto 0));
	end component;
	component FourbitNAND
		port  (a,b : in std_logic_vector (3 downto 0); c : out std_logic_vector (7 downto 0));
	end component;
	component FourbitNOR
		port  (a,b : in std_logic_vector (3 downto 0); c : out std_logic_vector (7 downto 0));
	end component;
	component FourbitXOR
		port  (a,b : in std_logic_vector (3 downto 0); c : out std_logic_vector (7 downto 0));
	end component;
	component FourbitXNOR
		port  (a,b : in std_logic_vector (3 downto 0); c : out std_logic_vector (7 downto 0));
	end component;
	component Multiplexer
		port  ( sel : in std_logic_vector (2 downto 0);
			 a : out std_logic_vector (7 downto 0);
			 a0,a1,a2,a3,a4,a5,a6,a7 : in std_logic_vector(7 downto 0));
	end component;
begin
	Demultiplexer1 : Demultiplexer 
		port map (sel => sel, a => a, b=>b, a0 => a0, b0 => b0, a1 => a1, b1 => b1, a2 => a2, b2 => b2, a3 => a3, b3 => b3, a4 => a4, b4 => b4, a5 => a5, b5 => b5, a6 => a6, b6 => b6, a7 => a7, b7 => b7);
	FourbitRipCarAddSub1 : FourbitRipCarAddSub
		port map (a=>a0, b=>b0, cin=>'0', sum=>c0);
	FourbitRipCarAddSub2 : FourbitRipCarAddSub
		port map (a=>a1, b=>b1, cin=>'1', sum=>c1);	
	FoutbitMultiplier1 : FourbitMultiplier
		port map (a=>a2, b=>b2, prod=>c2);
	Comparator1 : Comparator
		port map (a=>a3, b=>b3, res=>c3);
	FourbitNAND1 : FourbitNAND
		port map (a=>a4, b=>b4, c=>c4);
	FourbitNOR1 : FourbitNOR
		port map (a=>a5, b=>b5, c=>c5);
	FourbitXOR1 : FourbitXOR
		port map (a=>a6, b=>b6, c=>c6);
	FourbitXNOR1 : FourbitXNOR
		port map (a=>a7, b=>b7, c=>c7);
	Multiplexer1 : Multiplexer
		port map (sel => sel, a => result, a0 => c0, a1 => c1, a2 => c2, a3 => c3, a4 => c4, a5 => c5, a6 => c6, a7 => c7);
	
end architecture;