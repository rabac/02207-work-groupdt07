library IEEE;
   use IEEE.std_logic_1164.all;
   use IEEE.std_logic_misc.all;
   use IEEE.std_logic_signed.all;
   use IEEE.std_logic_arith.all;

entity SHIFTREG is
      Port (   CLOCK : In    std_logic;
               RESET : In    std_logic;
              disable : In    std_logic;
                  QK : In    std_logic_vector (7 downto 0);
                   Q : InOut   std_logic_vector (71 downto 0) );
end SHIFTREG;

architecture BEH_SHIFTREG of SHIFTREG is

   begin
    process(RESET,CLOCK,disable)
     variable i,j,k,l : integer;
     begin

       if ( RESET = '0' ) then
          for i in 0 to 71 loop
              q(i) <= '0';
          end loop;
       elsif (disable='0') then

          if((CLOCK = '1') AND (CLOCK'EVENT)) then
		         for i in 71 downto 8 loop
		               q(i-8) <= q(i);
		         end loop;
               q(71 downto 64) <= qk;
	       end if;
	    else
	       if((CLOCK = '1') AND (CLOCK'EVENT)) then
		         for i in 71 downto 8 loop
		               q(i) <= q(i);
		         end loop;
	          
	       end if;
       end if;

    end process;

end BEH_SHIFTREG;