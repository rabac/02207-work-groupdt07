-- a simple 256*256 pixel (256*256*8 bits) Memory module
-- arranged in a linear fashion.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity MEMORY is
generic(
	width:	integer:=8;
	depth:	integer:=256*256;
	addr:	integer:=16);
port(	
   Clock:		in std_logic;	
	Enable:		in std_logic;
	Read:		in std_logic;
	Write:		in std_logic;
	Read_Addr:	in std_logic_vector(addr-1 downto 0);
	Write_Addr: 	in std_logic_vector(addr-1 downto 0); 
	Data_in: 	in std_logic_vector(width-1 downto 0);
	Data_out: 	out std_logic_vector(width-1 downto 0)
);
end MEMORY;

--------------------------------------------------------------

architecture BEH_MEMORY of MEMORY is

type memory_type is array (0 to depth-1) of std_logic_vector(width-1 downto 0);
signal tmp_memory: memory_type;

begin	
			   
   -- Read Functional Section
   process(Clock, Read)
   begin
	if (Clock'event and Clock='1') then
	    if Enable='1' then
		   if Read='1' then
		    -- buildin function conv_integer change the type
		    -- from std_logic_vector to integer
		    Data_out <= tmp_memory(conv_integer(Read_Addr)); 
		   else
		    Data_out <= (Data_out'range => 'Z');
		   end if;
	    end if;
	end if;
   end process;

	
   -- Write Functional Section
   process(Clock, Write)
   begin
	if (Clock'event and Clock='1') then
	    if Enable='1' then
		   if Write='1' then
		    tmp_memory(conv_integer(Write_Addr)) <= Data_in;
		   end if;
	    end if;
	end if;
   end process;

end BEH_MEMORY;

configuration CFG_MEMORY_BEHAVIORAL of MEMORY is
	 for BEH_MEMORY
	 end for;
end CFG_MEMORY_BEHAVIORAL;