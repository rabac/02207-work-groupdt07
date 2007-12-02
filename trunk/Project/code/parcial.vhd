library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity parcial is 
   port(   M1: in std_logic_vector(7 downto 0);
           M2: in std_logic_vector(7 downto 0);
           O1: out std_logic_vector(15 downto 0);
           O2: out std_logic_vector(15 downto 0);
           O3: out std_logic_vector(15 downto 0);
           O4: out std_logic_vector(15 downto 0);
           O5: out std_logic_vector(15 downto 0);
           O6: out std_logic_vector(15 downto 0);
           O7: out std_logic_vector(15 downto 0);
           O8: out std_logic_vector(15 downto 0) );
end parcial;

architecture BEHAVIORAL of parcial is
    signal aux: std_logic;
    
    begin
        
    process(M1,M2)
        variable i: integer;
        variable Pa1: std_logic_vector(15 downto 0):="0000000000000000";
        variable Pa2: std_logic_vector(15 downto 0):="0000000000000000";
        variable Pa3: std_logic_vector(15 downto 0):="0000000000000000";
        variable Pa4: std_logic_vector(15 downto 0):="0000000000000000";
        variable Pa5: std_logic_vector(15 downto 0):="0000000000000000";
        variable Pa6: std_logic_vector(15 downto 0):="0000000000000000";
        variable Pa7: std_logic_vector(15 downto 0):="0000000000000000";
        variable Pa8: std_logic_vector(15 downto 0):="0000000000000000";
        
    begin
        
        
        for i in 0 to 7 loop
           
           Pa1(i):= M1(0) AND M2(i);
           Pa2(i+1):=M1(1) AND M2(i);
           Pa3(i+2):=M1(2) AND M2(i);
           Pa4(i+3):=M1(3) AND M2(i);
           Pa5(i+4):=M1(4) AND M2(i);
           Pa6(i+5):=M1(5) AND M2(i);
           Pa7(i+6):=M1(6) AND M2(i);
           Pa8(i+7):=M1(7) AND M2(i);
           
        end loop;
        
        O1(15 downto 0)<= Pa1(15 downto 0);
        O2(15 downto 0)<= Pa2(15 downto 0);
        O3(15 downto 0)<= Pa3(15 downto 0);
        O4(15 downto 0)<= Pa4(15 downto 0);
        O5(15 downto 0)<= Pa5(15 downto 0);
        O6(15 downto 0)<= Pa6(15 downto 0);
        O7(15 downto 0)<= Pa7(15 downto 0);
        O8(15 downto 0)<= Pa8(15 downto 0);
        
        
        
end process;

end BEHAVIORAL;

configuration CFG_parcial_BEHAVIORAL of parcial is
	 for BEHAVIORAL
	 end for;
end CFG_parcial_BEHAVIORAL;