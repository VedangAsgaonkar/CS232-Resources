library ieee;
use ieee.std_logic_1164.all;

entity Demultiplexer is
	port ( sel : in std_logic_vector (2 downto 0);
			 a,b : in std_logic_vector (3 downto 0);
			 a0,b0,a1,b1,a2,b2,a3,b3,a4,b4,a5,b5,a6,b6,a7,b7 : out std_logic_vector(3 downto 0));
end entity;	

architecture Demultiplexer_arch of Demultiplexer is
	signal x0,x1,x2,x3,x4,x5,x6,x7 : std_logic_vector (3 downto 0);
begin
	x0 <= (others => ( (sel(0) xor '1') and (sel(1) xor '1') and (sel(2) xor '1')  ));
	a0 <= a and x0;
	b0 <= b and x0;

	x1 <= (others => ( (sel(0) xor '0') and (sel(1) xor '1') and (sel(2) xor '1')  ));
	a1 <= a and x1;
	b1 <= b and x1;
	
	x2 <= (others => ( (sel(0) xor '1') and (sel(1) xor '0') and (sel(2) xor '1')  ));
	a2 <= a and x2;
	b2 <= b and x2;
	
	x3 <= (others => ( (sel(0) xor '0') and (sel(1) xor '0') and (sel(2) xor '1')  ));
	a3 <= a and x3;
	b3 <= b and x3;
	
	x4 <= (others => ( (sel(0) xor '1') and (sel(1) xor '1') and (sel(2) xor '0')  ));
	a4 <= a and x4;
	b4 <= b and x4;
	
	x5 <= (others => ( (sel(0) xor '0') and (sel(1) xor '1') and (sel(2) xor '0')  ));
	a5 <= a and x5;
	b5 <= b and x5;
	
	x6 <= (others => ( (sel(0) xor '1') and (sel(1) xor '0') and (sel(2) xor '0')  ));
	a6 <= a and x6;
	b6 <= b and x6;
	
	x7 <= (others => ( (sel(0) xor '0') and (sel(1) xor '0') and (sel(2) xor '0')  ));
	a7 <= a and x7;
	b7 <= b and x7;
end architecture;