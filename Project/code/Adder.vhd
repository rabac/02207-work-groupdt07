-- A generic 3 operand Adder.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ADDER is
port(	
A:	in std_logic_vector(7 downto 0);
B:	in std_logic_vector(7 downto 0);
C:	in std_logic_vector(7 downto 0);
Sum:	out std_logic_vector(7 downto 0)
);
end ADDER;


architecture BEH_ADDER of ADDER is
signal result: std_logic_vector(8 downto 0);
begin					  
    result <= ('0' & A)+('0' & B);
    Sum <= result(7 downto 0);
end BEH_ADDER;