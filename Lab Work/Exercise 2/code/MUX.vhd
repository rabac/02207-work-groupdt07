-- Rajesh

library IEEE;
   use IEEE.std_logic_1164.all;
   use IEEE.std_logic_misc.all;
   use IEEE.std_logic_signed.all;
   use IEEE.std_logic_arith.all;
   
   entity MUX is
	port (
		Q0 : in std_logic_vector(7 downto 0);
		Q1 : in std_logic_vector(7 downto 0);
		enable: in std_logic;
		Qmux : out std_logic_vector(7 downto 0)
		);
end entity MUX;

architecture BEH_MUX of MUX is
   begin
   p1: process (enable) is
      begin
      if (enable = '0') then
	Qmux <= Q0;
      elsif (enable = '1') then
	Qmux <= Q1;
      end if;
   end process p1;
end architecture BEH_MUX;

