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


   process(A, B, C)
   
      constant zeros: unsigned(1 downto 0) := (others => '0');
      variable sum_int: INTEGER;
      
   begin
   sum_out <= (zeros & unsigned(A)) + (zeros & unsigned(B)) + (zeros & unsigned(C));
   sum_int := conv_integer(sum_out);
   if(sum_int < 255) then
      Z <= std_logic_vector(sum_out(7 downto 0));
   else
      Z <= "11111111";   
   end if;
   end process;
end BEH_ADDER_3;