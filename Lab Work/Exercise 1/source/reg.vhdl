library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity reg is
port (D : in std_logic_vector(23 downto 0);
Clock, Reset : in std_logic;
Q : out std_logic_vector(23 downto 0));
end entity reg;

architecture behavioural of reg is
   begin
   p0: process (Clock, Reset) is
      begin
      if (Reset = '0') then
         Q <= (others => '0');
      elsif rising_edge(Clock) then
         Q <= D;
      end if;
   end process p0;
end architecture behavioural;
