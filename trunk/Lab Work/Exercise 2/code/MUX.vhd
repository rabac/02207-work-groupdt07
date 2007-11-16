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
       
   -- which signals govern the process block?
   -- think!
   
   process (Q0,Q1,enable) is
      begin
      if (enable = '0') then
	Qmux <= Q0;
      elsif (enable = '1') then
	Qmux <= Q1;

      -- what if we remove the else case? there would be unknown states
      -- in the first four clock cycles
	   else 
	Qmux <= (others => '0');
      end if;
   end process;
end architecture BEH_MUX;

