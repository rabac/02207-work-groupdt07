-- VHDL Model Created from SGE Symbol mult.sym -- May 27 12:32:12 1998

library IEEE;
   use IEEE.std_logic_1164.all;
   use IEEE.std_logic_misc.all;
   use IEEE.std_logic_arith.all;

entity MULT is
      Port (       A : In    std_logic_vector (54 downto 0);
                  M1 : In    std_logic;
                  M2 : In    std_logic;
                  P1 : In    std_logic;
                  P2 : In    std_logic;
                COUT : Out   std_logic;
                   Z : Out   std_logic_vector (56 downto 0) );
end MULT;

architecture BEHAVIORAL of MULT is

   begin
    process (M1, M2, P1, P2, A)
     variable    pd : std_logic;

      begin

	Z(0) <=  M1 OR M2;
	Z(1) <=  M1 OR M2;
	pd := '0';
	for i in 0 to 53 loop
	    Z(i+2) <= ( M2 AND NOT(pd) ) OR ( M1 AND NOT(A(i)) ) OR 
	            ( P1 AND A(i) )   OR ( P2 AND pd ) ;
	    pd := A(i);
	end loop;
        Z(56) <= ( pd AND P2 ) OR ( NOT(pd) AND M2 ) OR M1;
	cout <= M1 or M2 ;

      end process;

end BEHAVIORAL;

configuration CFG_MULT_BEHAVIORAL of MULT is
   for BEHAVIORAL

   end for;

end CFG_MULT_BEHAVIORAL;
