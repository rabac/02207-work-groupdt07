-- VHDL Model Created from SGE Symbol mux.sym -- May 27 12:33:10 1998

library IEEE;
   use IEEE.std_logic_1164.all;
   use IEEE.std_logic_misc.all;
   use IEEE.std_logic_arith.all;

entity MUX is
      Port (       A : In    std_logic_vector (56 downto 0);
                   B : In    std_logic_vector (56 downto 0);
                 SEL : In    std_logic;
                   Z : Out   std_logic_vector (56 downto 0) );
end MUX;

architecture BEHAVIORAL of MUX is

   begin

    process (A, B, SEL)
      begin

        if ( SEL = '1' ) then

              Z <= A ;

        else     
              Z <= B ;

        end if;

    end process;

end BEHAVIORAL;

configuration CFG_MUX_BEHAVIORAL of MUX is
   for BEHAVIORAL

   end for;

end CFG_MUX_BEHAVIORAL;
