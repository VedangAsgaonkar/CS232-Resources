library ieee;
use ieee.std_logic_1164.all;

entity FourbitMultiplier is
	port ( a, b: in std_logic_vector (3 downto 0);
			prod : out std_logic_vector (7 downto 0));
end entity;

architecture FourbitMultiplier_arch of FourbitMultiplier is 
	component OnebitFullAdd
			port ( a, b, cin : in std_logic;
			sum, cout: out std_logic);
	end component;
	component OnebitHalfAdd
			port( a,b : in std_logic;
			s,c : out std_logic);
	end component;
	signal p0, p1, p2, p3 : std_logic_vector(3 downto 0);
	signal x0, x1, x2, x3 : std_logic_vector(3 downto 0);
	signal c_0_0, c_1_0, c_2_0, c_3_0 : std_logic;
	signal c_4_1, c_1_1, c_2_1, c_3_1 : std_logic;
	signal c_4_2, c_5_2, c_2_2, c_3_2 : std_logic;
	signal c_4_3, c_5_3, c_6_3, c_3_3 : std_logic;
	signal c_4_4, c_5_4, c_6_4, c_7_4 : std_logic;
	signal c_5, c_6, c_7, dump : std_logic;
	signal s_1_1, s_2_1, s_3_1, s_2_2, s_3_2, s_4_2, s_3_3, s_4_3, s_5_3, s_4_4, s_5_4, s_6_4 : std_logic;
begin
	x0 <= (others => b(0));
	x1 <= (others => b(1));
	x2 <= (others => b(2));
	x3 <= (others => b(3));
	
	p0 <= a and x0;
	p1 <= a and x1;
	p2 <= a and x2;
	p3 <= a and x3;
	
	c_0_0 <= '0';
	c_1_0 <= '0';
	c_2_0 <= '0';
	c_3_0 <= '0';
	
	OnebitHalfAdd1 : OnebitHalfAdd
		port map ( a => p0(0), b => c_0_0, s => prod(0), c => c_1_1);
	OnebitHalfAdd2 : OnebitHalfAdd
		port map ( a => p0(1), b => c_1_0, s => s_1_1, c => c_2_1);
	OnebitHalfAdd3 : OnebitHalfAdd
		port map ( a => p0(2), b => c_2_0, s => s_2_1, c => c_3_1);
	OnebitHalfAdd4 : OnebitHalfAdd
		port map ( a => p0(3), b => c_3_0, s => s_3_1, c => c_4_1);
	
	OnebitFullAdd1 : OnebitFullAdd
		port map ( a => p1(0), b => s_1_1, cin => c_1_1, sum => prod(1), cout => c_2_2);
	OnebitFullAdd2 : OnebitFullAdd
		port map ( a => p1(1), b => s_2_1, cin => c_2_1, sum => s_2_2, cout => c_3_2);
	OnebitFullAdd3 : OnebitFullAdd
		port map ( a => p1(2), b => s_3_1, cin => c_3_1, sum => s_3_2 , cout => c_4_2);
	OnebitFullAdd4 : OnebitFullAdd
		port map ( a => p1(3), b => '0', cin => c_4_1, sum => s_4_2, cout => c_5_2);
		
	OnebitFullAdd5 : OnebitFullAdd
		port map ( a => p2(0), b => s_2_2, cin => c_2_2, sum => prod(2), cout => c_3_3);
	OnebitFullAdd6 : OnebitFullAdd
		port map ( a => p2(1), b => s_3_2, cin => c_3_2, sum => s_3_3, cout => c_4_3);
	OnebitFullAdd7 : OnebitFullAdd
		port map ( a => p2(2), b => s_4_2, cin => c_4_2, sum => s_4_3 , cout => c_5_3);
	OnebitFullAdd8 : OnebitFullAdd
		port map ( a => p2(3), b => '0', cin => c_5_2, sum => s_5_3, cout => c_6_3);
		
	OnebitFullAdd9 : OnebitFullAdd
		port map ( a => p3(0), b => s_3_3, cin => c_3_3, sum => prod(3), cout => c_4_4);
	OnebitFullAdd10 : OnebitFullAdd
		port map ( a => p3(1), b => s_4_3, cin => c_4_3, sum => s_4_4, cout => c_5_4);
	OnebitFullAdd11 : OnebitFullAdd
		port map ( a => p3(2), b => s_5_3, cin => c_5_3, sum => s_5_4 , cout => c_6_4);
	OnebitFullAdd12 : OnebitFullAdd
		port map ( a => p3(3), b => '0', cin => c_6_3, sum => s_6_4, cout => c_7_4);
		
	OnebitFullAdd13 : OnebitFullAdd
		port map ( a => s_4_4, b => c_4_4, cin => '0', sum => prod(4), cout => c_5);
	OnebitFullAdd14 : OnebitFullAdd
		port map ( a => s_5_4, b => c_5_4, cin => c_5, sum => prod(5), cout => c_6);
	OnebitFullAdd15 : OnebitFullAdd
		port map ( a => s_6_4, b => c_6_4, cin => c_6, sum => prod(6) , cout => c_7);
	OnebitFullAdd16 : OnebitFullAdd
		port map ( a => '0', b => c_7_4, cin => c_7, sum => prod(7), cout => dump);
end architecture;