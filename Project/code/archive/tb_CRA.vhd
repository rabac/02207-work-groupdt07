library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity ADDER_TB is				-- entity declaration
end ADDER_TB;

architecture TB of ADDER_TB is

    component CRA is
    port(	A:	in std_logic_vector(7 downto 0);
		B:	in std_logic_vector(7 downto 0);
		Cin:	in std_logic;
		Cout: out std_logic;
		Y:	out std_logic_vector(7 downto 0)
    );
    end component;

    signal A, B:	std_logic_vector(7 downto 0);
    signal Cin,Cout:	std_logic;
    signal Y:		std_logic_vector(7 downto 0);


    begin

        U_CRA: CRA port map (A, B, Cin, Cout, Y);

    process

	variable err_cnt: integer :=0;

    begin

	-- case 1
	A <= "00000000";
	B <= "00000011";
	Cin<='0'; 
	wait for 10 ns;
	--assert (sum="00") report "Sum Error!" severity error;
	--assert (carry='0') report "Carry Error!" severity error;
	--if (sum/="00" or carry/='0') then
	 --   err_cnt:=err_cnt+1;
	--end if;

 	-- case 2
	A <= "11001111";
	B <= "00110000";
	Cin<='0'; 
	wait for 10 ns;
	--assert (sum="10") report "Sum Error!" severity error;
	--assert (carry='1') report "Carry Error!" severity error;
	--if (sum/="10" or carry/='1') then
	--    err_cnt:=err_cnt+1;
	--end if;

	-- case 3
	A <= "01000000";
	B <= "10000000";
	Cin<='0'; 
	wait for 10 ns;
	--assert (sum="11") report "Sum Error!" severity error;
	--assert (carry='0') report "Carry Error!" severity error;
	--if (sum/="11" or carry/='0') then
	 --   err_cnt:=err_cnt+1;
	--end if;

	-- case 4
	A <= "10111111";
	B <= "01000000";
	Cin<='1'; 
	wait for 10 ns;
	--assert (sum="11") report "Sum Error!" severity error;
	--assert (carry='0') report "Carry Error!" severity error;
	--if (sum/="11" or carry/='0') then
	 --   err_cnt:=err_cnt+1;
	--end if;

	-- case 5
	A <= "11111111";
	B <= "00000001";
	Cin<='0'; 
	wait for 10 ns;
	--assert (sum="10") report "Sum Error!" severity error;
	--assert (carry='0') report "Carry Error!" severity error;
	--if (sum/="10" or carry/='0') then
	 --   err_cnt:=err_cnt+1;
	--end if;



    end process;

end TB;
--------------------------------------------------------------------
configuration CFG_TB of ADDER_TB is
	for TB
	end for;
end CFG_TB;
--------------------------------------------------------------------