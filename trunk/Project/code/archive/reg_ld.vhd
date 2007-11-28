library IEEE;
   use IEEE.std_logic_1164.all;

entity reg_ld is
     GENERIC(n : integer);
      Port (      AS : In    std_logic_vector (n downto 0);
        
               RESET : In    std_logic;
               CLOCK : In    std_logic;
                LOAD : In    std_logic;
                  ZS : Out   std_logic_vector (n downto 0) );
end reg_ld;

architecture BEHAVIORAL of reg_ld is

begin

  process(reset,clock)
      begin

      if ( reset = '0' ) then
	ZS <= (others => '0');
	

      elsif (( clock = '1' ) and (clock'EVENT)) then
           if ( load = '1' ) then
              ZS <= AS ;
              
           end if;
      end if;

  end process;

end BEHAVIORAL;

configuration CFG_reg_ld_BEHAVIORAL of gl_dualreg_ld is
   for BEHAVIORAL
   end for;
end CFG_reg_ld_BEHAVIORAL;
