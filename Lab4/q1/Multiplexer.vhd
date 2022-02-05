library ieee;
use ieee.std_logic_1164.all;

entity Multiplexer is
	port ( sel : in std_logic_vector (2 downto 0);
			 a : out std_logic_vector (7 downto 0);
			 a0,a1,a2,a3,a4,a5,a6,a7 : in std_logic_vector(7 downto 0));
end entity;	

architecture Multiplexer_arch of Multiplexer is
	signal x0,x1,x2,x3,x4,x5,x6,x7 : std_logic_vector (7 downto 0);
begin
	x0 <= (others => ( (sel(0) xor '1') and (sel(1) xor '1') and (sel(2) xor '1')  ));
	x1 <= (others => ( (sel(0) xor '0') and (sel(1) xor '1') and (sel(2) xor '1')  ));
	x2 <= (others => ( (sel(0) xor '1') and (sel(1) xor '0') and (sel(2) xor '1')  ));
	x3 <= (others => ( (sel(0) xor '0') and (sel(1) xor '0') and (sel(2) xor '1')  ));
	x4 <= (others => ( (sel(0) xor '1') and (sel(1) xor '1') and (sel(2) xor '0')  ));
	x5 <= (others => ( (sel(0) xor '0') and (sel(1) xor '1') and (sel(2) xor '0')  ));
	x6 <= (others => ( (sel(0) xor '1') and (sel(1) xor '0') and (sel(2) xor '0')  ));
	x7 <= (others => ( (sel(0) xor '0') and (sel(1) xor '0') and (sel(2) xor '0')  ));

	
	a <= (a0 and x0) or (a1 and x1) or (a2 and x2) or (a3 and x3) or (a4 and x4) or (a5 and x5) or (a6 and x6) or (a7 and x7) ;
end architecture;