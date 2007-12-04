library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity csa8bit is
	Port (	A : In std_logic_vector (7 downto 0);
		B : In std_logic_vector (7 downto 0);
		C : In std_logic_vector (7 downto 0);
		Cin : In std_logic;
		Cout : Out std_logic;
		Z : Out std_logic_vector (7 downto 0);
		Y : Out std_logic_vector (7 downto 0) );
end csa8bit;

architecture BEHAVIORAL of csa8bit is
   signal aux : std_logic;
  
   
 begin
process(A, B, C, Cin)
	variable p : std_logic_vector (7 downto 0) ;
	variable g : std_logic_vector (7 downto 0) ;
	variable Z_aux : std_logic_vector (7 downto 0) ;
	variable Y_aux : std_logic_vector (7 downto 0) ;
	variable i : integer;
begin

for i in 0 to 7 loop
	p(i) := A(i) XOR B(i) ;
	g(i) := A(i) AND B(i) ;
end loop;

-- CARRY -----------------------------------
Y_aux(0) := Cin;
for i in 0 to 7-1 loop
	Y_aux(i+1) := g(i) OR (c(i) AND p(i));
end loop;
Y(7 downto 0)<=Y_aux(7 downto 0);
aux <= g(7) OR (c(7) AND p(7));
Cout<= aux;

-- SUM -------------------------------------
for i in 0 to 7 loop
	Z_aux(i) := p(i) XOR c(i);
end loop;

if (aux='1') then
   Z_aux(7 downto 0):="11111111";
end if;

for i in 1 to 7 loop
   if (Y_aux(i)='1') then
        Z_aux(7 downto 0):="11111111";
   end if;
end loop;

if(Z_aux(7 downto 0)="11111110" and Cin='1') then
       Z_aux(7 downto 0):="11111111";
   end if;


Z(7 downto 0)<= Z_aux(7 downto 0);

end process;
end BEHAVIORAL;

configuration CFG_csa8bit_BEHAVIORAL of csa8bit is
	 for BEHAVIORAL
	 end for;
end CFG_csa8bit_BEHAVIORAL;
