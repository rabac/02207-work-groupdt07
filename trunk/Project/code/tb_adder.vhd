library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity ADDER_TB is				-- entity declaration
end ADDER_TB;


architecture TB of ADDER_TB is

    component ADDER is
    port(	A : In std_logic_vector (7 downto 0);
		B : In std_logic_vector (7 downto 0);
		C : In std_logic_vector (7 downto 0);
		Z : Out std_logic_vector (7 downto 0)
    );
    end component;

    signal t_A, t_B, t_C:	std_logic_vector(7 downto 0);
    signal t_Z:		std_logic_vector(7 downto 0);
    
   
    begin

        U_ADDER: ADDER port map (t_A, t_B, t_C, t_Z);
	
    process			
	    
      	variable err_cnt: integer :=0;
    
    begin												  
		
	t_A <= "00000000";							
	t_B <= "00000000";
	t_C <= "00000001";
	wait for 10 ns;

	t_A <= "11111100";							
	t_B <= "01000000";
	t_C <= "00000101";
	wait for 10 ns;												  

	t_A <= "00001000";							
	t_B <= "00000000";
	t_C <= "00000001";
	wait for 10 ns;												  

	t_A <= "11111111";							
	t_B <= "00001111";
	t_C <= "00000001";
	wait for 10 ns;												  
 
 	t_A <= "00000100";							
	t_B <= "00000010";
	t_C <= "00000001";
	wait for 10 ns;


	if (err_cnt=0) then
	    assert false
	    report "Testbench of Adder completed successfully!"
	    severity note;
	else
	    assert true
	    report "Something wrong, try again"
	    severity error;
	end if;
			
	wait;
		
    end process;

end TB;