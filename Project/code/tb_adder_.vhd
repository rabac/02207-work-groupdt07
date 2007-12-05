library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity TB_cra is				-- entity declaration
end TB_cra;


architecture TB of TB_cra is

    component CRA_15 is
    port(		A : In std_logic_vector (15 downto 0);
		B : In std_logic_vector (15 downto 0);
		Cin : In std_logic;
		Cout : Out std_logic;
		Y : Out std_logic_vector (15 downto 0)
    );
    end component;

    signal t_A, t_B, t_Y:	std_logic_vector(15 downto 0);
    signal t_cin,t_cout:		std_logic;
    
   
    begin

        U_ADDER: CRA_15  port map (t_A, t_B, t_cin,t_cout, t_Y);
	
    process			
	    
      	variable err_cnt: integer :=0;
    
    begin												  
		
	t_A <= "0000000000000000";							
	t_B <= "0000000000000000";
	t_cin <= '1';
	wait for 10 ns;

	t_A <= "1111110000000000";							
	t_B <= "0100000000000000";
	t_cin <= '1';
	wait for 10 ns;												  

	t_A <= "0000100000000000";							
	t_B <= "0000000000000000";
	t_cin <= '1';
	wait for 10 ns;												  

	t_A <= "1111111111111111";							
	t_B <= "0000111100000000";
	t_cin <= '1';
	wait for 10 ns;												  
 
 	t_A <= "0000000000000000";							
	t_B <= "0000001011111111";
	t_cin <= '1';
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