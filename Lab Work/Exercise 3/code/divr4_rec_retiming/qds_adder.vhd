-- VHDL Model Created from SGE Symbol qds_adder.sym -- Apr 21 16:44:47 1995

library IEEE;
   use IEEE.std_logic_1164.all;
   use IEEE.std_logic_misc.all;
   use IEEE.std_logic_arith.all;

entity QDS_ADDER is
      Port (      A1 : In    std_logic_vector (6 downto 0);
                  A2 : In    std_logic_vector (6 downto 0);
                   Y : Out   std_logic_vector (6 downto 0) );
end QDS_ADDER;

architecture BEHAVIORAL of QDS_ADDER is

begin

  process(A1, A2)
	variable g0,p0 : std_logic_vector (1 downto 0) ;
	variable g1,p1 : std_logic_vector (1 downto 0) ;
	variable g2,p2 : std_logic_vector (1 downto 0) ;
	variable g3,p3 : std_logic;
	variable c   : std_logic_vector (4 downto 0) ;
	variable cc   : std_logic_vector (1 downto 0) ;
	variable i,j,k,l : integer;
      begin

	cc(0) := '0';

----------------------------------- 1st level -----------------------
	j := 0 ;
	g0(0) := A1(0+j) AND A2(0+j); p0(0) := A1(0+j) OR A2(0+j);
	g1(0) := A1(1+j) AND A2(1+j); p1(0) := A1(1+j) OR A2(1+j);
	g2(0) := A1(2+j) AND A2(2+j); p2(0) := A1(2+j) OR A2(2+j);
	g3    := A1(3+j) AND A2(3+j); p3    := A1(3+j) OR A2(3+j);
	j := 4 ;
	g0(1) := A1(0+j) AND A2(0+j); p0(1) := A1(0+j) OR A2(0+j);
	g1(1) := A1(1+j) AND A2(1+j); p1(1) := A1(1+j) OR A2(1+j);
	g2(1) := A1(2+j) AND A2(2+j); p2(1) := A1(2+j) OR A2(2+j);
----------------------------------- 2nd level -----------------------
        k := 0;
	cc(1) := g3    OR (g2(k) AND p3   ) OR (g1(k) AND p2(k) AND p3   ) 
		       OR (g0(k) AND p1(k) AND p2(k) AND p3   ) ;

-- CARRY -------------------------- 1st level -----------------------
        k := 0;
	c(0) := cc(k);
	c(1) := g0(k) OR (c(0) AND p0(k));
	c(2) := g1(k) OR (g0(k) AND p1(k)) OR (c(0) AND p0(k) AND p1(k));
	c(3) := g2(k) OR (g1(k) AND p2(k)) OR (g0(k) AND p1(k) AND p2(k)) 
		      OR (c(0) AND p0(k) AND p1(k) AND p2(k));
	j := k*4 ;
	for i in 0 to 3 loop
          Y(i+j)  <= A1(i+j) XOR A2(i+j) XOR c(i) ;
	end loop;

        k := 1;
	c(0) := cc(k);
	c(1) := g0(k) OR (c(0) AND p0(k));
	c(2) := g1(k) OR (g0(k) AND p1(k)) OR (c(0) AND p0(k) AND p1(k));
	j := k*4 ;
	for i in 0 to 2 loop
          Y(i+j)  <= A1(i+j) XOR A2(i+j) XOR c(i) ;
	end loop;

    end process;

end BEHAVIORAL;

configuration CFG_QDS_ADDER_BEHAVIORAL of QDS_ADDER is
   for BEHAVIORAL

   end for;

end CFG_QDS_ADDER_BEHAVIORAL;
