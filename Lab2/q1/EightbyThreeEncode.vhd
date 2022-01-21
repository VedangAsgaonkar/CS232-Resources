library ieee;
use ieee.std_logic_1164.all;

entity EightbyThreeEncode is
	port ( i : in std_logic_vector(7 downto 0);
	en: in std_logic;
	z : out std_logic_vector(2 downto 0));
end entity;

architecture EightbyThreeEncode_arch of EightbyThreeEncode is

	component MUX
		port( x0,x1,s : in std_logic; o:	out std_logic);
	end component;
	
	signal p_2_7,p_2_6,p_2_5,p_2_4,p_1_7,p_1_6,p_1_3,p_1_2,p_0_7,p_0_5,p_0_3,p_0_1 : std_logic;
	
begin

	MUXInst_2_7: MUX
		port map( x0 => '0', x1 => '1', s => i(7), o => p_2_7 );
		
	MUXInst_2_6: MUX
		port map( x0 => p_2_7, x1 => '1', s => i(6), o => p_2_6);
		
	MUXInst_2_5: MUX
		port map( x0 => p_2_6, x1 => '1', s => i(5), o => p_2_5);	
		
	MUXInst_2_4: MUX
		port map( x0 => p_2_5 , x1 => '1', s => i(4), o => p_2_4);

	MUXInst_1_7: MUX
		port map( x0 => '0', x1 => '1', s => i(7), o => p_1_7 );
		
	MUXInst_1_6: MUX
		port map( x0 => p_1_7, x1 => '1', s => i(6), o => p_1_6);
		
	MUXInst_1_3: MUX
		port map( x0 => p_1_6, x1 => '1', s => i(3), o => p_1_3);	
		
	MUXInst_1_2: MUX
		port map( x0 => p_1_3 , x1 => '1', s => i(2), o => p_1_2);
		
	MUXInst_0_7: MUX
		port map( x0 => '0', x1 => '1', s => i(7), o => p_0_7 );
		
	MUXInst_0_5: MUX
		port map( x0 => p_0_7, x1 => '1', s => i(5), o => p_0_5);
		
	MUXInst_0_3: MUX
		port map( x0 => p_0_5, x1 => '1', s => i(3), o => p_0_3);	
		
	MUXInst_0_1: MUX
		port map( x0 => p_0_3 , x1 => '1', s => i(1), o => p_0_1);
		
	MUXInst_2: MUX
		port map( x0 => '0', x1 => p_2_4, s => en, o => z(2));
		
	MUXInst_1: MUX
		port map( x0 => '0', x1 => p_1_2, s => en, o => z(1));
	
	MUXInst_0: MUX
		port map( x0 => '0', x1 => p_0_1, s => en, o => z(0));
		
end EightbyThreeEncode_arch;