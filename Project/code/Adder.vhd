-- A generic 3 operand Adder.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ADDER is
port(		A : In std_logic_vector (7 downto 0);
		B : In std_logic_vector (7 downto 0);
		C : In std_logic_vector (7 downto 0);
		Cin : In std_logic;
		Cout : Out std_logic;
		Z : Out std_logic_vector (7 downto 0);
		Y : Out std_logic_vector (7 downto 0) );
end ADDER;


architecture BEHAVIORAL of ADDER is

 begin
process(A, B, C, Cin)
	variable p : std_logic_vector (7 downto 0) ;
	variable g : std_logic_vector (7 downto 0) ;
	variable i : integer;
begin

for i in 0 to 7 loop
	p(i) := A(i) XOR B(i) ;
	g(i) := A(i) AND B(i) ;
end loop;

-- CARRY -----------------------------------
Y(0) <= Cin;
for i in 0 to 7-1 loop
	Y(i+1) <= g(i) OR (c(i) AND p(i));
end loop;
Cout <= g(7) OR (c(7) AND p(7));


-- SUM -------------------------------------
for i in 0 to 7 loop
	Z(i) <= p(i) XOR c(i);
end loop;

end process;
end BEHAVIORAL;

configuration CFG_ADDER_BEHAVIORAL of ADDER is
	 for BEHAVIORAL
	 end for;
end CFG_ADDER_BEHAVIORAL;

