-- Rajesh

library IEEE;
   use IEEE.std_logic_1164.all;
   use IEEE.std_logic_misc.all;
   use IEEE.std_logic_signed.all;
   use IEEE.std_logic_arith.all;
   
   entity REG is
	port(
		D : in std_logic_vector(7 downto 0);
		Clock, Reset : in std_logic;
		Q : out std_logic_vector(7 downto 0)
		);
end entity REG;



architecture BEH_REG of REG is
   begin
   p0: process (Clock, Reset) is
      begin
      if (Reset = '0') then
         Q <= (others => '0');
      elsif rising_edge(Clock) then
         Q <= D;
      end if;
   end process p0;
end architecture BEH_REG;
