library ieee;
use ieee.std_logic_1164.all;

entity ThreebyEightDecode is
	port ( i : in std_logic_vector(2 downto 0);
	en: in std_logic;
	z : out std_logic_vector(7 downto 0));
end entity;

architecture ThreebyEightDecode_arch of ThreebyEightDecode is

	component NAND_gate
		port (a, b: in std_logic; c : out std_logic);
	end component;
		
	signal p_7_0,p_7_1,p_7_2,p_7_3,p_7_e1 : std_logic;
	signal p_6_0,p_6_1,p_6_2,p_6_3,p_6_e1 : std_logic;
	signal p_5_0,p_5_1,p_5_2,p_5_3,p_5_e1 : std_logic;
	signal p_4_0,p_4_1,p_4_2,p_4_3,p_4_e1 : std_logic;
	signal p_3_0,p_3_1,p_3_2,p_3_3,p_3_e1 : std_logic;
	signal p_2_0,p_2_1,p_2_2,p_2_3,p_2_e1 : std_logic;
	signal p_1_0,p_1_1,p_1_2,p_1_3,p_1_e1 : std_logic;
	signal p_0_0,p_0_1,p_0_2,p_0_3,p_0_e1 : std_logic;
	
	signal p_6_i0 : std_logic;
	signal p_5_i1 : std_logic;
	signal p_4_i0, p_4_i1 : std_logic;
	signal p_3_i2 : std_logic;
	signal p_2_i0, p_2_i2 : std_logic;
	signal p_1_i2, p_1_i1 : std_logic;
	signal p_0_i0, p_0_i1, p_0_i2 : std_logic;
	
begin

	NAND_gateInst_7_0: NAND_gate
		port map(a => i(0), b => i(1), c => p_7_0);
	NAND_gateInst_7_1: NAND_gate
		port map(a => p_7_0, b => p_7_0, c => p_7_1);
	NAND_gateInst_7_2: NAND_gate
		port map(a => i(2), b => p_7_1, c => p_7_2);
	NAND_gateInst_7_3: NAND_gate
		port map(a => p_7_2, b => p_7_2, c => p_7_3);
	NAND_gateInst_7_e1: NAND_gate
		port map(a => p_7_3, b => en, c => p_7_e1);
	NAND_gateInst_7_e2: NAND_gate
		port map(a => p_7_e1, b => p_7_e1, c => z(7));
		
	NAND_gateInst_6_i0: NAND_gate
		port map(a => i(0), b => i(0), c => p_6_i0);	
	NAND_gateInst_6_0: NAND_gate
		port map(a => p_6_i0, b => i(1), c => p_6_0);
	NAND_gateInst_6_1: NAND_gate
		port map(a => p_6_0, b => p_6_0, c => p_6_1);
	NAND_gateInst_6_2: NAND_gate
		port map(a => i(2), b => p_6_1, c => p_6_2);
	NAND_gateInst_6_3: NAND_gate
		port map(a => p_6_2, b => p_6_2, c => p_6_3);
	NAND_gateInst_6_e1: NAND_gate
		port map(a => p_6_3, b => en, c => p_6_e1);
	NAND_gateInst_6_e2: NAND_gate
		port map(a => p_6_e1, b => p_6_e1, c => z(6));
		
	NAND_gateInst_5_i1: NAND_gate
		port map(a => i(1), b => i(1), c => p_5_i1);	
	NAND_gateInst_5_0: NAND_gate
		port map(a => p_5_i1, b => i(0), c => p_5_0);
	NAND_gateInst_5_1: NAND_gate
		port map(a => p_5_0, b => p_5_0, c => p_5_1);
	NAND_gateInst_5_2: NAND_gate
		port map(a => i(2), b => p_5_1, c => p_5_2);
	NAND_gateInst_5_3: NAND_gate
		port map(a => p_5_2, b => p_5_2, c => p_5_3);
	NAND_gateInst_5_e1: NAND_gate
		port map(a => p_5_3, b => en, c => p_5_e1);
	NAND_gateInst_5_e2: NAND_gate
		port map(a => p_5_e1, b => p_5_e1, c => z(5));
		
	NAND_gateInst_4_i0: NAND_gate
		port map(a => i(0), b => i(0), c => p_4_i0);	
	NAND_gateInst_4_i1: NAND_gate
		port map(a => i(1), b => i(1), c => p_4_i1);
	NAND_gateInst_4_0: NAND_gate
		port map(a => p_4_i0, b => p_4_i1, c => p_4_0);
	NAND_gateInst_4_1: NAND_gate
		port map(a => p_4_0, b => p_4_0, c => p_4_1);
	NAND_gateInst_4_2: NAND_gate
		port map(a => i(2), b => p_4_1, c => p_4_2);
	NAND_gateInst_4_3: NAND_gate
		port map(a => p_4_2, b => p_4_2, c => p_4_3);
	NAND_gateInst_4_e1: NAND_gate
		port map(a => p_4_3, b => en, c => p_4_e1);
	NAND_gateInst_4_e2: NAND_gate
		port map(a => p_4_e1, b => p_4_e1, c => z(4));
		
	NAND_gateInst_3_0: NAND_gate
		port map(a => i(0), b => i(1), c => p_3_0);
	NAND_gateInst_3_1: NAND_gate
		port map(a => p_3_0, b => p_3_0, c => p_3_1);
	NAND_gateInst_3_i2: NAND_gate
		port map(a => i(2), b => i(2), c => p_3_i2);
	NAND_gateInst_3_2: NAND_gate
		port map(a => p_3_i2, b => p_3_1, c => p_3_2);
	NAND_gateInst_3_3: NAND_gate
		port map(a => p_3_2, b => p_3_2, c => p_3_3);
	NAND_gateInst_3_e1: NAND_gate
		port map(a => p_3_3, b => en, c => p_3_e1);
	NAND_gateInst_3_e2: NAND_gate
		port map(a => p_3_e1, b => p_3_e1, c => z(3));
		
	NAND_gateInst_2_i0: NAND_gate
		port map(a => i(0), b => i(0), c => p_2_i0);	
	NAND_gateInst_2_0: NAND_gate
		port map(a => p_2_i0, b => i(1), c => p_2_0);
	NAND_gateInst_2_1: NAND_gate
		port map(a => p_2_0, b => p_2_0, c => p_2_1);
	NAND_gateInst_2_i2: NAND_gate
		port map(a => i(2), b => i(2), c => p_2_i2);
	NAND_gateInst_2_2: NAND_gate
		port map(a => p_2_i2, b => p_2_1, c => p_2_2);
	NAND_gateInst_2_3: NAND_gate
		port map(a => p_2_2, b => p_2_2, c => p_2_3);
	NAND_gateInst_2_e1: NAND_gate
		port map(a => p_2_3, b => en, c => p_2_e1);
	NAND_gateInst_2_e2: NAND_gate
		port map(a => p_2_e1, b => p_2_e1, c => z(2));
		
	NAND_gateInst_1_i1: NAND_gate
		port map(a => i(1), b => i(1), c => p_1_i1);	
	NAND_gateInst_1_0: NAND_gate
		port map(a => p_1_i1, b => i(0), c => p_1_0);
	NAND_gateInst_1_1: NAND_gate
		port map(a => p_1_0, b => p_1_0, c => p_1_1);
	NAND_gateInst_1_i2: NAND_gate
		port map(a => i(2), b => i(2), c => p_1_i2);
	NAND_gateInst_1_2: NAND_gate
		port map(a => p_1_i2, b => p_1_1, c => p_1_2);
	NAND_gateInst_1_3: NAND_gate
		port map(a => p_1_2, b => p_1_2, c => p_1_3);
	NAND_gateInst_1_e1: NAND_gate
		port map(a => p_1_3, b => en, c => p_1_e1);
	NAND_gateInst_1_e2: NAND_gate
		port map(a => p_1_e1, b => p_1_e1, c => z(1));
		
	NAND_gateInst_0_i0: NAND_gate
		port map(a => i(0), b => i(0), c => p_0_i0);	
	NAND_gateInst_0_i1: NAND_gate
		port map(a => i(1), b => i(1), c => p_0_i1);
	NAND_gateInst_0_0: NAND_gate
		port map(a => p_0_i0, b => p_0_i1, c => p_0_0);
	NAND_gateInst_0_1: NAND_gate
		port map(a => p_0_0, b => p_0_0, c => p_0_1);
	NAND_gateInst_0_i2: NAND_gate
		port map(a => i(2), b => i(2), c => p_0_i2);
	NAND_gateInst_0_2: NAND_gate
		port map(a => p_0_i2, b => p_0_1, c => p_0_2);
	NAND_gateInst_0_3: NAND_gate
		port map(a => p_0_2, b => p_0_2, c => p_0_3);
	NAND_gateInst_0_e1: NAND_gate
		port map(a => p_0_3, b => en, c => p_0_e1);
	NAND_gateInst_0_e2: NAND_gate
		port map(a => p_0_e1, b => p_0_e1, c => z(0));
		

end architecture;