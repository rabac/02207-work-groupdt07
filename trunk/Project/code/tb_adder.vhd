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
		Cin : In std_logic;
		Cout : Out std_logic;
		Z : Out std_logic_vector (7 downto 0);
		Y : Out std_logic_vector (7 downto 0)
    );
    end component;

    signal A, B, C:	std_logic_vector(7 downto 0);
    signal Cin,Cout:	std_logic;
    signal sum1,sum2:		std_logic_vector(7 downto 0);


    begin

        U_ADDER: ADDER port map (A, B,C,Cin,Cout,sum1,sum2);
	
    process			
	
	variable err_cnt: integer :=0;
    
    begin												  
		
	-- case 1
	A <= "00000000";							
	B <= "00000000";
	C <= "00000001";
	Cin <='0';
	wait for 10 ns;
	--assert (sum="00") report "Sum Error!" severity error;
	--assert (carry='0') report "Carry Error!" severity error;
	--if (sum/="00" or carry/='0') then
	--    err_cnt:=err_cnt+1;
	--end if;
		
 	-- case 2 		
	A <= "00100000";							
	B <= "01000000";
	C <= "00000001";
	Cin <='1';
	wait for 10 ns;												  
	--assert (sum="10") report "Sum Error!" severity error;	 
	--assert (carry='1') report "Carry Error!" severity error;
	--if (sum/="10" or carry/='1') then
	--    err_cnt:=err_cnt+1;
	--end if;
		
	-- case 3
	A <= "00001000";							
	B <= "00000000";
	C <= "00000001";
	Cin <='0';
	wait for 10 ns;												  
	--assert (sum="11") report "Sum Error!" severity error;	 
	--assert (carry='0') report "Carry Error!" severity error;
	--if (sum/="11" or carry/='0') then
	--    err_cnt:=err_cnt+1;
	--end if;
		
	-- case 4
	A <= "11111110";							
	B <= "00000001";
	C <= "00000001";
	Cin <='0';
	wait for 10 ns;												  
	--assert (sum="11") report "Sum Error!" severity error;	 
	--assert (carry='0') report "Carry Error!" severity error;
	--if (sum/="11" or carry/='0') then
	--    err_cnt:=err_cnt+1;
	--end if;
		
	-- case 5
	A <= "00000100";							
	B <= "00000010";
	C <= "00000001";
	Cin <='0';
	wait for 10 ns;
	--assert (sum="10") report "Sum Error!" severity error;
	--assert (carry='0') report "Carry Error!" severity error;
	--if (sum/="10" or carry/='0') then
	--    err_cnt:=err_cnt+1;
	--end if;
		
	-- summary of testbench
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
--------------------------------------------------------------------
configuration CFG_TB of ADDER_TB is
	for TB
	end for;
end CFG_TB;
--------------------------------------------------------------------