-- VHDL Model Created from SGE Symbol control.sym -- May  5 18:26:48 1995

library IEEE;
   use IEEE.std_logic_1164.all;
   use IEEE.std_logic_misc.all;
   use IEEE.std_logic_arith.all;

entity CONTROL is
      Port (   CLOCK : In    std_logic;
               RESET : In    std_logic;
                 CL1 : Out   std_logic;
               DIGIT : Out   std_logic;
                 LD1 : Out   std_logic;
                 MX1 : Out   std_logic;
               ROUND : Out   std_logic );
end CONTROL;

architecture BEHAVIORAL of CONTROL is

   begin
   process(reset,clock)
   variable state : integer range 0 to 29;
    begin

        if ( reset = '0' ) then
          CL1 <= '0';
          LD1 <= '0';
          DIGIT <= '0' ;
          ROUND <= '1' ;
          MX1 <= '1' ;
	  state := 0;

        elsif ((clock'EVENT) AND ( clock = '1' )) then

		if( 0 = state ) then
                         ROUND <= '0' ;
			 CL1 <= '1';
			 LD1 <= '1';
                         state  := 1 ;

		elsif( 1 = state ) then
                         DIGIT <= '1' ;
			 MX1 <= '0' ;
                         state  := 2 ;

		elsif( 29 = state ) then
                         DIGIT <= '0' ;
                         ROUND <= '1' ;
			 MX1 <= '1' ;
			 LD1 <= '0';
                         state  := 0 ;
			
		else
                         state  := state + 1 ;
        	end if;
        end if;

    end process;

end BEHAVIORAL;

configuration CFG_CONTROL_BEHAVIORAL of CONTROL is
   for BEHAVIORAL

   end for;

end CFG_CONTROL_BEHAVIORAL;
