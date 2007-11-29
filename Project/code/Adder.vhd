-- A generic 3 operand Adder.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ADDER is
port(	
A:	in std_logic_vector(7 downto 0);
B:	in std_logic_vector(7 downto 0);
C:	in std_logic_vector(7 downto 0);
Sum:	out std_logic_vector(7 downto 0)
);
end ADDER;


architecture BEHAVIORAL of ADDER is

 begin
process(A, B, C)
	variable p : std_logic_vector (7 downto 0) ;
	variable g : std_logic_vector (7 downto 0) ;
	variable Y : std_logic_vector (7 downto 0) ;
	variable Cout : std_logic;
	variable i : integer;
begin

for i in 0 to 7 loop
	p(i) := A(i) XOR B(i) ;
	g(i) := A(i) AND B(i) ;
end loop;

-- CARRY -----------------------------------
Y(0) <= 0;
for i in 0 to 6 loop
	Y(i+1) <= g(i) OR (c(i) AND p(i));
end loop;
Cout <= g(n) OR (c(n) AND p(n));



-- SUM -------------------------------------
for i in 0 to 7 loop
	Sum(i) <= p(i) XOR c(i);
end loop;

if (Cout='1') then
	
	Sum(7 downto 0)<='11111111';
end if;


end process;
end BEHAVIORAL;

configuration CFG_ADDER_BEHAVIORAL of ADDER is
	 for BEHAVIORAL
	 end for;
end CFG_ADDER_BEHAVIORAL;

