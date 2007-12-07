library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ADDER_2 is
port(	A : In std_logic_vector (7 downto 0);
		B : In std_logic_vector (7 downto 0);
		Z : Out std_logic_vector (7 downto 0));
end ADDER_2;

architecture BEH_ADDER_2 of ADDER_2 is
   signal sum_out : std_logic_vector(8 downto 0);
   begin	
    
      
   sum_out <= ('0' & A) + ('0' & B);

   Z(0) <= sum_out(8) OR sum_out(0);
   Z(1) <= sum_out(8) OR sum_out(1);
   Z(2) <= sum_out(8) OR sum_out(2);
   Z(3) <= sum_out(8) OR sum_out(3);
   Z(4) <= sum_out(8) OR sum_out(4);
   Z(5) <= sum_out(8) OR sum_out(5);
   Z(6) <= sum_out(8) OR sum_out(6);
   Z(7) <= sum_out(8) OR sum_out(7);

end BEH_ADDER_2;



--architecture BEH_ADDER_2 of ADDER_2 is
--   signal sum_out : unsigned(9 downto 0);
--   begin	
--
--   process(A, B)
--   
--      constant zeros: unsigned(1 downto 0) := (others => '0');
--      variable sum_int: INTEGER;
--      
--   begin
--   sum_out <= (zeros & unsigned(A)) + (zeros & unsigned(B));
--   sum_int := conv_integer(sum_out);
--
--   if(sum_int < 255) then
--      Z <= std_logic_vector(sum_out(7 downto 0)); 
--   else
--      Z <= "11111111";  
--   end if;
--   
--   end process;
--end BEH_ADDER_2;
--
