library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity CRA_8 is
port(		A : In std_logic_vector (7 downto 0);
		B : In std_logic_vector (7 downto 0);
		Cin : In std_logic;
		Cout : Out std_logic;
		Y : Out std_logic_vector (7 downto 0) );
end CRA_8;

architecture RTL of CRA_8 is 

begin 
    
       process(A,B,Cin)
           
           variable tempC   : std_logic_vector (8 downto 0);
           variable P   : std_logic_vector (7 downto 0);
           variable G   : std_logic_vector (7 downto 0);
           variable Yaux   : std_logic_vector (7 downto 0);
           
           
           begin
               
               tempC(0):= Cin;
               
                  for i in 0 to 7 loop
                  
                     P(i):= A(i) XOR B(i);
                     G(i):= A(i) AND B(i);
                     
                     Yaux(i):= P(i) xor tempC(i);
                     tempC(i+1):=G(i) OR (tempC(i) AND P(i));
                end loop;
                
                if (tempC(8)='1') then
                    Yaux(7 downto 0):= "11111111";
                end if;
                Y(7 downto 0)<= Yaux(7 downto 0);
                Cout<=tempC(8);
                
            end process;
    end RTL;
    
    
    configuration CFG_CRA_8_BEHAVIORAL of CRA_8 is
	 for RTL
	 end for;
end CFG_CRA_8_BEHAVIORAL;