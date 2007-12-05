library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ADDER_3 is
port(	A : In std_logic_vector (7 downto 0);
		B : In std_logic_vector (7 downto 0);
		C : In std_logic_vector (7 downto 0);
		Z : Out std_logic_vector (7 downto 0));
end ADDER_3;

architecture BEH_ADDER_3 of ADDER_3 is
   signal sum_out : unsigned(9 downto 0);
   signal temp : std_logic_vector(7 downto 0);
   signal c2, c1: std_logic;
   begin	

   sum_out <= ("00" & unsigned(A)) + ("00" & unsigned(B)) + ("00" & unsigned(C));
   
   c2 <= std_logic(sum_out(9));
   c1 <= std_logic(sum_out(8));

   temp <= std_logic_vector(sum_out(7 downto 0));
   --temp <= "11111111" when c2 <= '1';
   --temp <= "11111111" when c1 <= '1';
   
   Z <= temp;

end BEH_ADDER_3;