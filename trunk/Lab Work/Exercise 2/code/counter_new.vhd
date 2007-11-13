library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter is
port(	
      clock:	in std_logic;
	   Q:	out std_logic_vector(1 downto 0)
   );
end counter;

architecture beh_counter of counter is		 	  
	
    signal Pre_Q: std_logic_vector(1 downto 0);

begin

    process(clock)
    begin
       if (clock='1' and clock'event) then
	       Pre_Q <= Pre_Q + 1;
	       Q <= Pre_Q;
	    end if;
    end process;	
    
end beh_counter;