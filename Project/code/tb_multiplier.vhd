--------------------------------------------------------
-- Test Bench for Mutiplier
-- by Weijun Zhang, 05/2001
--------------------------------------------------------	

library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity TB_multiplier is
end TB_multiplier;

architecture TB of TB_multiplier is

    component Multiplier is
    port(   A, B:  in std_logic_vector(7 downto 0);
	    Z:     out std_logic_vector(7 downto 0)
    );
    end component;

    signal T_num1, T_num2: std_logic_vector(7 downto 0);
    signal T_product: std_logic_vector(7 downto 0);
   -- signal T_prod: std_logic_vector(15 downto 0);
	
    begin											   

	U_UT: Multiplier port map (T_num1, T_num2, T_product);
	
    process
    begin
		
	T_num1 <= "00000011";
	T_num2 <= "00000010";
	wait for 20 ns;
	--assert(T_product="1001") report "Error detected!"
	--severity warning;	  

	T_num1 <= "11110000";
	T_num2 <= "00000010";
	wait for 20 ns;
	--assert(T_product="0000") report "Error detected!"
	--severity warning;	  
		
	T_num1 <= "11111100";
	T_num2 <= "11100000";
	wait for 20 ns;
	--assert(T_product="0100") report "Error detected!"
	--severity warning;	  
		
	T_num1 <= "11111110";
	T_num2 <= "00000001";
	wait for 20 ns;
	--assert(T_product="0110") report "Error detected!"
	--severity warning;	  
		
	wait;
		
    end process;

end TB;

-----------------------------------------------------------
configuration CFG_TB of TB_multiplier is
	for TB
	end for;
end CFG_TB;
-----------------------------------------------------------
