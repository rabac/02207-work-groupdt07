library IEEE;
   use IEEE.std_logic_1164.all;
   use IEEE.std_logic_misc.all;
   use IEEE.std_logic_signed.all;
   use IEEE.std_logic_arith.all;

entity SHIFTREG_GATED is
      Port (   CLK : In    std_logic;
               RESET : In    std_logic;
                  QK : In    std_logic_vector (7 downto 0);
                   Q : Out   std_logic_vector (31 downto 0) );
end SHIFTREG_GATED;

architecture BEH_SHIFTREG_GATED of SHIFTREG_GATED is
   component Counter is
   port(	
      clock:	in std_logic;
      clear: in std_logic;
	   Qc:	out std_logic_vector(1 downto 0)
   );   
   end component Counter;

	component REG is
	port(
		D : in std_logic_vector(7 downto 0);
		Clock, Reset : in std_logic;
		Q : out std_logic_vector(7 downto 0)
		);
	end component REG;

   component DECODER is
      port(	I:	in std_logic_vector(1 downto 0);
	         O:	out std_logic_vector(3 downto 0)
           );
   end component DECODER;

	signal out_counter : std_logic_vector(1 downto 0);
	signal out_decoder : std_logic_vector(3 downto 0);
	begin

	c1: Counter port map (CLK, Reset, out_counter);
   
   d1: DECODER port map (out_counter, out_decoder);
   
	r1: REG port map (QK, out_decoder(3), Reset, Q(31 downto 24));
	r2: REG port map (QK, out_decoder(2), Reset, Q(23 downto 16));
	r3: REG port map (QK, out_decoder(1), Reset, Q(15 downto 8));
	r4: REG port map (QK, out_decoder(0), Reset, Q(7 downto 0));
	
end BEH_SHIFTREG_GATED;

configuration CFG_SHIFTREG_GATED_SCHEMATIC of SHIFTREG_GATED is
   for BEH_SHIFTREG_GATED
   end for;

end CFG_SHIFTREG_GATED_SCHEMATIC;
