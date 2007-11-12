library IEEE;
   use IEEE.std_logic_1164.all;
   use IEEE.std_logic_misc.all;
   use IEEE.std_logic_signed.all;
   use IEEE.std_logic_arith.all;



entity bit32ShiftRegisterGated is
      Port (   CLOCK : In    std_logic;
               RESET : In    std_logic;
                  QK : In    std_logic_vector (7 downto 0);
                   Q : InOut   std_logic_vector (31 downto 0) );
end SHIFTREG;

architecture BEHAVIORAL of bit32ShiftRegisterGated is

   begin
    process(RESET,CLOCK)
     
     begin


    if ((CLOCK = '1') AND (CLOCK'EVENT)) then
		
		r1: bit8REG port map (QK, Clock, Reset, Q(7 downto 0));
      r2: bit8REG port map (QK, Clock, Reset, Q(15 downto 8));
      r3: bit8REG port map (QK, Clock, Reset, Q(23 downto 16));
      r4: bit8REG port map (QK, Clock, Reset, Q(31 downto 24));
      
      
	end if;
    end process;

end BEHAVIORAL;

configuration CFG_SHIFTREG_BEHAVIORAL of SHIFTREG is
   for BEHAVIORAL
   end for;

end CFG_SHIFTREG_BEHAVIORAL;
