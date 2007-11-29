--------------------------------------------------------
-- Example of doing multiplication showing
-- (1) how to use variable with in process
-- (2) how to use for loop statement
-- (3) algorithm of multiplication
--
-- by Weijun Zhang, 05/2001
--------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;


entity Multiplier is
port(	A, B:	in std_logic_vector(7 downto 0);
	Z: 	out std_logic_vector(7 downto 0)
);
end Multiplier;

architecture BEHAVIORAL of Multiplier is
      signal product_reg: integer;
      signal product: std_logic_vector(17 downto 0);
      signal A_int: NATURAL;
      signal B_int: NATURAL;
begin
process(A, B)


begin

  A_int<= conv_integer(A);
  B_int<= conv_integer(B);
  product_reg<=A_int*B_int;

  
   product<=conv_std_logic_vector(product_reg,18);
   Z<=product(7  downto 0);

  if (product_reg>=256) then
	Z<="11111111";

  end if;

end process;

end BEHAVIORAL;

configuration CFG_Multiplier_BEHAVIORAL of Multiplier is
	 for BEHAVIORAL
	 end for;
end CFG_Multiplier_BEHAVIORAL;