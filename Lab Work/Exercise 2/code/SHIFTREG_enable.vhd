-- @author Rajesh

library IEEE;
   use IEEE.std_logic_1164.all;
   use IEEE.std_logic_misc.all;
   use IEEE.std_logic_signed.all;
   use IEEE.std_logic_arith.all;

entity SHIFTREG_ENABLE is
   Port (
		CLOCK : In    std_logic;
		RESET : In    std_logic;
		QK : In       std_logic_vector (7 downto 0);
		Q : InOut     std_logic_vector (31 downto 0);
		en0: In	std_logic;
		en1: In	std_logic;
		en2: In	std_logic;
		en3: In	std_logic
	);
end SHIFTREG_ENABLE;


architecture BEH_SHIFTREG_ENABLE of SHIFTREG_ENABLE is

	component REG is
	port(
		D : in std_logic_vector(7 downto 0);
		Clock, Reset : in std_logic;
		Q : out std_logic_vector(7 downto 0)
		);
	end component REG;

	component MUX is
	port (
		Q0 : in std_logic_vector(7 downto 0);
		Q1 : in std_logic_vector(7 downto 0);
		enable: in std_logic;
		Qmux : out std_logic_vector(7 downto 0)
		);
	end component MUX;


	signal Qout0, Qout1, Qout2, Qout3 : std_logic_vector(7 downto 0);
	begin

	m1: MUX port map (Q(31 downto 24), QK, en0, Qout0);
	m2: MUX port map (Q(23 downto 16), QK, en1, Qout1);
	m3: MUX port map (Q(15 downto 8), QK, en2, Qout2);
	m4: MUX port map (Q(7 downto 0), QK, en3, Qout3);

	r1: REG port map (Qout0, Clock, Reset, Q(31 downto 24));
	r2: REG port map (Qout1, Clock, Reset, Q(23 downto 16));
	r3: REG port map (Qout2, Clock, Reset, Q(15 downto 8));
	r4: REG port map (Qout3, Clock, Reset, Q(7 downto 0));

end BEH_SHIFTREG_ENABLE;

configuration CFG_SHIFTREG_enable_SCHEMATIC of SHIFTREG_ENABLE is
   for BEH_SHIFTREG_ENABLE
   end for;

end CFG_SHIFTREG_enable_SCHEMATIC;