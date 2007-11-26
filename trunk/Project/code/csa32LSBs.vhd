library IEEE;
	 use IEEE.std_logic_1164.all;

entity csa32LSBs is

	Port (	A : In std_logic_vector (7 downto 0);
		B : In std_logic_vector (7 downto 0);
		C : In std_logic_vector (7 downto 0);
		Z : Out std_logic_vector (7 downto 0) );
end csa32LSBs;

architecture BEHAVIORAL of csa32LSBs is

 begin
process(A, B, C)
	variable p : std_logic_vector (7 downto 0) ;
	variable g : std_logic_vector (7 downto 0) ;
	variable i : integer;
begin

for i in 0 to 7 loop
	p(i) := A(i) XOR B(i) ;
	g(i) := A(i) AND B(i) ;
end loop;


-- SUM -------------------------------------
for i in 0 to 7 loop
	Z(i) <= p(i) XOR c(i);
end loop;

end process;
end BEHAVIORAL;

configuration CFG_csa32LSBs_BEHAVIORAL of csa32LSBs is
	 for BEHAVIORAL
	 end for;
end CFG_csa32LSBs_BEHAVIORAL;
